% Task-1
% a) Generate 200 samples of a Rayleigh random variable R with E{R2
% }=1. Plot the samples in a 
% stem plot. Remember that R = |X+jY|, where X and Y are zero mean, independent Gaussian 
% random variables (r.v). Your Gaussian r.v. X and Y (produced by randn command) must 
% each have equal variance equal to ½


%b) Give the estimated rms value of R, based on the 200 samples generated, which is given as 
% √R̅̅2̅.
% c) What fraction (if any) of these Rayleigh samples are 10dB below the estimated rms value?
% (Note that this threshold corresponds to ρ = −10dB in the context of level crossing)

% (d) Generate 200 samples of a Rician random variable by adding means mr=5cos(π/3) and mi
% = 5sin(π/3), respectively to the real part (X) and imaginary part (Y) in part (a). Plot the 
% samples in stem plot. What is the K factor of this Rician random variable?
% e) Repeat part (d) except use mr=5cos(π/6) and mi = 5sin(π/6). Plot the samples in stem plot. 
% What is the effect of phase change on the appearance of stem plot?
% f) We now normalize the Rician random variables to have unit mean square value. Let Rn be 
% the nth sample from Part (d). Make 200 normalized r.v. as Wn =
% Rn
% √R̅̅̅2̅
% . Plot the Wn’s as a 
% stem plot and compare to Part (a).

X=1/sqrt(2)*randn(1,200);
Y=1/sqrt(2)*randn(1,200);
R=abs(X+1j*Y);
stem(R);
title('Stem plot for part a')
%-----part b
rms=sqrt(mean(R.^2))
%-----part c
fraction_R=sum(R<10^(-10/20)*rms)/200
%-----part d
X_hat=X+5*cos(pi/3);
Y_hat=Y+5*sin(pi/3);
R_hat=abs(X_hat+1j*Y_hat);
figure
Prepared By: Dr. Syed Ali Hassan and Sarah Basharat
stem(R_hat)
title('Stem plot for part d')
%The K factor for this Rician random variable is K=25
%-----part e
X_hat1=X+5*cos(pi/6);
Y_hat1=Y+5*sin(pi/6);
R_hat1=abs(X_hat1+1j*Y_hat1);
figure
stem(R_hat1)
title('Stem plot for part e')
%-----part f
rms_hat=sqrt(mean(R_hat.^2))
Yn=R_hat/rms_hat;
figure
stem(Yn)
title('Stem plot for part f')
rms_Yn=sqrt(mean(Yn.^2))
fraction_Yn=sum(Yn<10^(-10/20)*rms_Yn)/200
% Task-2
% Plot the probability density function (pdf) and the cumulative distribution function (cdf) for a 
% Rician distribution having (a) K =10 dB and (b) K= 3 dB. The abscissa of the CDF plot should be 
% labelled in dB relative to the median signal level for both plots. Note that the median value 
% for a Rician distribution changes as K changes.

k=10; %k=3 for other
r = 0:0.1:4; %the range of value of 'r'
sigma = sqrt(1/2);
var=1/2;
A = sqrt(k);
rbess=(A/var).*r;
Jb=besselj(0,rbess);
pdf=(r./var).*exp(-(r.^2+A^2)/2*var).*Jb; % the Rician PDF espression
figure;
plot(r,pdf,'b') %Plotting the Rician PDF
title('Rician PDF Plot');
xlabel('x');
ylabel('p(x)');
cdf_1 = cdf('Rician',r,sigma,A);% the Rician CDF
figure;
hold on;
plot(r,cdf_1,'b') %Plotting the Rician PDF
title('Rician CDF Plot');
xlabel('x');
ylabel('p(x)');
median=1.177*A; %median of the Rician PDF











