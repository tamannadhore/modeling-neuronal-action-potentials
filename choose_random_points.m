% Use the randn() to make a plot of 1000 points whose x_y coordinates are chosen from random normal distributions. 

x = randn(1,1000);
y = randn(1,1000);
plot(x,y)
title('random coordinates')
xlabel('random x')
ylabel('random y')