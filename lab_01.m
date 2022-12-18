

% Task-1
% Generate a 3x3 matrix A.
% (a)	Calculate the inverse of matrix A by using the inv() command. Get MATLAB help by typing help inv if you don’t know how to use the command/function.
% 
% (b)	Multiply A with its inverse and verify if it produces the identity matrix. 
% 
% (c)	Generate another matrix A2=A*A and repeat the above. 

%----------Task 1----------
clc
%This function genrate matrix of order 3x3 with randon number every time it
%will run
a=randi([0 50] ,[3 3])
%takng inverse
inv_a=inv(a)
%taking product to get identity matrix
product=a*inv_a
%genrating another matrix by multiplying already genrated matrix a
a2=a*a
%taking inverse
inv_a2=inv(a2)
%taking product to get identity matrix
product2=a2*inv_a2


% Task-2
% What is the function of rand()? (Find out by using MATLAB help.)
% Ans:This function return Uniformly distributed pseudorandom numbers.
%     R = rand(N) returns an N-by-N matrix containing pseudorandom values drawn 
% from the standard uniform distribution on the open interval(0,1).  rand(M,N) or rand([M,N]) 
% returns an M-by-N matrix.  rand(M,N,P,...) or rand([M,N,P,...]) returns an M-by-N-by-P-by-... array.  
% rand returns a scalar.  rand(SIZE(A)) returns an array the same size as A.
% 
% 
% (a)	Generate five sequences of random numbers each of 100 elements and put them in a matrix of size 5x100.
% 
% (b)	 Using the command mean(), find the average of each sequence. (Hint: you will have five average values).


                    %------------Task 2-----------
%Genrating five sequence of random number from 0m to 100
seq1=rand(1,100);
seq2=rand(1,100);
seq3=rand(1,100);
seq4=rand(1,100);
seq5=rand(1,100);
%cancating the genrated sequence to form them in a order of 5x100
cantcated=[seq1;seq2;seq3;seq4;seq5];
%finding order ofd matrix to verify that it ius actually of order 5x100
order =size(cantcated);
%------part 2-------
mean1=mean(seq1)
mean2=mean(seq2)
mean3=mean(seq3)
mean4=mean(seq4)
mean5=mean(seq5)


% Task-3
% Verification of random number generation properties.
% (a)	Generate 100 random integers in the range [0,3] and calculate the frequency of each number and plot the histogram. (Hint: F(0)=20, F(1)=40, F(2)=25, F(3)=15)		
% 
% (b)	Repeat for 1000, 10000, and 100000 samples. What do you observe/conclude?  
                % Complete code of part a and part b from task 3 
                    %----------Task 3---------part 1----
num1=randi([0 3],[1,100]);
frequence_for_zero=numel(find(num1==0));
frequence_for_one=numel(find(num1==1));
frequence_for_two=numel(find(num1==2));
frequence_for_three=numel(find(num1==3));
figure (1)
h=histogram(num1,4);
title('Graph of 100 samples')
xlabel('Number')
ylabel('Frequency')
%----------Task 3---------part 2----
num1=randi([0 3],[1,1000]);
frequence_for_zero=numel(find(num1==0));
frequence_for_one=numel(find(num1==1));
frequence_for_two=numel(find(num1==2));
frequence_for_three=numel(find(num1==3));
figure (2)
h=histogram(num1,4);
title('Graph of 1000 samples')
xlabel('Number')
ylabel('Frequency')

%--------for 10000 samples-----
num1=randi([0 3],[1,10000]);
frequence_for_zero=numel(find(num1==0));
frequence_for_one=numel(find(num1==1));
frequence_for_two=numel(find(num1==2));
frequence_for_three=numel(find(num1==3));
figure (3)
h=histogram(num1,4);
title('Graph of 10000 samples')
xlabel('Number')
ylabel('Frequency')


%--------for 100000 samples-----
num1=randi([0 3],[1,100000])
frequence_for_zero=numel(find(num1==0))
frequence_for_one=numel(find(num1==1))
frequence_for_two=numel(find(num1==2))
frequence_for_three=numel(find(num1==3))
figure (4)
h=histogram(num1,4);
title('Graph of 100000 samples')
xlabel('Number')
ylabel('Frequency')

% (c)	Repeat (a) and (b) for random integers [0-7] and sample sizes of 100, 1000, 10000 and 100000. What do you observe from your results?

%----------Task 3---------part 3----
num1=randi([0 7],[1,1000]);
frequence_for_zero=numel(find(num1==0));
frequence_for_one=numel(find(num1==1));
frequence_for_two=numel(find(num1==2));
frequence_for_three=numel(find(num1==3));
frequence_for_four=numel(find(num1==4));
frequence_for_five=numel(find(num1==5));
frequence_for_six=numel(find(num1==6));
frequence_for_seven=numel(find(num1==7));
figure (5)
h=histogram(num1,8);
title('Graph of 1000 samples')
xlabel('Number')
ylabel('Frequency')

%--------for 10000 samples-----
num1=randi([0 7],[1,10000]);
frequence_for_zero=numel(find(num1==0));
frequence_for_one=numel(find(num1==1));
frequence_for_two=numel(find(num1==2));
frequence_for_three=numel(find(num1==3));
frequence_for_four=numel(find(num1==4));
frequence_for_five=numel(find(num1==5));
frequence_for_six=numel(find(num1==6));
frequence_for_seven=numel(find(num1==7));
figure (6)
h=histogram(num1,7);
title('Graph of 10000 samples')
xlabel('Number')
ylabel('Frequency')


%--------for 100000 samples-----
num1=randi([0 7],[1,100000]);
frequence_for_zero=numel(find(num1==0))
frequence_for_one=numel(find(num1==1))
frequence_for_two=numel(find(num1==2))
frequence_for_three=numel(find(num1==3))
frequence_for_four=numel(find(num1==4))
frequence_for_five=numel(find(num1==5))
frequence_for_six=numel(find(num1==6))
frequence_for_seven=numel(find(num1==7))
figure (7)
h=histogram(num1,8);
title('Graph of 100000 samples')
xlabel('Number')
ylabel('Frequency')

% Task-4
% Simulation of Gaussian noise. 
% (a)	Generate a real Gaussian noise sequence with zero mean and variance 1. Plot the histogram to verify the sequence has a Gaussian distribution. (Hint: randn() and hist()) 
% 
% (b)	Plot and compare it with the theoretical Gaussian function. (Hint: wgn())
% 
% (c)	What is the average symbol power of the sequence?
% Average symbol power of the sequence is 0.001 dBW.

% Complete code of part a and part b from task 4

%------------task 4------------
norm=randn(100000,1)
mean1=mean(norm)
varirance=var(norm)
%Genral functin is Y= mean+var*wgn(m,n,power)
Y=wgn(100000,1,0.001);
figure(2)
h1=histogram(norm);
title('Normal distributiuon using randn function')
figure(3)
h1=histogram(norm);
hold on
h2=histogram(Y)
title('Comparison of normal distributions ');

% Task-5
% Plotting sinusoid. 
% (a)	Generate variable t=linspace(0,2*pi,20). Calculate the sin values by using the sin() command. Plot them on a graph with t as the x-axis and sin(t) as the y-axis. Give labels properly for the x and y axes as t and sin(t), respectively.  Set the marker to square, the line width of the graph to 3, and the line color to red. (pi=3.1415).
% Code of part a task 5

%----------Task 5---------
t=linspace(0,2*pi,20);
tt=sin(t);
figure(4)
plot(t,tt,'--rs','LineWidth',3)
xlabel('x');
ylabel('sinx');
% (b)	Create function sineplot.m that receives one argument n, k (n, k are scalars). 
% This function will generate variable t which has n elements equispaced between 0 and 2*pi. It will generate the values of sin(n*k). The function will also plot the graph on MATLAB figure (using the plot() function). Label the x and y-axis of the graph.
% Code of part b task 5

function[t,sint]=sineplot(n,k)
t=linspace(0,2*pi,n);
sint=sin(t*k);
plot(t,sint,'--rs','LineWidth',3)
xlabel('t');
ylabel('sint');

