function writeMEEP(structured_entries, DSTDIR, BASENAME)
  %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % writes out MEEP files based on structured_entries input
    % function writeMEEP(structured_entries, DSTDIR, BASENAME)
  %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%
    % structured_entries = 

              % all_snapshots: [1x3 struct]
             % time_snapshots: [1x2 struct]
        % frequency_snapshots: [1x1 struct]
                % excitations: [1x1 struct]
                      % xmesh: [4x1 double]
                      % ymesh: [3x1 double]
                      % zmesh: [2x1 double]
                       % flag: [1x1 struct]
                 % boundaries: [1x6 struct]
                 % box
                 % sphere_list
    %%%%%%%%%%%%%%%%%%%%%%%

    if exist('BASENAME','var')==0
    disp('BASENAME not given');
      BASENAME = 'unknown';
  end
  
  if exist('DSTDIR','var')==0
    disp('DSTDIR not given');
      DSTDIR = uigetdir('H:\DATA','DSTDIR');
  end
  if ~(exist(DSTDIR,'dir'))
    error(['dir ',DSTDIR,' not found']);
  end
  mkdir([DSTDIR,filesep,BASENAME]);

    disp('----->Writing MEEP file...');    
    
    %%%%%%%%%%%%%%%%%%%%%%%
    % .ctl file
  FILE = fopen([DSTDIR,filesep,BASENAME,filesep,BASENAME,'.ctl'],'wt');
    
    % Box
    MEEP_box(FILE, structured_entries.box.lower, structured_entries.box.upper);

    % Sphere
    for idx=1:length(structured_entries.sphere_list)
        sphere = structured_entries.sphere_list(idx);
        MEEP_sphere(FILE, sphere.center, sphere.outer_radius, sphere.inner_radius, sphere.permittivity, sphere.conductivity);
    end
    
    % Block
    for idx=1:length(structured_entries.block_list)
        block = structured_entries.block_list(idx);
        MEEP_block(FILE, block.lower, block.upper, block.permittivity, block.conductivity);
    end
    
    % Cylinder
    for idx=1:length(structured_entries.cylinder_list)
        cylinder = structured_entries.cylinder_list(idx);
        MEEP_cylinder(FILE, cylinder.center,cylinder.inner_radius,cylinder.outer_radius,cylinder.height,cylinder.permittivity,cylinder.conductivity,cylinder.angle);
    end

    % Rotation
    for idx=1:length(structured_entries.rotation_list)
        rotation = structured_entries.rotation_list(idx);
        MEEP_rotation(FILE, rotation.axis_point, rotation.axis_direction, rotation.angle_degrees);
    end
    
    % Excitation
    for idx=1:length(structured_entries.excitations)
      excitation = structured_entries.excitations(idx);
      % TODO: STOP THIS MADNESS OF SO MANY PARAMETERS!!! Learn object oriented matlab/octave programming.
      MEEP_excitation(FILE, excitation.current_source, excitation.P1, excitation.P2,...
      excitation.E, excitation.H, excitation.type, excitation.time_constant, excitation.amplitude,...
      excitation.time_offset, excitation.frequency, excitation.param1, excitation.param2,...
      excitation.template_filename,...
      excitation.template_source_plane,...
      excitation.template_target_plane,...
      excitation.template_direction,...
      excitation.template_rotation);
    end

    % TODO: Make those functions also accept structures as entries to simplify code
    % Boundaries
    MEEP_boundary(FILE, structured_entries.boundaries(1).type, structured_entries.boundaries(1).position,...
    structured_entries.boundaries(2).type, structured_entries.boundaries(2).position,...
    structured_entries.boundaries(3).type, structured_entries.boundaries(3).position,...
    structured_entries.boundaries(4).type, structured_entries.boundaries(4).position,...
    structured_entries.boundaries(5).type, structured_entries.boundaries(5).position,...
    structured_entries.boundaries(6).type, structured_entries.boundaries(6).position);
    
    % Flag
    MEEP_flag(FILE, structured_entries.flag.iMethod, structured_entries.flag.propCons,...
    structured_entries.flag.flagOne, structured_entries.flag.flagTwo, structured_entries.flag.numSteps,...
    structured_entries.flag.stabFactor, structured_entries.flag.id);
    
    % Mesh
    MEEP_mesh(FILE, structured_entries.xmesh,structured_entries.ymesh,structured_entries.zmesh);

    % Time_snapshot (time or EPS)
    for idx=1:length(structured_entries.time_snapshots)
        time_snapshot = structured_entries.time_snapshots(idx);
        MEEP_time_snapshot(FILE, time_snapshot.first, time_snapshot.repetition,...
        time_snapshot.plane, time_snapshot.P1, time_snapshot.P2, time_snapshot.E, time_snapshot.H, time_snapshot.J,...
        time_snapshot.power, time_snapshot.eps);
    end
    
    % Frequency_snapshot
    for idx=1:length(structured_entries.frequency_snapshots)
        frequency_snapshot = structured_entries.frequency_snapshots(idx);
        MEEP_frequency_snapshot(FILE, frequency_snapshot.first, frequency_snapshot.repetition, frequency_snapshot.interpolate,...
        frequency_snapshot.real_dft, frequency_snapshot.mod_only, frequency_snapshot.mod_all, frequency_snapshot.plane,...
        frequency_snapshot.P1, frequency_snapshot.P2, frequency_snapshot.frequency, frequency_snapshot.starting_sample,...
        frequency_snapshot.E, frequency_snapshot.H, frequency_snapshot.J);
    end
    
    % Probe
    for idx=1:length(structured_entries.probe_list)
        probe = structured_entries.probe_list(idx);
        MEEP_probe(FILE, probe.position, probe.step, probe.E, probe.H, probe.J, probe.pow );
    end

  fclose(FILE);
    %%%%%%%%%%%%%%%%%%%%%%%
    
    disp('...all done');

end
