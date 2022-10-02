clc;clear;close all;
disp('Welcome to the bouncing ball and energy dissapation simulation!')

[rx0d,ry0d,vy0d,tt]=dragbb_function(0.2*pi*4/3*(5/1000)^3,1.225,0.01) % calling function for bouncing ball with drag 


% initial Positions

rx0=0;  %m
ry0=100; %m  %height where ball will be dropped from   

% Velocity in x and y direction
vy0=0; %m/s % Both x and y velocities are zero as ball just gets released
vx0=0; %m/s    
% Initial time
t=0;  %s          

g=-9.81; %m/s^s  % Acceleration due to gravity 
CE=0.75;  % coefficient of restitution
m=0.2; %kg % Mass of ball 




dt=0.001; % time step
tmax=30; %s  % how long the simulation runs for 
N= abs(tmax/dt);  % number of iterations

for i=1:N 
   
 rx0(i+1)=rx0(i)+dt*-vx0(i); %finding position from  intial positionm timestep and initial velocity 
    ry0(i+1)=ry0(i)+dt*vy0(i);
    vx0(i+1)=vx0(i)+dt*(g);  % finding velocity from initial velocity and acceleraion 
    vy0(i+1)=vy0(i)+dt*(g);
    t(i+1)=i*dt; % updating array 

  % Conditions set if it goes below the x axis

   if ry0(i)<0     
      vy0(i+1)=-CE*vy0(i);   % what to do if height becomes negative 
      ry0(i+1)=0; %stop at 0
   end

ke=0.5*m*vy0.^2; %ke= 1/2mv^2
gpe=-m*g*ry0; %gpe = mgh
totalE=gpe+ke; % energy = sum of all energies



end



    
    hold on; % plotting jounrey of bouncing ball 
  subplot(3,1,1)
hold on;
plot(t,ry0,'b-')
xlabel('time (seconds)');ylabel('Height(Metres)')
title('Bouncing ball journey without drag considerations');
hold off;

 
    
subplot(3,1,2)%energy dissapation for bounce without drag 
  hold on;
   plot(t,totalE,'k-',t,gpe,'r-',t,ke,'b-');
   xlabel('Time (s)'); ylabel('Height (Metres)');
  title('Energy dissapation over the journey for the bouncing ball without drag');
 legend('Total energy','GPE','Kinetic energy','location','best');
  hold off;
   subplot(3,1,3)%Bounce with drag 
     hold on;
   plot(tt,ry0d,'b-')
  xlabel('time (seconds)');ylabel('Height(Metres)')
  title('Bouncing ball with drag');
  
  hold off;

