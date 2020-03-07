function data_structure = FIS_plotMeasurementData(filename, startRow, endRow)
  % plots CSV data extracted from Origin file.

  if exist('filename','var')==0
    filename = uigetfile('*.csv');
  end

  %% Initialize variables.
  delimiter = ';';
  if nargin<=2
      startRow = 1;
      endRow = inf;
  end

  %% Read columns of data as text:
  % For more information, see the TEXTSCAN documentation.
  formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

  %% Open the text file.
  fileID = fopen(filename,'r');

  %% Read columns of data according to the format.
  % This call is based on the structure of the file used to generate this
  % code. If an error occurs for a different file, try regenerating the code
  % from the Import Tool.
  dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
  for block=2:length(startRow)
      frewind(fileID);
      dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
      for col=1:length(dataArray)
          dataArray{col} = [dataArray{col};dataArrayBlock{col}];
      end
  end

  %% Close the text file.
  fclose(fileID);

  %% Convert the contents of columns containing numeric text to numbers.
  % Replace non-numeric text with NaN.
  raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
  for col=1:length(dataArray)-1
      raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
  end
  numericData = NaN(size(dataArray{1},1),size(dataArray,2));

  for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58]
      % Converts text in the input cell array to numbers. Replaced non-numeric
      % text with NaN.
      rawData = dataArray{col};
      for row=1:size(rawData, 1)
          % Create a regular expression to detect and remove non-numeric prefixes and
          % suffixes.
          regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
          try
              result = regexp(rawData(row), regexstr, 'names');
              numbers = result.numbers;
              
              % Detected commas in non-thousand locations.
              invalidThousandsSeparator = false;
              if numbers.contains(',')
                  thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                  if isempty(regexp(numbers, thousandsRegExp, 'once'))
                      numbers = NaN;
                      invalidThousandsSeparator = true;
                  end
              end
              % Convert numeric text to numbers.
              if ~invalidThousandsSeparator
                  numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                  numericData(row, col) = numbers{1};
                  raw{row, col} = numbers{1};
              end
          catch
              raw{row, col} = rawData{row};
          end
      end
  end


  %% Create output variable
  data_structure.data = cell2mat(raw);
  data_structure.W = FIS_getW_IR();
  data_structure.index = 1:size(data_structure.data, 2);
  data_structure.Xposition = -2.8:0.1:2.9; % WARNING: MADE UP VALUES. Check Origin file for correct values!
  centro = 0;
  data_structure.angle = FIS_PositionToAngle(data_structure.Xposition, centro, tan(deg2rad(1.88*10*3))/3, true);
  
  imagesc(data_structure.angle, data_structure.W, data_structure.data, [0,1]);
  xlabel('Collection angle (degrees)');
  ylabel('Wavelength (nm)');
  vline(0);
  xticks([-50:10:50]);
  
end
