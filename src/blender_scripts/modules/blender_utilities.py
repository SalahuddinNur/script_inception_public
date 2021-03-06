#!/usr/bin/env python3
# -*- coding: utf-8 -*-

###############################
# UTILITY FUNCTIONS
###############################
# TODO: Function to align an object with an axis
# TODO: Make sure rotation matrix is correct
# TODO: Should not be added to blender dir by setup scripts.

bl_info = {"name":"blender_utilities", "category": "User"}

# Utility functions for Blender scripts

import bpy
import math
import bmesh
import warnings
import collections
from bpy_extras import object_utils
from numpy import pi, cos, sin
from mathutils import Vector, Matrix, Color

###################
def createBmeshFrompyData(verts_loc, edges, faces):
    '''
    Create a simple **bmesh** based on verts_loc, edges, faces lists, i.e. so called *pyData*.
    
    If you have a variable of the form pyData = (verts_loc, edges, faces), you can call the function using Python's argument unpacking functionality as follows::
    
      createBmeshFrompyData(*pyData)
    '''

    bm = bmesh.new()
    
    for v_co in verts_loc:
        bm.verts.new(v_co)

    # blender 2.73+ fix
    if bpy.app.version >= (2, 73, 0):
        bm.verts.ensure_lookup_table()
    else:
        bm.verts.index_update()
    
    for e_idx in edges:
        bm.edges.new([bm.verts[i] for i in e_idx])
    
    for f_idx in faces:
        bm.faces.new([bm.verts[i] for i in f_idx])
    
    return(bm)

def createMeshFrompyData(pyData, mesh_name='mesh'):
    '''
    Create a simple mesh using pyData directly.
    
    .. note:: Instead of using this function, you can just use the Blender built-in function **from_pydata**.
    
      Example::
      
        mesh = bpy.data.meshes.new(name="New Object Mesh")
        mesh.from_pydata(verts, edges, faces)
        # useful for development when the mesh may be invalid.
        # mesh.validate(verbose=True)
        object_data_add(context, mesh, operator=self)
    '''
    
    warnings.warn('DEPRECATED: This function is deprecated. Please use the Blender built-in function **from_pydata** instead.', DeprecationWarning)
    
    mesh = bpy.data.meshes.new(mesh_name)
    bm = createBmeshFrompyData(*pyData)
    bm.to_mesh(mesh)
    mesh.update()
    return mesh

def createMesh(pyDataGenerator, mesh_name='mesh'):
    '''
    create a simple mesh using a pyData generator function (seems a bit pointless now... ^^)
    '''
    warnings.warn('DEPRECATED: This function is deprecated. Please use the Blender built-in function **from_pydata** instead.', DeprecationWarning)
    return createMeshFrompyData(pyDataGenerator(), mesh_name)

def createObjectFromMesh(mesh, object_name='object', operator=None, context=bpy.context):
    '''
    create a simple object from a mesh
    '''
    
    object_utils.object_data_add(context, mesh, operator=operator)
    #object_utils.object_data_add(context, mesh)
    obj = context.scene.objects.active
    #print(obj)
    obj.name = object_name
    return (obj,mesh)

def createMeshFromBmesh(bm, mesh_name='mesh'):
    mesh = bpy.data.meshes.new(mesh_name)
    bm.to_mesh(mesh)
    mesh.update()
    return mesh

def createObjectFromBmesh(bm, object_name='object', mesh_name='mesh', operator=None, context=bpy.context):
    mesh = createMeshFromBmesh(bm, mesh_name)
    (obj,mesh) = createObjectFromMesh(mesh, object_name, operator=operator, context=context)
    return (obj,mesh)

def addSimpleObject(pyDataGenerator, object_name='object', mesh_name='mesh', context=bpy.context, operator=None):
    '''
    add a simple object
    '''
    mesh = createMesh(pyDataGenerator, mesh_name)
    (obj,mesh) = createObjectFromMesh(mesh, object_name, context=context, operator=operator)
    return (obj,mesh)

###################
def addToBmesh(bm_dst, bm_src):
    '''
    Utility function to add one bmesh **bm_src** to another bmesh **bm_dst**.
    
    :param bmesh bm_dst: the destination bmesh to add to
    :param bmesh bm_src: the source bmesh to add
    
    :return: (verts, edges, faces), lists of the vertices, edges and faces added to **bm_dst**. The items in the lists are of type *bmesh.types.BMVert*, *bmesh.types.BMEdge*, *bmesh.types.BMFace*.
    '''

    # update indices
    for idx,v in enumerate(bm_src.verts):
        v.index = idx + len(bm_dst.verts)
    
    verts = []
    edges = []
    faces = []
    # add pyData from bmesh
    for v in bm_src.verts:
        verts.append(bm_dst.verts.new(v.co))

    # blender 2.73+ fix
    if bpy.app.version >= (2, 73, 0):
        bm_dst.verts.ensure_lookup_table()
    else:
        bm_dst.verts.index_update()

    for e in bm_src.edges:
        edges.append(bm_dst.edges.new([bm_dst.verts[i] for i in [i.index for i in e.verts] ]))

    for f in bm_src.faces:
        faces.append(bm_dst.faces.new([bm_dst.verts[i] for i in [i.index for i in f.verts] ]))

    return verts, edges, faces

###################
# Converts a faceCoords list of the form [(vec3, vec3, ...), (vec3, vec3, ...), ...] into a list of vertex indices of the form [(i,j,...),(k,l,...),...] based on a list of vertices verts of the form [vec3, vec3, ...]
def faceCoordsToIndices(faceCoords, verts):
    faceIndices = []
    for f in faceCoords:
        faceIndices.append( list((verts.index(p) for p in f)) )
    return faceIndices
###################
def getTetraHedron(P0,P1,P2,P3):
    verts=[P0,P1,P2,P3]
    facesCoords_tetra = [(P2, P1, P0),
             (P0, P1, P3),
             (P1, P2, P3),
             (P2, P0, P3)]

    faceIndices = faceCoordsToIndices(facesCoords_tetra, verts)

    return verts, faceIndices

def getPyDataHexagon(noFaces=False):
    verts_loc = []
    edges = []
    faces = []
    
    N = 6
    for i in range(N):
        theta = i*(2*pi/N)
        verts_loc.append([cos(theta), sin(theta),0])
        if noFaces:
            edges.append((i,(i+1)%N))
        
    if not noFaces:
        faces.append(range(N))
        
    return (verts_loc, edges, faces)

def getPyDataTetraHedron():
    edges = []
    verts_loc, faces = getTetraHedron((1,0,0),(0,1,0),(0,0,1),(1,1,1))
    return (verts_loc, edges, faces)

###########
def duplicateObject(obj, linked=True, translation_vector = (0,0,0), context=bpy.context):
  ''' Duplicate an object and return the created duplicate. '''
  bpy.ops.object.select_all(action = 'DESELECT')
  obj.select = True
  context.scene.objects.active = obj
  if linked:
    bpy.ops.object.duplicate_move_linked(TRANSFORM_OT_translate={"value":translation_vector})
  else:
    bpy.ops.object.duplicate_move(TRANSFORM_OT_translate={"value":translation_vector})
  duplicate = context.object
  return duplicate

def createGroup(obj_list, active_object=None, context = bpy.context, group_name=None):
  selectObjects(obj_list, active_object=active_object, context = bpy.context)
  if group_name:
    bpy.ops.group.create(name=group_name)
  else:
    bpy.ops.group.create()
  return

def selectObjects(obj_list, active_object=None, context = bpy.context):

  if not isinstance(obj_list, collections.Iterable):
    obj_list = [obj_list]
  
  bpy.ops.object.select_all(action = 'DESELECT')
  for obj in obj_list:
    obj.select = True
  if active_object:
    context.scene.objects.active = active_object
  return

def setOrigin(obj, loc):
    # store cursor location
    orig_cursor = bpy.context.scene.cursor_location.copy()
    # move cursor
    bpy.context.scene.cursor_location = loc
    # select object
    selectObjects([obj])
    # change origin
    bpy.ops.object.origin_set(type='ORIGIN_CURSOR')
    # restore cursor location
    bpy.context.scene.cursor_location = orig_cursor

def grid_index(Nx, Ny, Nz, i, j, k):
    return (Ny*Nz*i + Nz*j + k)

def Orthogonal(vec):
    # ..todo:: create Blender independent version and just use Vector() for input/output conversion when calling the function...
    vec = Vector(vec)
    xx = abs(vec.x)
    yy = abs(vec.y)
    zz = abs(vec.z)
    if (xx < yy):
        if xx < zz:
            return Vector([0,vec.z,-vec.y])
        else:
            return Vector([vec.y,-vec.x,0])
    else:
        if yy < zz:
            return Vector([-vec.z,0,vec.x])
        else:
            return Vector([vec.y,-vec.x,0])

def rotationMatrix(axis_point, axis_direction, angle_degrees):
  ''' return a rotation matrix for a rotation around an arbitrary axis '''
  axis = Vector([axis_direction[0],axis_direction[1],axis_direction[2]])
  C = Vector([axis_point[0],axis_point[1],axis_point[2]])
  T = Matrix.Translation(C)
  Tinv = Matrix.Translation(-C)
  R = Matrix.Rotation(math.radians(angle_degrees), 4, axis)
  return T*R*Tinv

def loadBasicMaterials():
  '''
  Define some basic materials for easy "coloring".
  '''
  if 'red' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('red')
    material.diffuse_color = Color((1, 0, 0))
  if 'green' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('green')
    material.diffuse_color = Color((0, 1, 0))
  if 'blue' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('blue')
    material.diffuse_color = Color((0, 0, 1))

  if 'cyan' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('cyan')
    material.diffuse_color = Color((0, 1, 1))
  if 'magenta' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('magenta')
    material.diffuse_color = Color((1, 0, 1))
  if 'yellow' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('yellow')
    material.diffuse_color = Color((1, 1, 0))

  if 'black' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('black')
    material.diffuse_color = Color((0, 0, 0))
  if 'white' not in [i.name for i in bpy.data.materials]:
    material = bpy.data.materials.new('white')
    material.diffuse_color = Color((1, 1, 1))

def joinObjects(obj_list, origin=None, name=None, context = bpy.context):
  ''' Joins the objects from *obj_list* into a single object, sets the origin to *origin*, names the new object *name* and returns it.'''
  
  selectObjects(obj_list, active_object=None, context = context)
  bpy.ops.object.join()
  
  obj = context.active_object
  if name:
    obj.name = name
  if origin is not None:
    setOrigin(obj, origin)
  return(obj)

def add_array_modifier(obj, label, size, vec3):
  ''' Simple function to simplify creating arrays. '''
  array_mod = obj.modifiers.new(label, 'ARRAY')
  array_mod.count = size
  array_mod.use_constant_offset = True
  array_mod.use_relative_offset = False
  array_mod.constant_offset_displace = vec3

if __name__ == '__main__':
  pass
