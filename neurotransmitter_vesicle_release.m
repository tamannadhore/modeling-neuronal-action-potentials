%{
Make a function that creates a Poisson
distribution using equation,
use this to make a plot of probability of
vesicles released vs number released, using
lambda=11 (this is a PDF, or a probability
distribution).
%}

p=pois(11,15);
function p=pois(lambda,k)
 k = 1:k;
 p = poisspdf(k,lambda);
 figure
 bar(k,p,1)
 xlabel('Number of Vesicles')
 ylabel('Probability')
end

%{
Use this function to model the drawing of
samples from this distribution. One way is to
first randomly select a candidate possibility k
using round(n*rand(1)) functions out of the n
possible vesicles that could be released.
use your above probability distribution to
determine this selected k is chosen: 
p=pois(L,k). Then, “roll the dice” to get a
random value between zero and 1: q=rand(1). If
q is less than p, then select it, otherwise
start over-- pick a new candidate k, and repeat.
Find a way to show this result graphically using
a histogram of the results of repeated tries.
%}

n = 15; %total number of vesicles that could be released
j = 0;
p_total=zeros(1,n);
while j <= 100
 i = 0;
 while i == 0
 s = round(n*rand(1));
 [p1, q1] = pois(11,s);
 if q1 < p1
 figure
 bar(1:s,p1,1)
 xlabel('Number of Vesicles')
 ylabel('Probability')
 i = 1;
 else
 end
 end
 x = length(p1);
 p1(x+1:15) = 0;
 p_total = p_total + p1;
 j = j+1;
end
figure
p_sum = sum(p_total);
factor = 1/p_sum;
p_total = p_total*factor;
bar(1:n,p_total,1)
xlabel('Number of Vesicles')
ylabel('Probability')
 
 function [p, q] = pois(lambda,k)
 k = 1:k;
 p = poisspdf(k,lambda);
 q = rand(1);
 end