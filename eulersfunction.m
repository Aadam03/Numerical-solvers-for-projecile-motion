%creating a function for eulers 
function[rx0,ry0,vy0]= eulersfunction(theta,v)

%% Parameters
t =0; %setting time to 0 (intital time)

rx0= 0;
ry0 = 0; % initial position

%v = 10 %initial velocity 
%theta = 30 ; % angle projectile will be travelling

%initial velocity in 2d 
vx0 = v*cosd(theta);
vy0 = v*sind(theta);
g = 9.81; %defining acceleration due to gravity

dt= 0.01; %time step
tmaximum = (2*v*sind(theta)/g); % how long to run 
N = abs(tmaximum/dt); %findinf how many iterations 



%%Euler's
% using arrays in loop so things can worked out must faster 
for i = 1:N 
    rx0(i+1)= rx0(i)+dt*vx0; % new x position 
    vy0= vy0+ dt*(-g);
    ry0(i+1)= ry0(i)+ dt*vy0; % New y position in loop 
    t(i+1)= i*dt; % dynamically building vector t with evrey iteration 
end 


end