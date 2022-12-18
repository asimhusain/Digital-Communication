% Task-1
% Blocked Calls Cleared System
% Suppose that an urban area has three competing trunked mobile networks (systems A, B, and C) to provide cellular service. System A has 500 cells with 25 channels/cell, System B has 50 cells with 100 channels/cell, and System C has 120 cells with 60 channels/cell. Ignore handoff traffic and assume uniform cell traffic loading. 
% (a)	Plot the (Erlang-B) blocking probability, B (A, C), for each system versus A 

% Function for finding probability
function pb = B(A,C)
summation = 0;
pb = zeros(1,length(A));
for i=1:length(A)
    for k=0:C
        summation = summation + (A(i).^k)/factorial(k);
    end
pb(i) = ((A(i).^C)/factorial(C))/summation;
summation = 0;
end
end

% Code for finding the probabilities

%Code for Probability of Blocking
clear
cellsA = 500; cellsB = 50; cellsC = 120;
channA = 25; channB = 100;channC = 60;
A=[0.1:0.5:200]
PbA = []; PbB = []; PbC = [];
for i = A
temp = B(i,channA);
PbA = [PbA temp];
temp = B(i,channB);
PbB = [PbB temp];
temp = B(i,channC);
PbC = [PbC temp];
end
figure(); hold on; grid on; box on;
xlim([0, 200])
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
plot(A, PbA,'b', 'linew', 2);
plot(A, PbB,'r', 'linew', 2);
plot(A, PbC,'g', 'linew', 2);
xlabel("Traffic Intensity A (Erlangs)");
ylabel("Blocking Probability");
title("Blocking Probability for Systems A, B and C");
legend("System A", "System B", "System C");
% 
% (b)	Find the number of users that can be accommodated by each system for a blocking probability of 1% if the traffic loading offered by each user is 0.5 Erlangs

% Function for finding probability
function pb = B(A,C)
summation = 0;
pb = zeros(1,length(A));
for i=1:length(A)
    for k=0:C
        summation = summation + (A(i).^k)/factorial(k);
    end
pb(i) = ((A(i).^C)/factorial(C))/summation;
summation = 0;
end
end

% Code for finding number of users

%Code for Probability of Blocking
clear
Pb = 0.01; Au = 0.5;
cellsA = 500; cellsB = 50; cellsC = 120;
channA = 25; channB = 100;channC = 60;
A=[0.1:0.5:200];
PbA = []; PbB = []; PbC = [];
for i = A
temp = B(i,channA);
PbA = [PbA temp];
temp = B(i,channB);
PbB = [PbB temp];
temp = B(i,channC);
PbC = [PbC temp];
end
[val,idxA]=min(abs(PbA-Pb));
[val,idxB]=min(abs(PbB-Pb));
[val,idxC]=min(abs(PbC-Pb));
UA = A(idxA)/Au;
UB = A(idxB)/Au;
UC = A(idxC)/Au;
total_A = floor(UA * cellsA)
total_B = floor(UB * cellsB)
total_C = floor(UC * cellsC)
% 
% Task-2
% Blocked Calls Delayed System
% Consider the trunked mobile networks (systems A, B, and C) given in Task-1.
% (a)	Using the blocking probability, B (A, C), obtained in part (a) of Task-1, plot the (Erlang-C) probability of delay, C (A, C), for each system versus A.
% Function to find Erlang C
function pb = Erlang_C(A,C)
pb= (C*B(A,C))/(C-A*(1-B(A,C)));
pb=vpa(pb);
end
clear
cellsA = 500; cellsB = 50; cellsC = 120;
channA = 25; channB = 100;channC = 60;
A=[0.1:0.5:200]
PbA = []; PbB = []; PbC = [];
pb_delay=[];
for i = A
temp = Erlang_C(i,channA);
PbA = [PbA temp];

temp = Erlang_C(i,channB);
PbB = [PbB temp];
temp = Erlang_C(i,channC);
PbC = [PbC temp];
end
figure(1); hold on; grid on; box on;
xlim([0, 200])
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
plot(A, PbA,'b', 'linew', 2);
plot(A, PbB,'r', 'linew', 2);
plot(A, PbC,'g', 'linew', 2);
xlabel("Traffic Intensity A (Erlangs)");
ylabel("Blocking Probability");
title("Bprobability of delay for Systems A, B and C");
legend("System A", "System B", "System C");
% 
% 
% (b)	Find the GOS for each system for the case of delay greater than 20 seconds. Assume Pr [delay > 0] = 5% and H = 105 s. 
% 
% 
% Code
clc
C=[25 100 60];      %channels/cell
A=[16.12 84.06 46.95]; %traffic intensity from Erlang B grapgh
%gos = ones(1,length(C));
Pb=0.05; %bloccking probability
t=20; %delay time
H=105; %Holding time
GOS = (C.*Pb)./(C-(A.*(1-Pb))) .* (2.7182.^((A-C).*(t/H)))
% 
% Blocked Calls Delayed System
% Consider a trunked system in which a queue is provided to hold calls which are blocked. If a channel is not available immediately, the call request may be delayed until a channel becomes available. measure of GOS is defined as the probability that a call is blocked after waiting a specific length of time in the queue. To find the GOS, it is first necessary to find the likelihood that a call is initially denied access to the system. The likelihood of a call not having immediate access to a channel is determined by the following formula
% 〖Pr 〗⁡〖[delay>0]= A^C/(A^C+C!(1-A/C) ∑_(k=0)^(C-1)▒A^k/k!  )〗,
% where A and C represent the total offered traffic in Erlangs and the number of trunked channels, respectively.
% 	(a) For the above-mentioned trucked system, create a MATLAB function which takes A and C as inputs and return Pr [delay>0].

Function
function pb = fun(A,C) 
syms k
num=A.^C;
summ = symsum(((A.^k)./factorial(k)),k,0,C-1);
denom = (A.^C) + factorial(C) .* (1-A./C) .* summ;
pb = num./denom; 

pb=vpa(pb);
end 

% (b)	Plot the probability of waiting for C= [1:10 15 20:10:100] against A.

C=[1:10 15 20:10:100];
A=1:500;
Prob = zeros(length(C),length(A));
for i=1:length(C)
    Prob(i,1:end) = fun(A,C(i));
    plot(A,Prob(i,1:end))
    hold on
    title("probability of waiting ");
end
% (c)	Based on the results in part (a) and (b), determine the probability that a call will be delayed to more than 5 seconds. The design of the cellular system is based on the following specifications.
% 
% Parameter	Value
% No. of channels	96
% Cluster size	12
% Average number of call requests	2 calls/hour
% Traffic intensity per user	0.01 Earlang
% Grade of service (GoS)	4%
code
clc
C=96/12;      %channels/cell
lambda = 2/(60*60); %average call requests = 2 calls/hour
Au = 0.01;
H=Au/lambda;
Pb=0.04; %blocking probability
t=5; %delay time
A=5; %using table of Erlang B
prob_delay = (C.*Pb)./(C-(A.*(1-Pb))) .* (2.7182.^((A-C).*(t/H))) % for t>5





