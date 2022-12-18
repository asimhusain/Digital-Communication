% Task-1
% BPSK Constellation Diagram
% (a)	Generate information sequence of 200 random bits. Perform the BPSK modulation. How many BPSK symbols do you produce? Draw the constellation diagram for BPSK using scatterplot() command. (Hint: pskmod())
n=200;
bits = double(rand(1,n)>0.5) % generating 0,1 with equal probability
M = 2;
txSig = pskmod(bits,M,0);
figure(1)
scatterplot(txSig)
figure(2)
% rxSig = awgn(txSig,10);
% (b)	Create zero vector of size (1,20). Perform BPSK modulation. Add noise with SNR of 10 dB.  Plot the noisy signal samples. (Hint: awgn())
n=20;
bits = zeros(1,n) % generating 0,1 with equal probability
M = 2;
txSig = pskmod(bits,M,0);
scatterplot(txSig)
rxSig = awgn(txSig,10);
scatterplot(rxSig)
% (c)	Repeat (b), for information sequence of all “1”.
n=20;
bits = ones(1,n) % generating 0,1 with equal probability
M = 2;
txSig = pskmod(bits,M,0);
scatterplot(txSig)
rxSig = awgn(txSig,10);
scatterplot(rxSig)


% 
% Task-2
% MPSK Constellation Diagram
% (a)	Generate 200 random bits. Map to 4-ary numbers and perform QPSK modulation. How many QPSK symbols do you produce? Draw the constellation diagram for QPSK using scatterplot() command.	
% 
M=4; %M-ARY NUMBERS
x = randi([0 M-1],1,200);
y=pskmod(x,M);
scatterplot(y);

% (b)	Repeat part (a) for 8PSK modulation.	
M=8; %M-ARY NUMBERS
x = randi([0 M-1],1,200);
y=pskmod(x,M);
scatterplot(y);
% (c)	Create zero vector of size (1,20).  Perform QPSK modulation. Add noise with SNR of 10Db.  Plot the noisy signal samples. By visual observation of the scatterplot, how many symbol errors do you find?  
% 
% 
% 
% 

X = zeros(1,20);
 
y=pskmod(x,4);
xpr=awgn(y,10); %10Db SNR 
scatterplot(xpr);
% Task-3
% QAM Constellation Diagram
% (a)	Generate 300 random bits and perform 16QAM modulation. How many 16QAM symbols do you produce? Draw the constellation diagram for 16QAM using scatterplot(). 
% 
% 
M=16; %M-ARY NUMBERS
x = randi([0 M-1],1,300);
y=qammod(x,M);
scatterplot(y);
% (b)	Repeat part (a) for 64QAM modulation.	
% 64 symbols 
% (c)	Create ‘five’ vector of size (1,300). Perform 16QAM modulation. Add noise with SNR of 5 Db and 10 Db (remember to normalize the SNR).  Plot the noisy signal samples. By visual observation of the scatterplot, how many symbol errors do you find? (Hint: 5*ones()=[5 5 5…] and qammod())
% 
x = 5* ones(1,300);
 
y=qammod(x,16);
xpr=awgn(y,10); %10dB SNR 
 
scatterplot(xpr);
figure(1)
xpr=awgn(y,5); %10dB SNR 
scatterplot(xpr);
figure(2)



