clc;clear;close all;
disp("Welcome to a simulation which shows how Eulers model of projectile motion is compared to Runge Kuttas model over two pre-defined angles")



%%Euler's
%calling eulers function to find projectiles motion for both angles of
%theta while defining the initial velocity of projection 
[rxe30,rye30,vye30]=eulersfunction(30,10)
[rxe60,rye60,vye60]=eulersfunction(60,10) 
%%Runge Kutta 
% calling runge kutta functions for both angles while defining inital
% velocity and timestep
[rxrk30,ryrk30,vyrk30]=rkfunction(30,10,0.01)
[rxrk60,ryrk60,vyrk60]=rkfunction(60,10,0.01) 




%% plotting data found 
subplot(2,1,1)
 plot(rxe30,rye30,'bo',rxe60,rye60,'ko')
     hold on ;
    title("Projectile motion - The journey a projectile simulated by Eulers at 30 and 60 degrees.");
     legend("Eulers method 30 degrees", "Eulers method 60 degrees",'location', 'best')
     xlabel('Distance in metres'); ylabel('Height in metres');
    
    
  subplot(2,1,2)
 plot(rxe30,rye30,'b-',rxe60,rye60,'m-',rxrk30,ryrk30,'r-',rxrk60,ryrk60,'g-')
     hold on;
     title("Projectile motion - The journey a projectile would take using Runge Kutta model compared to Eulers model at 30 and 60 degrees.");
     legend("Eulers method 30 degrees", "Eulers method 60 degrees","Runge kutta 30 degrees", "Runge Kutta 60 degrees", 'location', 'best')
     xlabel('Distance in metres'); ylabel('Height in metres');


    
