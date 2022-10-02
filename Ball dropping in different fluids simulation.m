clear;close all;
disp("Welcome to a simulation which shows different balls dropping into different fluids")
B_rh0=[7500,1150];%kg/m^3 %ball density vector
Fl_rho=[1.25;1000;1260]; %kg/m^3 %fluid density vector
r= 2.5/1000  %m % radius
area = pi*r^2; %m^2
volume = pi*4/3* r^3; %m^3
n_m = volume * B_rh0(:,2) %mass of nylon ball kg
s_m = volume* B_rh0(:,1) % mass of steel ball kg
n_air= 15000 % number of iterations needed to find terminal velocity in air
n_glycerine= 5000 % number of iterations needed to find terminal velocity in glycerine
N_Ng = 50 % number of iterations needed to find terminal velocity of nylon ball in glycerine, special case due to buyoncy 
n_water = 5000 % number of iterations needed to find terminal velocity in water
[rx0na,ry0na,vy0na,ttna]= fallingballdrag_function(B_rh0(:,2),Fl_rho(1,:),0.001,n_m,area,n_air); %function for nylon ball falling in air


[rx0nw,ry0nw,vy0nw,ttnw]= fallingballdrag_function(B_rh0(:,2),Fl_rho(2,:),0.001,n_m,area,n_water); %function for nylon ball falling in water


[rx0ng,ry0ng,vy0ng,ttng]= fallingballdrag_function(B_rh0(:,2),Fl_rho(3,:),1E-03,n_m,area,N_Ng); %function for nylon ball falling in glycerine


[rx0sa,ry0sa,vy0sa,ttsa]= fallingballdrag_function(B_rh0(:,1),Fl_rho(1,:),0.001,s_m,area,n_air); %function for steel ball falling in air

[rx0sw,ry0sw,vy0sw,ttsw]= fallingballdrag_function(B_rh0(:,1),Fl_rho(2,:),0.001,s_m,area,n_water);  %function for steel ball falling in water

[rx0sg,ry0sg,vy0sg,ttsg]= fallingballdrag_function(B_rh0(:,1),Fl_rho(3,:),0.001,s_m,area,n_glycerine);  %function for steel ball falling in glycerine 

 % displaying terminal velocities from model 
 disp("Terminal velocities found from the model:")
disp("Nylon ball in air:"); disp(vy0na(:,end));disp("Nylon ball in water:");disp(vy0nw(:,end));disp("Nylon ball in glycerine:");disp(vy0ng(:,end));
disp("Steel ball in air:");disp(vy0sa(:,end));disp("Steel ball in water:");disp(vy0sw(:,end));disp("Steel ball in glycerine:");disp(vy0sg(:,end));

%  finding theoretical terminal velocities 
disp("Terminal velocities found analytically to compare the accuracy of the model:")
theoreticalVt_na = (((2*n_m*9.81)/(Fl_rho(1,:)*area*0.47))^0.5) %sqrt(2mg/rhof*area*Cd)
theoreticalVt_nw = ((2*n_m*9.81)/(Fl_rho(2,:)*area*0.47))^0.5
theoreticalVt_ng = ((2*n_m*9.81)/(Fl_rho(3,:)*area*0.47))^0.5
theoreticalVt_sa = ((2*s_m*9.81)/(Fl_rho(1,:)*area*0.47))^0.5
theoreticalVt_sw = ((2*s_m*9.81)/(Fl_rho(2,:)*area*0.47))^0.5
theoreticalVt_sg = ((2*s_m*9.81)/(Fl_rho(3,:)*area*0.47))^0.5
disp("No buyoncy force considerations when terminal velocities were calculated analytically")

%% plotting the graphs for time against terminal velocities in each fluid
%Nylon
subplot(3,1,1)
hold on;

plot(ttna,vy0na,'b-');plot(ttsa,vy0sa,'r-')
title('Drag for the balls in air');
xlabel('Time (seconds)');ylabel('Velocity (m/s)')
ylim([0,32]);xlim([0,10]);
title('Drag for the balls in air');
legend('Nylon','Steel','location','best')
hold off;

%Water
subplot(3,1,2)
hold on;
title('Drag for the balls in water');
plot(ttnw,vy0nw,'b-');plot(ttsw,vy0sw,'r-')
legend('Nylon','Steel','location','best')
xlabel('Time (seconds)');ylabel('Velocity (m/s)')
xlim([0,0.75]);ylim([0,1.1]);

hold off;

%Glycerine
subplot(3,1,3)
hold on;
title('Drag for the balls in glycerine');
plot(ttng,vy0ng,'b-');plot(ttsg,vy0sg,'r-')
legend('Nylon','Steel','location','best')
xlabel('Time (seconds)');ylabel('Velocity (m/s)')
xlim([-0.2,0.75]);ylim([-1.5 1.1]);

hold off;







