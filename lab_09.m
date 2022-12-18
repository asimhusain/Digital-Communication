clc
clear all
threshold=1:5:25;
monteCarlo=10;
for th=1:5:25
    count=zeros(1,100);
    for mc=1:monteCarlo
U_x=unifrnd(0,500,1,100);
U_y=unifrnd(0,500,1,100);
Base_x=unifrnd(0,500,1,5);
Base_y=unifrnd(0,500,1,5);

%task2
for d=1:100
   for f=1:5
dist(d,f)=sqrt(Base_x(f)-U_x(d))^2 +(Base_y(f)-U_y(d))^2; %dist is distance matrix
    end
 end
%task 3
n=3.5; 
path_loss=(1./dist).^n;
path_loss=real(path_loss);

%task 4
%Rayleigh Fading Channel
X=1/sqrt(2)*randn(100,5);
Y=1/sqrt(2)*randn(100,5);
R=abs(X+1j*Y);
 
total_power=1*path_loss.*R;
for i = 1:100
Power(i)=sum(total_power(i,:));
end
%task 5
interfance = [];
for i = 1:100
   value(i)= max(total_power(i,:));
  interfance(i)=sum(total_power(i,:))-value(i);
end
%task 6
N=10^(-126/10); %converting N=-96dBm=-126dB into linear
for i = 1:100
   value(i)= max(total_power(i,:));
  interfance(i)=sum(total_power(i,:))-value(i);
  Pr(i)=sum(total_power(i,:));
  SINR(i)=Pr(i)/(interfance(i)+N);
  Rate(i)=log2(1+SINR(i));
  if(Rate(i)<th)
      count(i)=count(i)+1;
end
end
    end

    
        Poutage=count/monteCarlo
        
    
    TotalOutage(th)=prod(Poutage);
    
end

figure(2)
plot(th,TotalOutage,'b-','Marker','o','Linewidth',1.5);

grid on
