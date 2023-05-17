%{
Use the Eigen command in MATLAB and write a small code that displays the eigenvalues, left and
right eigenvectors of matrix B given in equation 5.5 in the book.
%}
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);

%{
Define a symbolic time variable using: t=sym(‘t’);
Then use expm command to find the analytical solution of ydot=By. Assume that the initial
condition vector is a vector of ones.
%}
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);
t = sym('t');
y0 = ones(4,1);
y = expm(B*t)*y0;

% Now redefine tt as a vector. Write a code that calculates and plots the state vector.
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);
t = 0:1e-5:0.1;
y0 = ones(4,4);
y = zeros(4, length(t));
for ind=1:length(t)
 y(:,i) = expm(B*t(ind))*y0;
end
plot(t,y)

%{
Using what you have learned so far, create a code that shows analytically the modes of the
system ydot = By
%}
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);
t = sym('t');
y0 = ones(4,1);
y = expm(B*t)*y0;
mode = y(:, 1)
mode2 = y(:, 2)
mode3 = y(:, 3)
mode4 = y(:, 4)

% Write a simple code that shows the decomposed solution of Q7.2
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);
t = sym('t');
y0 = ones(4,1);
y = expm(B*t)*y0;
inv_rightE = inv(rightE);
x = inv_rightE * y;
w2 = imag(EV(2,2));
p2 = real(rightE(:,2));
q2 = imag(rightE(:,2));
a2 = real(inv_rightE(:,2)*y);
b2 = real(rightE(:,2)*y);
w3 = imag(EV(3,3));
p3 = real(rightE(:,3));
q3 = imag(rightE(:,3));
a3 = real(inv_rightE(:,3)*y);
b3 = real(rightE(:,3)*y);
decomposed2 = [p2 q2] * [cos(w2*t), sin(w2*t); -sin(w2*t), cost(w2*t)] * [a2; b2];
decomposed3 = [p3 q3] * [cos(w3*t), sin(w3*t); -sin(w3*t), cost(w3*t)] * [a3; b3];


% Using the method of Q7.3 and what you did in Q7.4 plot modes of the system against time.
B = [-4.2097, 0, 0, 0.0265; 0, -0.1175, 0, -0.0041; 0, 0, -0.1833, 0.0028; 77.2344, 2.3133, -28.2822, -0.6822];
[rightE, EV, leftE] = eig(B);
t = 0:1e-5:0.1;
mode = [];
mode2 = [];
mode3 = [];
mode4 = [];
for ind = 1:length(t)
 y0 = ones(4,1);
 y = expm(B*t(i))*y0;
 mode = [mode, y(:, 1)];
 mode2 = [mode2, y(:, 2)];
 mode3 = [mode3, y(:, 3)];
 mode4 = [mode4, y(:, 4)];
end
plot(t, mode)
hold on
plot(t, mode2)
plot(t, mode3)
plot(t, mode4)