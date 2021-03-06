function [M]=ShiftMask(res,shiftX,shiftY,newDwell,newRep,pathName,fileName,writeFile)

  ShiftX = round(shiftX/res);
  ShiftY = round(shiftY/res);

  fid0 = fopen([pathName,filesep,fileName],'r');

  header = fgetl(fid0);
  rep = str2num(fgetl(fid0));
  if (newRep == 0)
      newRep = rep;
  end

  N = str2num(fgetl(fid0));


  M = fscanf(fid0,'%i %i %i',[3 inf]);
  fclose(fid0);

  figure(1)
  % plot(M(2,:),M(3,:))
  hold on
  set(gca,'YDir','reverse')

  oldDwell = M(1,1);
  if (newDwell == 0)
      newDwell = oldDwell;
  end

  M(1,:) = newDwell;
  M(2,:) = M(2,:)+ShiftX;
  M(3,:) = M(3,:)+ShiftY;

  % figure(2)
  plot(M(2,:),M(3,:),'r')
  hold on
  set(gca,'YDir','reverse')

  fileName = strrep(fileName, '.str', ['_shX',num2str(shiftX),'shY',num2str(shiftY),'.str']);
  fileName = strrep(fileName, ['_dwell',num2str(oldDwell),'_'], ['_dwell',num2str(newDwell),'_']);
  fileName = strrep(fileName, ['_rep',num2str(rep)], ['_rep',num2str(newRep)]);


  if (writeFile)
    fid1 = fopen([pathName,'\z',fileName],'w+');
    fprintf(fid1,'s\r\n%i\r\n%i\r\n',newRep,size(M,2));
    fprintf(fid1,'%i %i %i\r\n',M);
    fclose(fid1);
  end

end
