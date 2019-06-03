import bpy
from numpy import sqrt

op = bpy.context.active_operator

op.method = 'start_and_end'
op.start_point = (0.0, 0.0, 0.0)
op.end_point = (0,   sqrt(6)/4,  7*sqrt(3)/12)
op.cone_length = 0.20000000298023224
op.cone_radius = 0.05000000074505806
op.cylinder_radius = 0.02500000037252903
