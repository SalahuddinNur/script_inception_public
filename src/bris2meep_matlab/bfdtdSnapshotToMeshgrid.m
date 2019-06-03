function [X,Y,Z,V] = bfdtdSnapshotToMeshgrid(data_esnap, column_1_esnap, column_2_esnap, snap_plane_position, snap_plane_orientation)

  % [header_esnap, data_esnap, column_1_esnap, column_2_esnap] = readPrnFile(Snaps{m}.epsFile, 'verbosity', p.Results.verbosity);
  % [header_fsnap, data_fsnap, ui_fsnap, uj_fsnap] = readPrnFile(Snaps{m}.fsnapFile, 'verbosity', p.Results.verbosity);

  %reshape (1:10,2,5)
                                                    %ans =

                                                        %1    3    5    7    9
                                                        %2    4    6    8   10
                                                        
  %>> size(data_esnap)
                                                    %ans =

                                                        %81   201

  %>> size(column_1_esnap)
                                                    %ans =

                                                       %201     1

  %>> size(column_2_esnap)
                                                    %ans =

                                                       %81    1
  %A=reshape (1:10,2,5)
                                                    %A =

                                                        %1    3    5    7    9
                                                        %2    4    6    8   10

  %>> reshape(A,5,2)
                                                    %ans =

                                                        %1    6
                                                        %2    7
                                                        %3    8
                                                        %4    9
                                                        %5   10

  switch snap_plane_orientation
    case 'x'
      % data_esnap(iy,ix)
      [X,Y,Z] = meshgrid(snap_plane_position, column_1_esnap, column_2_esnap);
      
                                                           %60    1   80
                                                           %y     x   z
      
      V = reshape(data_esnap', length(column_1_esnap), 1, length(column_2_esnap));
      
      surf(Y, Z, V);
      
    case 'y'
      disp('y')
    case 'z'
      disp('z')
    otherwise
      error('invalid snap_plane_orientation');
  end
  
  size(X)
  size(V)
  
  %surf()
  
  return
  
  size(data_esnap), snap_plane, new_permittivity, object
  
  Snaps{m}.pos
  
  if strcmp(snap_plane_orientation,'x')
    % k->plane->x, j->col1->y, i->col2->z
    x = Snaps{m}.pos;
    y = column_1_esnap(column_1_index);
    z = column_2_esnap(column_2_index);
  elseif strcmp(snap_plane_orientation,'y')
    % k->plane->y, j->col1->x, i->col2->z
    x = column_1_esnap(column_1_index);
    y = Snaps{m}.pos;
    z = column_2_esnap(column_2_index);
  else
    % k->plane->z, j->col1->x, i->col2->y
    x = column_1_esnap(column_1_index);
    y = column_2_esnap(column_2_index);
    z = Snaps{m}.pos;
  end

end
