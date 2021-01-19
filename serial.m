clear
clc

fclose(instrfindall);
delete(instrfindall);

se=serial('COM3','BaudRate',1000000);
instrfind()
fopen(se);

% while 1
%     readData=fscanf(se)
%     number = sscanf(readData,'%f');
% 
%     if(size(number)>0)
%     number(1)
%     number(2)
% 
%                
%     end %end if
%     
% end %end while

  

