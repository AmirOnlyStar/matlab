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

%     if(size(number)>0)
        p0 = [ 1  ;0 ;0]
        p1 = [ 0 ;1 ;0]
%         p1 = [number(1);number(2);number(3)];
%       p1 = [ -0.36  ;-0.02 ;0.93];
        
        % calculate cross and dot products
        C = cross(p0, p1) ; 
        D = dot(p0, p1) ;
        NP0 = norm(p0) ; % used for scaling
        I=[
            1 0 0;
            0 1 0;
            0 0 1;
          ]
        if ~all(C==0) % check for colinearity    
            Z = [
                0   -C(3)  C(2);
               C(3)   0   -C(1);
              -C(2)  C(1)   0
                ] ; 

            R = (I + Z + Z^2 * (1-D)/(norm(C)^2)) / NP0^2 ; % rotation matrix
        else
            R = sign(D) * (norm(p1) / NP0) ; % orientation and scaling
        end
        % R is the rotation matrix from p0 to p1, so that (except for round-off errors) ...
        R * p0      % ... equals p1 
        inv(R) * p1 % ... equals p0

%         tx = atan2(R(3,2),R(3,3))*(180/pi);
%         ty = atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2))*(180/pi);
%         tz = atan2(R(2,1),R(1,1))*(180/pi);
%         tx
%         ty
%         tz
%         R

        if(abs(R(3,1))~= 1)
            teta1 = -asin(R(3,1)) 
            teta2 = (pi - teta1)  
            
            sy1 = atan2(R(3,2)/cos(teta1),R(3,3)/cos(teta1)) *(180/pi)
            sy2 = atan2(R(3,2)/cos(teta2),R(3,3)/cos(teta2)) *(180/pi)
            
            fi1 = atan2(R(2,1)/cos(teta1),R(1,1)/cos(teta1)) *(180/pi)
            fi2 = atan2(R(2,1)/cos(teta2),R(1,1)/cos(teta2)) *(180/pi)
            
%             teta1 = teta1 *(180/pi)
%             teta2 = teta2 *(180/pi)
        else
           fi   = 0
        
           if(R(3,1)== -1)
               teta = pi/2 *(180/pi)
               sy   = fi+atan2(R(1,2),R(1,3)) *(180/pi)
           else
               teta = -pi/2 *(180/pi)
               sy   = -fi+atan2(-R(1,2),-R(1,3)) *(180/pi)
           end
        end
               
%     end %end if
%     
% end %end while

  

