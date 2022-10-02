%%Q3a bounce with drag 

function[rxd,ryd,vyd,ttd] = dragbb_function(m,Fl_rho,dt) % defining function for bouncing ball with drag for question 3a 
% so it can be re used 

t = 0; % initial time 
r=5E-03/2; %m %radius
cd =0.47; %drag coefficient dimensionless
g = -9.81; %m/s/s % accelration due to gravity 
area = pi*r^2; %m^2 
volume = pi*4/3* r^3; %m^3
rxd(1)= 0; % m
ryd(1) = 100; % setting original position for ball to drop from m
vxd(1) = 0 ; % m/s
vyd(1)= 0; % initial velocity components m
m= 7850 * volume; % mass of a ball in kg from m = rho v
Fl_rho = 1.225;
Fg= m*g; % finiding weight affecting ball

Nd = 30000% Number of iterations
dt = 0.001 %timestep
CE = 0.75 %coefficient of restitution


for i = 1: Nd %loop


    Fd_y(i+1) = (cd*0.5*Fl_rho*(vyd(i).*vyd(i))*area); %N %drag force in y direction using formula 
    Fd_x =cd*0.5*Fl_rho*(vxd.*vxd)*area; %N   %drag force in x direction using formula
    Fx(i+1)=Fd_x(i); %N %total force is x direction  
    Fy(i+1)=  Fd_y(i) +Fg;%N % total force in Y plane 
    ax(i+1)= Fx(i)/m; % acceleration in x plane m/s/s
    ay(i+1)= Fy(i)/m; %m/s/s % acceleration in y plane 

    %finding new positions for evrey iteration using old position, timestep and
%old velocity
    rxd(i+1) = rxd(i)+ vxd(i).*dt;
    ryd(i+1) =  ryd(i) + vyd(i).*dt;
   
    %Finding new velocity using old velocity and acceleration
    vxd(i+1) = vxd(i) + ax(i)*dt;
    vyd(i+1)= vyd(i) +ay(i)*dt;



    %  bouncing ball condition
    if ryd(i)<0 
      vyd(i+1)=-CE*vyd(i);   % what to do if height becomes negative 
      ryd(i+1)=0; %stop at 0
    end


   %dynamically updating array
    ttd(i+1) = i*dt;

   
end


