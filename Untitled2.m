clear
clc

fclose(instrfindall);
delete(instrfindall);

se=serial('COM3','BaudRate',1000000);
% instrfind()
fopen(se);

while 1
    readData=fscanf(se)
    number = sscanf(readData,'%f');

    if(size(number)>0)
        p0 = [ 0  ;0 ;1];
        p1 = [number(1);number(2);number(3)];
%         p1 = [ 1  ;0 ;0];
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
% 
%         tx
%         ty
%         tz
%         R
        
        pitch = atan2(R(3,2),R(3,3))*(180/pi)
        roll  = atan2(R(2,1),R(1,1))*(180/pi)

    end





end
