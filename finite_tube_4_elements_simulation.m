%{
Simulate a finite element tube of 4
passive cable elements (only the Chloride
channel and capacitance through the
membrane), assume the ends are plugged,
with no conductance or capacitance (ge
and go are zero).
%}

%{ 
WRONG SOLUTION
L = 0.01;
Rcl = 15e3;
Ri = 470;
C = 3e-6;
Io = 1e-9; 
radius = 0.8e-6;
go = 0;
Ecl = -60e-3;
N = 4;
nodeL = L/N;
Gcl = 1/Rcl;
Gi = 1/Ri;
SA = 2*pi*radius*L; %!!
CA=pi*radius^2;
Cnode = (SA*C)/N; %!!
Rnode = Rcl; %!!
Gnode = (SA*Gcl)/N; %!!
Ginode = (CA/((Ri*L)/N)); %!!
Istim = Io / CA; %!!
t = 0:1e-5:0.5;
V0 = Ecl * ones(N,1);
B = zeros(N,N); %!!
G = zeros(N,1); %!!
% node 1 equations
B1 = [(-0 - Ginode - Gnode), Ginode];
G1 = (Istim + (Gnode * Ecl));
% node N equations
BN = [Ginode, (0 - Ginode - Gnode)];
GN = (Gnode * Ecl);
% populating B and G based on lecture matrix for diagonalization
B(1,:) = (1/Cnode) * [B1, zeros(1,N-2)];
G(1,:) = (1/Cnode) * G1;
B(N,:) = (1/Cnode) * [zeros(1,N-2), BN];
G(N,:) = (1/Cnode) * GN;
% populating remainder of matrix with values
for j = 2:N-1
 B(j,:) = [zeros(1,j-2), Gnode, ((-2*Ginode) - Gnode), Ginode, zeros(1,N-(j-2)-3)];
 G(j,:) = Gnode * Ecl;
end
V = zeros(N,1);
[t,V] = ode23(@(t,V) B * V + G, t, V0);
distance = zeros(numel(t), N);
figure(1);
for k = 1:N
 distance(:,k) = k*(L/N) * ones(size(t));
 plot3(t, distance(:,k), V(:,k));
 hold on;
end
xlabel("Distance (cm)");
ylabel("Time (s)");
zlabel("Voltage (V)");
%}

L = 0.01;
Rcl = 15e3;
Ri = 470;
C = 3e-6;
Io = 1e-9; 
radius = 0.8e-6;
go = 0;
Ecl = -60e-3;
N = 4;
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