%{
Next, write a program that creates a set of
equations for a tube of N sections (nodes)? 
Perhaps specified as length X meters, divided
up into N sections? Hint: write code that
creates a zero matrix, then populate the
tri-diagonal using for loops. Then, add code
for the end nodes. Also add a nernst for
Chloride, Ecl = -60e-3 % volts Start your
simulation at -60 millivolts at all nodes.
Choose some value of nodes N, above 10, to show
your results.
%}

L = 0.01;
Rcl = 15e3;
Ri = 470;
C = 3e-6;
Io = 1e-9; 
radius = 0.8e-6;
go = 0;
Ecl = -60e-3;
N = 50;
nodeL = L/N;
Gcl = 1/Rcl;
Gi = 1/Ri;
SA=2*pi*radius*nodeL;
CA=pi*radius^2;
Cnode = SA*C;
Gnode = SA*Gcl;
Ginode = 1/((nodeL*Ri)/(pi*radius^2));
t = 0:1e-5:0.5;
V = Ecl * ones(N,1);
B = Gcl*Ecl*ones(N,1); 
B(1) = B(1) + Io/(Cnode);
G = zeros(N,N);
G(1,1) = -Gnode-Ginode;
G(1,2) = Ginode;
G(N,N-1) = Ginode;
G(N,N) = -Gnode-Ginode-go;
for i = 2 : N-1
 G(i,i) = (-Gnode-2*Ginode); 
 G(i, i+1) = Ginode;
 G(i, i-1) = Ginode;
end
[t,V] = ode23(@(t,V)((1/Cnode)*(G*V + B)),[t(1), t(end)],V);
for j = 1 : length(G)
 for i = 1 : length(V)
 distance(i) = j*nodeL;
 end
 plot3(distance,t,V(:,j));
 hold on;
end
xlabel("Distance (cm)");
ylabel("Time (s)");
zlabel("Voltage (V)");