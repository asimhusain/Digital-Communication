% 8)	To calculate the outage probability, first check the condition 〖Rate〗_i< τ for a given threshold of τ = 2 bps/Hz.  Hint:  if ratei < threshold
%                      counti = counti+1
%                   end     
    
%9) 	Perform the Monte Carlo simulations for 1000 iterations, then find the outage probability. (Hint: Repeat step 1 to step 7 1000 times and then calculate the outage probability.)
% P_outage^i=P (〖Rate〗_i< τ ).
% 
% 10) 	The total outage probability is given as
% Ѳ_OP=∏_(i=1)^M▒〖P_outage^i,〗
% where M represents the total number of users, i.e., M=100. The total outage                 probability is the product of the total probabilities of all users in the network. Can you guess the reason for the product? (Hint: Recall the probability of independent events)
% 11) Plot total outage probability versus the threshold, τ=0:5:25 bps/Hz. Explain your result.
% 12.	Run the above simulation for 1, 10, 100, 1000 iterations. Do you see any change in the results and curves? If yes, can you think of the reason?
% As we change the iteration there is not significant change in the graph and is almost same for all the iterations performed but we can say we got more consistent result

clc
clear all
monteCarlo=1000;
threshold=0:5:25;
for t=0:5:25
counti=zeros(1,100);
for o=1:monteCarlo
U_x=unifrnd(0,500,1,100);
U_y=unifrnd(0,500,1,100);
Base_x=unifrnd(0,500,1,5);
Base_y=unifrnd(0,500,1,5);

 for d=1:100
   for f=1:5
dist(d,f)=sqrt(Base_x(f)-U_x(d))^2 +(Base_y(f)-U_y(d))^2; %m is distance matrix
    end
 end
 
n=3.5; 
path_loss=(1./dist).^n;
path_loss=real(path_loss);


%task 4
%Rayleigh Fading Channel
X=1/sqrt(2)*randn(100,5);
Y=1/sqrt(2)*randn(100,5);
R=abs(X+1j*Y);
 
total_power=1*path_loss.*R;
interf = [];
for i = 1:100
Power(i)=sum(total_power(i,:));
end
%task 6
N=10^(-126/10); %converting N=-96dBm=-126dB into linear
for i = 1:100
   value(i)= max(total_power(i,:));
  interfance(i)=sum(total_power(i,:))-value(i);
  Pr(i)=sum(total_power(i,:));
  SINR(i)=Pr(i)/(interfance(i)+N);
  Rate(i)=log2(1+SINR(i));
    if(Rate(i)<t)
      

  counti(i)= counti(i)+1; %task8
  end
end
 
end
outp=counti/1000; %for outage probabiliity after 1000 iteerations task 9
totaloutp(t/5 + 1)=prod(outp); %total outage probability
 
end
t=0:5:25;
plot(t,totaloutp,'b-','Marker','o','Linewidth',1.5)
title('Threshold vs Outage Probablity') %task 10
xlabel('Rate')
ylabel('Total Outage Probability')
 


