function[rx0,ry0,vy0] = rkfunction(theta,v,dt) % defining function with 3 outputs and 3 inputs 
%defning initial conditions

t(1) = 0;  % s % intial time
g = 9.81; %m/s/s % acceleration due to gravity

v = 10; %m/s % initial velocity 
ry0 = 0; %m % initial y posiiton 
rx0 = 0; %m % initial x position
vx0 = v*cosd(theta);%m/s % velocity in x component 
vy0 = v*sind(theta); %m/s % velocity in y component
tmax = (2*vy0)/g; %total time of journey

N = abs(tmax/dt); % number of iterations

%% Fourth order Runge Kutta.
for i = 1:N 
    t(i+1)= i*dt;
    %% integration is happening
    I1= dt.*0;  
    J1 = dt.*vx0(i); 
    K1 = dt.*(-g); 
    L1 = dt.*(vy0(i));
  
    I2= dt.*0; 
  J2 = dt.*(vx0(i)+I1/2); 
  K2 = dt.*(-g);  
  L2 = dt.*(vy0(i)+K1/2);
 
  I3= dt.*0; 
   J3 = dt.*(vx0(i)+I2/2); 
   K3 = dt.*(-g);       
    L3 = dt.*(vy0(i)+ K2/2);        
   
    I4= dt.*0;
    J4 = dt.*(vx0(i)+I3); 
    K4 = dt.*(-g);  
    L4= dt.*(vy0(i)+K3);
       

         
 


rx0(i+1)= rx0(i) + (1/6)*(J1+ 2*J2 + 2*J3 + J4); %Summating all values to find new x position
ry0(i+1)= ry0(i) + (1/6)*(L1+ 2*L2 + 2*L3 + L4);%Summating all values to find new y position
vy0(i+1)= vy0(i) + (1/6)*(K1+ 2*K2 + 2*K3 + K4);%Summating all values to find new y velocity
vx0(i+1)= vx0(i) + (1/6)*(I1+ 2*I2 + 2*I3 + I4);%Summating all values to find new x velocity

end 
end 



