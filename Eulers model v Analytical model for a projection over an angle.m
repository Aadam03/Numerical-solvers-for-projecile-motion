clc; clear; clear all;
disp("Welcome to a simulation which shows how Eulers model of projectile motion is compared to an analytical model over a pre-defined angle")

%% Parameters
t =0; %setting time to 0 (intital time)

rx0= 0;
ry0 = 0; % initial position

v = 10; %initial velocity 
theta = 30 ;% angle projectile will be travelling
if theta < 0 
    theta = 30  % conditions to avoid code breaking 
end 
if theta> 90
    theta = 30
end 


%initial velocity in 2d 
vx0 = v*cosd(theta); 
vy0 = v*sind(theta);
g = 9.81; %defining acceleration due to gravity

dt= 0.01; %time step
tmaximum = (2*v*sind(theta)/g); % how long to run 
N = abs(tmaximum/dt); %number of iterations 
%%Analytical
tlist= (t: dt: tmaximum); % vector created for multiplication
rxa=vx0*tlist;
rya=vy0*tlist-((g.*tlist.^2)/2); % equation to find position of projectile analytically 


[rx0,ry0,vy0]=eulersfunction(30,10) % calling function to find eulers projectile motion

vy= vy0 + (-g*dt); %finding new velocity

plot(rx0,ry0,'ko',rxa,rya,'r*'); %plotting eulers with analytical to compare
    hold on;
    title("Projectile motion - comparing analytical methods to Eulers method");
    legend("Eulers method", "Analytical method", 'location', 'north east')
    xlabel('Distance in metres'); ylabel('Height in metres');
    rx=rx0+vx0*dt; %finding new positions based off velocity 
    ry=ry0+vy0*dt;
