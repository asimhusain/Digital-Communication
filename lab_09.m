% Task
% Using the wireless communication principles covered during the lectures and previous labs, 
% simulate a downlink wireless network model following the instructions below.
% 1. Consider an area of 500x500 m2 with 100 uniformly distributed users and 5 base 
% stations (BSs). Plot the users and BSs using the scatter() command and attach the 
% snapshot of your network model. (Hint: use unifrnd()function to 
% generate the x and y coordinates of users and BSs.)
U_x=unifrnd(0,500,1,100);
U_y=unifrnd(0,500,1,100);
Base_x=unifrnd(0,500,1,5);
Base_y=unifrnd(0,500,1,5);
scatter(U_x,U_y)
hold on
scatter(Base_x,Base_y,'d')
legend('Users','Base Station')
title('Users and Base Station')

% The next step is to associate each user to its closest/nearest BS. For this, use the 
% Euclidean distance formula to calculate the distance between the BSs and users. Attach 
% the screenshot of the distance matrix.
% d_ij=√((x_UE^i-x_BS^j )^2+(y_UE^i-y_BS^j )^2,)  i∈{1,2,….,100}  and j∈{1,2,…,5}
% where 𝑖 represents the user index and 𝑗 represents the index of the BS.(Hint: 𝑑𝑖𝑗
% is a 2-dimentional array of order 100x5).

for d=1:100
 for f=1:5
dist(d,f)=sqrt(Base_x(f)-U_x(d))^2 +(Base_y(f)-U_y(d))^2; %dist is 
distance matrix
 end
end
% After the user association, calculate the pathloss for each user, given as
% 𝑳(𝒅𝒊) =𝟏/𝒅𝒊^𝒏,
% where 𝑛 is the path loss exponent, and 𝑑𝑖
% is the distance between the i-th user and the 
% associated BS. Consider 𝑛 = 3.5.
% 
% 
n=3.5; 
path_loss=(1./dist).^n;
path_loss=real(path_loss);

% 	Using the constant transmit power at each BS, i.e., P^t=1W, calculate the received power at each user using the following formula
% P_i^r=P^t*L(d_i )*|h|^2,
% where h represents the Rayleigh fading channel. (Recall Lab-06 to model Rayleigh fading)
% 
% 
%Rayleigh Fading Channel
X=1/sqrt(2)*randn(100,5);
Y=1/sqrt(2)*randn(100,5);
R=abs(X+1j*Y);
 
total_power=1*path.*R;
for i = 1:100
Power(i)=sum(total_power(i,:));
end
% 	The next step is to calculate the interference at each user. The interference at each user is the sum of the signal powers received from all other BSs except the associated BS, and is given by
% I_i=∑_(k ∈ K)▒〖P^t*L(d_k )*|h|^2 〗,
% where K represents the set of the interfering BSs.
% 
interfance = [];
for i = 1:100
   value(i)= max(total_power(i,:));
  interfance(i)=sum(total_power(i,:))-value(i);
end
% 	The next step is to calculate the SINR and spectral efficiency (SE) for each user. SINR at the i-th user is calculated as
% 〖SINR〗_i=  (P_i^r)/(I_i+N),
% 
% where N is the noise power, consider N =-96dBm.
% 
% The formula for calculating the rate (bps/Hz) is as follows.
% 〖Rate〗_i=〖log〗_2 (1+〖SINR〗_i ).
% 

N=10^(-126/10); %converting N=-96dBm=-126dB into linear
for i = 1:100
   value(i)= max(total_power(i,:));
  interfance(i)=sum(total_power(i,:))-value(i);
  Pr(i)=sum(total_power(i,:));
  SINR(i)=Pr(i)/(interfance(i)+N);
  Rate(i)=log2(1+SINR(i));
end



