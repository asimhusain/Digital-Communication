% Task-1
% Nakagami-m Fading Distribution
% Nakagami-m fading is the most generalized distribution as it can model different fading environments, i.e., Rayleigh, Hoyt, and Rician distributions (m<1 for Hoyt, m=1 for Rayleigh, and m>1 for Rician). It has greater flexibility and accuracy in matching experimental data for both LoS and NLoS conditions as compared to Rayleigh or Rice distribution, and its mathematical form is also more tractable. Using the Nakagami fading model, the envelope of the fading has the probability density function (PDF) given as
% 〖∣h∣~ f〗_(∣h∣) (x,m)=(m^m x^(m-1))/Γ(m)  e^(-mx),
% where Γ(z)=∫_0^∞▒〖t^(z-1) e^(-t) dt〗 is the Gamma function. Plot the Nakagami-m distribution for m=[1,2,3,4,5]. What is the impact of m on fading channel?
% 

% Code

x=[0:0.001:3];
for m=1:1:5 
gamm_a=gamma(m);
numer_ator=(m^(m).*x.^(m-1));
pdf=(numer_ator.*exp(-m.*x))/gamm_a;
legendInfo{m} = ['m = ' num2str(m)];
plot(x,pdf)
xlabel('x');
ylabel('Probablity Density Function');
legend(legendInfo)
hold on
end

% Task-2
% Using the computer simulation create a Rayleigh fading simulator that has three independent Rayleigh fading multipath components, each having variable multipath time delay and average power. Then convolve a random binary bit stream through your simulator and observe the time waveforms of the output stream. You may wish to use several samples for each bit (seven is a good number). Observe the effects of multipath spread as you vary the bit period and time delay of the channel.
Code
clear
clc
n=70;
N=3;
X=1/sqrt(2)*randn(1,N);
Y=1/sqrt(2)*randn(1,N);
R=abs(X+1j*Y);
bits = rand(1,n)>0.5; % generating 0,1 with equal probability
figure(1)
subplot(2,1,1)
plot(R);
title('Rayleigh Fading channel with three multipath')
subplot(2,1,2)
stem(bits)
title('Random Sequence of 0 and 1')
d=conv(R,bits)
figure(2)
plot(d)
title('Output / Convolution of Rayleigh channel with binary Bit stream')
Code
clear
clc
n=70;
N=3;
X=1/sqrt(2)*randn(1,N);
Y=1/sqrt(2)*randn(1,N);
R=abs(X+1j*Y);
bits = rand(1,n)>0.5; % generating 0,1 with equal probability
figure(1)
subplot(2,1,1)
plot(R);
title('Rayleigh Fading channel with three multipath')
subplot(2,1,2)
stem(bits)
title('Random Sequence of 0 and 1')
d=conv(R,bits)
figure(2)
plot(d)
title('Output / Convolution of Rayleigh channel with binary Bit stream')

% 
% Task-3
% Consider a single user system as illustrated in Fig. 1, where d_h and d_v represent the horizontal and vertical distance between the BS and the user, respectively, and g denotes the fading channel. Plot the received power P_r (in Watts) versus the horizontal distance d_h (in meters) for Rayleigh fading channel and path loss exponent n=[3,3.5,4]. 
% P_r=P_t*d^(-n)*|g|^2.
% Assume transmit power at the BS P_t=1 W and d_h=20:5:65. You may refer to Task-1 of Lab-05 to model Rayleigh fading.
% 
% 
% Code
clear
clc
samp=input(‘Enter the no. of sample: ‘);
dh=20:5:65; %horizontal distance
dv=2; %vertical distance
pt=1; %transmit power
d = zeros(1,length(dh));
for n=3:0.5:4 %for different path loss exponent
    for k=1:length(dh)
    d(k)=sqrt(dh(k)^2+dv^2); %by  print h s theorem
    pr=zeros(1,samp);
        for m=1:samp
    x(m)=1/sqrt(2)*randn(1,1); 
    y(m)=1/sqrt(2)*randn(1,1);
    g(m)=(x(m)+1j*y(m)); %rayleigh fading channel
    pr(m)=pt*(d(k).^(-n)).*((abs(g(m))).^2);
        end
P_r(k)=mean(pr);
    end

labels=num2str([3:0.5:4].’,’n is %d’);
plot(dh,P_r)
xlabel(‘dh(m)’);
ylabel(‘Received pOwer’);
legend(labels)
title( print(‘power P_r (in Watts) vs the d_h with no. of sample %.d’, samp))

hold on
end

