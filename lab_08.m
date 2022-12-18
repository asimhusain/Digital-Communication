% Task-1
% ⮚ Create a function that finds the average fade duration for a given threshold level to rms 
% ratio and max doppler frequency.
% ⮚ Create a function that finds the level crossing rate for a given threshold level to rms ratio 
% and max doppler frequency.
% ⮚ Using the function created in part (a), plot the average fade duration for threshold levels 
% of 𝜌 = 0.01, 0.1, 0.5, 𝑎𝑛𝑑 1 versus velocity. Consider carrier frequency is 900 MHz.
Fc= 900e6;
v=1:20;
p=[0.01 0.1 0.5 1];
c=3e8;
fd= Fc*v/c;
for i=1:length(p)
dur= avg_fade_dur(p(i),fd);
plot(v,dur,'Linewidth',1.5);
hold on;
end
title('velocity vs fade duration');
xlabel('Velocity (m/s)');
ylabel('Fade Duration');
ylim([-0.01 0.25]);
legend('p=0.01','p=0.1','p=0.5','p=1');
function duration = avg_fade_dur (threshold,Fd)
duration= (exp(threshold^2)-1)./(sqrt(2*pi)*Fd*threshold);
end
% Using the functions created in part (a) and (b), plot bit error rate (BER) versus the velocity 
% for a binary digital modulation with a bit duration of 50 bps and carrier frequency of 900 
% MHz.

Fc= 900e6;
v=1:20;
p=[0.01 0.1 0.5 1];
c=3e8;
fd= Fc*v/c;
bitrate = 50;
ber= 50*duration;
for i=1:length(p)
duration= afd(p(i),fd);
ber= 50*duration;
figure(1)
plot(v,duration,'Linewidth',1.5);
figure(2)
plot(v,ber,'Linewidth',1.5);
hold on;
end
figure(1)
title('velocity vs fade duration');
xlabel('v(m/s)');
ylabel('Fade Duration');
ylim([-0.01 0.25]);
legend('p=0.01','p=0.1','p=0.5','p=1');
figure(2)
title('BER vs Velocity');
xlabel('v(m/s)');
ylabel('Bit Error rate');
ylim([-0.01 0.25]);
legend('p=0.01','p=0.1','p=0.5','p=1');
bitrate = 50;
ber= 50*duration;
function duration = afd (threshold,Fd)
duration= (exp(threshold^2)-1)./(sqrt(2*pi)*Fd*threshold);
end



