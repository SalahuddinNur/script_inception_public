#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ..todo:: Add vectors+unit-cell for lattice+reciprocal lattice (with centered/non-centered origin option?)
# ..todo:: multi-file import? (need better grouping first)

bl_info = {
    'name': 'Import MEEP files (.out, .ctl)',
    'author': 'mtav',
    'version': (0, 0, 1),
    'blender': (2, 76, 0),
    'location': 'File > Import > MEEP (.out, .ctl)',
    'description': 'Import geometry from MEEP files (.out, .ctl)',
    'warning': '',
    'wiki_url': '',
    'tracker_url': '',
    'category': 'Import-Export',
    }

import os
import sys
import numpy
import argparse
import MEEP.MEEP_parser
from blender_scripts.modules.blender_utilities import selectObjects
import blender_scripts.modules.FDTDGeometryObjects as FDTDGeometryObjects

import bpy
import bmesh
# ImportHelper is a helper class, defines filename and
# invoke() function which calls the file selector.
from bpy_extras.io_utils import ImportHelper
from bpy.props import StringProperty, BoolProperty, EnumProperty, FloatProperty
from bpy.types import Operator
from bpy_extras.object_utils import AddObjectHelper, object_data_add
from blender_scripts.modules.GeometryObjects import add_arrow, add_lattice_vectors, add_lattice_cell, add_lattice_objects

class Import_MEEP_data(Operator, ImportHelper, AddObjectHelper):
    """This appears in the tooltip of the operator and in the generated docs"""
    bl_idname = "import_meep.meep"  # important since its how bpy.ops.import_meep.meep is constructed
    bl_label = "Import MEEP data"
    bl_options = {'REGISTER', 'UNDO', 'PRESET'}

    # ImportHelper mixin class uses this
    filename_ext = ".out"

    filter_glob = StringProperty(
            default="*.out;*.ctl",
            options={'HIDDEN'},
            )

    bool_cone_length_automatic = BoolProperty(name="Automatic cone length", default=True)
    cone_length = FloatProperty(
            name="cone_length",
            default=1/5.0,
            description="cone length",
            )

    bool_cone_radius_automatic = BoolProperty(name="Automatic cone radius", default=True)
    cone_radius = FloatProperty(
            name="cone_radius",
            default=1/20.0,
            description="cone radius",
            )

    bool_cylinder_radius_automatic = BoolProperty(name="Automatic cylinder radius", default=True)
    cylinder_radius = FloatProperty(
            name="cylinder_radius",
            default=1/40.0,
            description="cylinder radius",
            )

    def draw(self, context):
        layout = self.layout
        box = layout.box()
        box.prop(self, 'bool_cone_length_automatic')
        if not self.bool_cone_length_automatic:
          box.prop(self, 'cone_length')
        
        box.prop(self, 'bool_cone_radius_automatic')
        if not self.bool_cone_radius_automatic:
          box.prop(self, 'cone_radius')
        
        box.prop(self, 'bool_cylinder_radius_automatic')
        if not self.bool_cylinder_radius_automatic:
          box.prop(self, 'cylinder_radius')

    def execute(self, context):
      importer = Importer()
      importer.filepath = self.filepath
      importer.context = context
      importer.operator = self
      
      # set arrow parameters
      if self.bool_cone_length_automatic:
        importer.cone_length = None
      else:
        importer.cone_length = self.cone_length
      
      if self.bool_cone_radius_automatic:
        importer.cone_radius = None
      else:
        importer.cone_radius = self.cone_radius
      
      if self.bool_cylinder_radius_automatic:
        importer.cylinder_radius = None
      else:
        importer.cylinder_radius = self.cylinder_radius
      
      return importer.execute()

# Only needed if you want to add into a dynamic menu
def menu_func_import(self, context):
    self.layout.operator(Import_MEEP_data.bl_idname, text="MEEP (.out, .ctl)")

def register():
    bpy.utils.register_class(Import_MEEP_data)
    bpy.types.INFO_MT_file_import.append(menu_func_import)

def unregister():
    bpy.utils.unregister_class(Import_MEEP_data)
    bpy.types.INFO_MT_file_import.remove(menu_func_import)

class Importer():
  # .. todo:: Try to integrate this into MEEP_parser.py somehow if possible (import bpy&co only when needed)
  # .. todo:: Deal with inifinite sizes by restricting them to the simulation box size or some other reasonable default.
  filepath = None
  cone_length = None # 1/5.0
  cone_radius = None # 1/20.0
  cylinder_radius = None # 1/40.0
  context = bpy.context
  operator = None
  
  def __init__(self):
    return
  
  def execute(self):
    print("running read_meep...")
    filepath_basename = os.path.basename(self.filepath)
    (root, ext) = os.path.splitext(self.filepath)
    if ext == '.ctl':
      (MEEP_data_list, geo_list) = MEEP.MEEP_parser.getInfoFromCTL(self.filepath)
    else:
      with open(self.filepath) as infile:
        MEEP_data_list = MEEP.MEEP_parser.parse_MEEP(infile)
        geo_list = MEEP.MEEP_parser.parseGeometry(infile)
      
    for idx, MEEP_data_object in enumerate(MEEP_data_list):
      print('=== dataset {} ==='.format(idx))
      
      name = 'k-points-{}-{}'.format(filepath_basename, idx)
      
      # add lattice+reciprocal lattice basis vectors+cells
      (a0,a1,a2) = MEEP_data_object.getLatticeVectors()
      (b0,b1,b2) = MEEP_data_object.getReciprocalLatticeVectors()
      
      # add_lattice_objects(self, a0, a1, a2, b0, b1, b2, name = name+'-lattice_objects',
                          # cone_length=self.cone_length,
                          # cone_radius=self.cone_radius,
                          # cylinder_radius=self.cylinder_radius)
      obj_lat_shifted_cell = add_lattice_cell(self, a0, a1, a2, name='lattice_cell-shifted', shift_origin=True, wiremode=True)

      
      # add k-point path and sphere following it
      L = MEEP_data_object.get_kpoints_in_cartesian_coordinates()
      if len(L)>0:
        for i in L:
          print(i)
        
        mesh = bpy.data.meshes.new(name)

        bm = bmesh.new()

        for v_co in L:
          bm.verts.new(v_co)

        bm.verts.ensure_lookup_table()
        for i in range(len(L)-1):
          bm.edges.new([bm.verts[i], bm.verts[i+1]])

        bm.to_mesh(mesh)
        mesh.update()

        object_data_add(self.context, mesh, operator=self.operator)
        bpy.ops.object.convert(target='CURVE')
        
        k_points_path_object = self.context.active_object
        k_points_path_object.name = name+'-path'

        print('Adding animation...')
        k_points_path_object.data.use_path = True
        scene = self.context.scene
        k_points_path_object.data.path_duration = scene.frame_end - scene.frame_start

        bpy.ops.mesh.primitive_uv_sphere_add()
        S = self.context.active_object
        S.name = name+'-sphere'
        L = numpy.power(MEEP_data_object.getReciprocalCellVolume(), 1/3)
        S.scale = 3*[L/20]

        # add a constraint to it
        constraint = S.constraints.new('FOLLOW_PATH')
        constraint.target = k_points_path_object

        #bpy.ops.object.constraint_add(type='FOLLOW_PATH')
        #C = S.constraints[-1]
        #C.target = k_points_path_object
        #selectObjects([S], active_object=S, context=self.context)
        #bpy.ops.constraint.followpath_path_animate(constraint="Follow Path", owner='OBJECT')

        override = {'constraint':constraint}
        bpy.ops.constraint.followpath_path_animate(override,constraint='Follow Path')

        selectObjects([k_points_path_object], active_object=k_points_path_object, context=self.context)

      else:
        print('no k-points found')

    # we create an instance of the FDTDGeometryObjects class, which allows adding objects to the scene with shared materials (TODO: maybe find a better system?)
    FDTDGeometryObjects_obj = FDTDGeometryObjects.FDTDGeometryObjects()
    FDTDGeometryObjects_obj.addGeometryObjects(geo_list)

    print('FINISHED')
    return {'FINISHED'}

    ## create the empty
    #newempty = bpy.data.objects.new('empty_'+curve.name, None)
    #newempty.empty_draw_type = 'ARROWS'
    ## link it to the current scene
    #bpy.context.scene.objects.link(newempty)

    # TODO: path animation with arrow :) + maybe auto-BZ add?
    # TODO: use k-points from pre-run output, i.e. in (x,y,z) format (that way, no need to wait for run to finish)

    # path building:
    #>>> print(d.splines[0].points[0])
    #<bpy_struct, SplinePoint at 0x7f37627a0b88>

    #>>> print(d.splines[0].points[0].co)
    #<Vector (-2.0000, 0.0000, 0.0000, 1.0000)>

    #>>> print(d.splines[0].points[1].co)
    #<Vector (-1.0000, 0.0000, 0.0000, 1.0000)>

    #>>> print(d.splines[0].points[2].co)
    #<Vector (0.0000, 0.0000, 0.0000, 1.0000)>

    #>>> print(d.splines[0].points[3].co)
    #<Vector (1.0000, 0.0000, 0.0000, 1.0000)>

    #>>> print(d.splines[0].points[4].co)
    #<Vector (2.0000, 0.0000, 0.0000, 1.0000)>

    #>>> print(d.splines[0].points[5].co)
    #Traceback (most recent call last):
      #File "<blender_console>", line 1, in <module>
    #IndexError: bpy_prop_collection[index]: index 5 out of range, size 5

    #>>> d
    #bpy.data.curves['NurbsPath']

def main():
  print('sys.argv=' + str(sys.argv))
  print('len(sys.argv)=' + str(len(sys.argv)))

  parser = argparse.ArgumentParser()
  parser.add_argument('filename', nargs='+')
  args = parser.parse_args(sys.argv[4:])
  print(sys.argv[4:])
  print(args)
  
  for i in args.filename:
    importer = Importer()
    importer.filepath = i
    importer.execute()

  return

if __name__ == "__main__":
    main()
    #register()

    ## test call
    #bpy.ops.import_meep.meep('INVOKE_DEFAULT')
