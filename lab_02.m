% Task-1
% Co-channel Reuse Ratio for Hexagonal Cell Geometry
% Compute the reuse ratio for different cluster size and plot it against different values of N.
function []=reuse_ratio(N1,N2,N3,N4,N5)
Q1=(3*N1)^0.5;
Q2=(3*N2)^0.5;
Q3=(3*N3)^0.5;
Q4=(3*N4)^0.5;
Q5=(3*N5)^0.5;
 
Q=[Q1 Q2 Q3 Q4 Q5];
N=[N1 N2 N3 N4 N5];
scatter(N,Q)
title('Co-channel Reuse Ratio for Hexagonal Cell Geometry')
xlabel('Cluster size N')
ylabel('channel reuse ratio Q')
hold on
plot(N,Q)
 
end


% 
% Consider a single cell of radius r=250m, where the BS is located at the origin, 
% i.e., [x_BS,y_BS ]=[0,0]m. The user locations are assumed to follow an independent 
% homogeneous PPP with density λ_u=10/(π*250^2 )  users/m^2.  Generate a MATLAB program 
% to create and plot the network model. Run the program multiple times. Do you observe 
% any change in the output? Comment on your observations. Moreover, attach 3 different 
% snapshots of your network model

theta=-pi:0.01:pi;
r=1000
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=10/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
 
hold on
plot(x1,y1,'*')
xbs=0;
ybs=0;
hold on
plot(xbs,ybs,'o');
title('Network Model');
xlabel('X(m)');
ylabel('Y(m)');


% 	Repeat part (a) for cell radius r=500m and r=1000m.
% FOR R=500
theta=-pi:0.01:pi;
r=500
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=10/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
 
hold on
plot(x1,y1,'*')
xbs=0;
ybs=0;
hold on
plot(xbs,ybs,'o');
title('Network Model');
xlabel('X(m)');
ylabel('Y(m)');



% FOR R=1000
theta=-pi:0.01:pi;
r=1000
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=10/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
 
hold on
plot(x1,y1,'*')
xbs=0;
ybs=0;
hold on
plot(xbs,ybs,'o');
title('Network Model');
xlabel('X(m)');
ylabel('Y(m)');

% 	Repeat part (a) for density λ_u=50/(π*250^2 )  users/m^2 and λ_u=100/(π*250^2 ) users/m^2.
% FOR 50
theta=-pi:0.01:pi;
r=250
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=50/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
 
hold on
plot(x1,y1,'*')
xbs=0;
ybs=0;
hold on
plot(xbs,ybs,'o');
title('Network Model');
xlabel('X(m)');
ylabel('Y(m)');
% FOR 100
theta=-pi:0.01:pi;
r=250
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=100/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
% Task-3
% Computing Received Power
% Consider a single realization of the network model created in part (a) of Task-2
% The Complete CODE:
theta=-pi:0.01:pi;
r=1000
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=10/(pi*250^2);
numbPoints=poissrnd(area*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*(rand(numbPoints,1));
[x1,y1]=pol2cart(theta,rho);
 
hold on
plot(x1,y1,'*')
xbs=0;
ybs=0;
hold on
plot(xbs,ybs,'o');
title('Network Model');
xlabel('X(m)');
ylabel('Y(m)');
x2=x1(1,1);
y2=y1(1,1);
dd=((x2-xbs)^2+(y2-ybs)^2)^0.5;
Po1=5;
Po2=10;
n1=3;
n2=3.5;
do=1;
Pr1=Po1*(dd/do).^-n1
Pr2=Po2*(dd/do).^-n1
Pr3=Po1*(dd/do).^-n2
Pr4=Po2*(dd/do).^-n2







