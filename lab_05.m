% Task-1
% Simulating Okumuru-Hata Model
% The Hata model is a radio propagation model for predicting the path loss of cellular transmissions in exterior environments, valid for microwave frequencies in the range 150≤f_c≤1000 (MHz). It is an empirical formulation based on the data from the Okumura model, and is thus also commonly referred to as the Okumura–Hata model. The Okumura–Hata model is expressed in terms base station (BS) antenna height 30≤h_b≤200 (m),  the mobile station (MS) antenna height 1≤h_m≤10 (m), and the distance 1≤d≤20 (km) between the BS and MS. Note the units of the parameters that are used in the model. The model is known to match the experimental data from which is formed to within 1 dB for distances ranging from 1 to 20 km. With the Okumura–Hata model, the path loss between two isotropic BS and MS antenna is 
% Create a MATLAB program for Okumura–Hata model. Plot the path loss (in dB) versus the Log distance (in km) for large city, suburban and open area with h_b=70 m,h_m=1.5 m,f_c=900 MHz. Attach the source code and the screen shot of the full labelled plot.
% Code
d = 1000:10:20000;
hb = 70;
hm = 1.5;
fc = 900e6;
a = 3.2 .* (log(11.75*hm)).^2 - 4.97;%becuase frequency is 900Mhz
A = 69.55 + 26.16 * log(fc) - 13.82 * log(hb) - a * hm;
B = 44.9 - 6.55 * log(hb);
C = 5.4 + 2 * (log(fc/28))^2;
D = 40.94 + 4.78 * (log(fc))^2 - 18.33 * log(fc);
Lu = A + B * log(d); %for urbab area
Lsu = A + B * log(d) - C;%for suburban area
Lop = A + B * log(d) - D; %for open area
loglog(d,abs(Lu),'y');
hold on
loglog(d,Lsu,'b');
hold on
loglog(d,abs(Lop),'r');
title('Okumuru-Hata Model');
xlabel('distance d(km) in dB');
ylabel('Path loss L in dB');
legend('Urban area','Suburban area','Open area');

% 
% Task-2
% Consider the network model created in Task-02 of Lab-02, determine the distance between the BS and each user using the Euclidean distance formula.
% d_i=√((x_UE^i-x_BS )^2+(y_UE^i-y_BS )^2 ),
% where d_i is the distance between the BS and the i-th user. Next, calculate pathloss for each user using the 3GPP Urban Micro (UMi) from [R1, Table B.1.2.1-1] with a carrier frequency of 3 GHz. The path loss L (d)[dB] is
% L (d)=-G_t-G_r+{37.5+22(d)           if LoS,35.1+ 36.7(d)         if NLoS, 
% where G_t and G_r represent the antenna gains (in dBi) at the transmitter and the receiver, respectively. For this task, assume G_t=G_r=10 dBi. Attach the screen shot of the network model, distance matrix, and the path loss matrix (both for LoS and NLoS cases).
% 
% [R1] Further advancements for E-UTRA physical layer aspects (Release 9). 3GPP TS 36.814, Mar. 2010.
% 
% 
Code
clc
clear
theta=-pi:0.01:pi;
r=500;%cell radius
x=r*cos(theta);
y=r*sin(theta);
plot(x,y,'k','linewidth',1.5)
area=pi*r^2;
lambda=10/(area);
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

%Computing Euclidean distenace between users and BS
d = sqrt((y1 - xbs).^2 + (y1 - ybs).^2)
%Calculating Line of Sight Path Loss
%There are two different models depending on the range of distance
f = 3e9;
hBS = 10;%actual antenna heights
hUT = 1.5;%actual antenna heights
h_BS = hBS - 1;%effective antenna height
h_UT = hUT - 1;%effective antenna height
d_BP = (4*h_BS*h_UT*f)/3e8; %Break point distance
PL_LoS = ones(1,length(d));

for i=1:length(d)
   if d(i) > 10 && d(i) < d_BP
   PL_LoS(i) = 22*log(d(i)) + 28 + 20*log(f);
   elseif d(i) > d_BP && d(i) < 5000
   PL_LoS(i) = 40*log(d(i)) + 7.8 - 18*(log(h_BS) + log(h_UT)) + 2*log(f)
   end
end
%Calculating Non Line of Sight Path Loss
PL_NLoS = ones(1,length(d));
for i=1:length(d)
    PL_NLoS(i) = 36.7*log(d(i)) + 22.7 + 26*log(f)
end
% Using the computer program developed in Task-2 of Lab-04, develop an interface that allows a user to specify inputs as described in Task-2 of Lab-04, as well as transmitter and receiver parameters such as transmitter power, transmit antenna gain, receiver antenna gain, receiver bandwidth, and receiver noise figure. Using these additional input parameters and using knowledge of the Q-function and noise calculations, you may now statistically determine coverage level for any specific mobile radio system. You may wish to implement table look-ups for Q and erf functions so that your simulator provides answers to the following wireless system design problem:
% If a user specifies all input parameters listed above, and specifies a desired received SNR and specific value of T-R separation distance, what is the percentage of time that the SNR will be exceeded at the receiver? 
% 
% (b)	If a user specifies all input parameters listed above, and specifies a desired percentage of time that the SNR will be exceeded at the receiver, then what is the maximum value of T-R separation that will meet or exceed the specified percentage
% % 
% 	(d)If a user specifies a particular percentage that a given SNR is provided for a particular T-R separation d (assumed to be on the boundary of the cell), then what is the percentage of area that will be covered within the cell having the same radius d?
% 




% Code

clear
clc
tr_separation=input('Enter T R sepration: ');
freq=input('Enter the frequrncy in Mhz: ');
path_loss_exp=input('Enter Path loss exponent: ');
sd=input('Enter the Standard DeviationL ');
do=input('Enter the refrence distance: ');
no_samples=input('Enter the no of samples: ');
transmitter_power=input('Enter the Transmit Power: ');
Gt=input('Enter gain of transmitter: ');
Gr=input('Enter gain of receiver: ');
reciever_BW=input('Enter Bandwidth: ');
reciever_noise=input('Enter the receiver noise figure: ');
threshold_SNR=input('Enter the Threshhold SNR: ');
desired_percentage_of_time=input('Enter the percentage of time for maximum distance: ');
total_losses=simulator(tr_separation,freq,path_loss_exp,sd,do,no_samples);
hold on
set(gca,'xscale','log')
mean_loss=mean(total_losses,1);
average_recieved_power=transmitter_power+Gt+Gr-mean_loss;
average_SNR=average_recieved_power-reciever_noise;
coverage=qfunc((threshold_SNR-average_recieved_power)/sd);
%parameters for service area calculation
a=(threshold_SNR-average_SNR)/(sd*sqrt(2));
b=(10*path_loss_exp*log(exp(1))/(sd*sqrt(2)));
useful_area_a=(1-erf(a)+(exp((1-2*a*b)/b^2)*(1-erf((1-a*b)/b))))/2;
xlabel('Distance in 10Log[Distance]');
ylabel('Path Loss in dBs');
title('Modelling of Log Normal Shadowing');
%% part b of task 3
avg_SNR=threshold_SNR+qfuncinv(desired_percentage_of_time)*sd-average_recieved_power-30;
 average_power=avg_SNR+reciever_noise;
 total_loss=transmitter_power+Gt+Gr-average_power;
 d=do*(10^(total_loss/(10*path_loss_exp)))

%% part c of task 3
coverage_prob=0.7;
argument_of_Q=qfuncinv(coverage_prob);
a=argument_of_Q/sqrt(2);
b=(10*path_loss_exp*log(exp(1))/(sd*sqrt(2)));
area_coverage=(1-erf(a)+(exp((1-2*a*b)/b^2)*(1-erf((1-a*b)/b))))/2


function [T_loss] = simulator(tr_separation,freq,path_loss_exp,sd,do,no_samples)
%providing the check for the TR separation to be greater than do
if (tr_separation>=do)
    %initializing an array for modeling the random variable for log normal
    %shadowing
    random_variable=[];
    %the array below is used for the scatter plot
    distance=10*log(tr_separation+zeros(1,no_samples));
    %getting the values from the random distribution with mean 0 and
    %specified standard deviation
    random_variable=normrnd(0,sd,[no_samples,1]);
    %calculating the wavelength
    lambda=3e8/freq;
    %the antenna parameters same as that of task1
    ht=10;
    hm=10;
   
    flat_space_for_do=10*log(do^path_loss_exp/(10*10)^2);
    %calculating the total loss according to the equation in slides
    %it is the sum of path losses and random variable
    T_loss=flat_space_for_do+10*path_loss_exp*log(tr_separation/do)+random_variable;
else
    disp('Error. The T-R separation is less than the close-in-reference distance');
end
set(gca,'xscale','log')
set(gca, 'yscale', 'log')
scatter(distance,T_loss,30,'*')

end


