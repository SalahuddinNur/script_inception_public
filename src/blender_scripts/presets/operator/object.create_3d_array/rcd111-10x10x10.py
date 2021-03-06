import bpy
op = bpy.context.active_operator

op.method = 'three_arrays'
op.array_X_positive = True
op.array_X_positive_size = 7
op.array_Y_positive = True
op.array_Y_positive_size = 4
op.array_Z_positive = True
op.array_Z_positive_size = 3
op.array_X_negative = False
op.array_X_negative_size = 7
op.array_Y_negative = False
op.array_Y_negative_size = 4
op.array_Z_negative = False
op.array_Z_negative_size = 3
op.e1_vec3 = (0.7071067690849304, 0.0, 0.0)
op.e2_vec3 = (0.0, 1.2247449159622192, 0.0)
op.e3_vec3 = (0.0, 0.0, 1.7320507764816284)
op.use_scale = False
op.apply_scale = False
