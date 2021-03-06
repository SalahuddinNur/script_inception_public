% simple script to test prn conversion from partial and full snapshots in all planes

%dirlist = {'mini-box-centered', 'mini-box-centered-X', 'mini-box-centered-Y', 'mini-box-centered-Z', 'mini-box-offset', 'mini-box-offset-X', 'mini-box-offset-Y', 'mini-box-offset-Z', 'slice_x', 'slice_y', 'slice_z'};

dirlist = {'mini-box-centered', ...
  'mini-box-centered-X', ...
  'mini-box-centered-Y', ...
  'mini-box-centered-Z', ...
  'mini-box-offset', ...
  'mini-box-offset-X', ...
  'mini-box-offset-Y', ...
  'mini-box-offset-Z', ...
  'slice_x', ...
  'slice_y', ...
  'slice_z', ...
  'mini-box-centre-to-upper-X', ...
  'mini-box-lower-to-centre-X', ...
  'mini-box-centre-to-upper-Y', ...
  'mini-box-lower-to-centre-Y', ...
  'mini-box-centre-to-upper-Z', ...
  'mini-box-lower-to-centre-Z', ...
  'MV-full-X', ...
  'MV-full-Y', ...
  'MV-full-Z', ...
  'MV-lower-to-centre-X', ...
  'MV-lower-to-centre-Y', ...
  'MV-lower-to-centre-Z', ...
  'MV-centre-to-upper-X', ...
  'MV-centre-to-upper-Y', ...
  'MV-centre-to-upper-Z', ...
  'buggy-X-snapshots', ...
  'MV', ...
};

orig_dir = pwd();

for i = 1:length(dirlist)
  BASE = dirlist{i};
  cd(orig_dir);
  cd(BASE);
  disp(['==> ', pwd()]);
  prnToh5_epsilon({[BASE, '.inp']}, [BASE, '-fdtd2014.h5'], 'overwrite', true, 'show_figure', false);
end

cd(orig_dir);
