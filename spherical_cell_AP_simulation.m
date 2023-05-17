%{
Putting it together using the basic
Hodgkin-Huxley model (static chloride, active
sodium and potassium channels, plus membrane
capacitance). The key is to create a
simultaneous simulation (four equations 4.15 in
the text). Remember to the state of this system
is voltage plus m, n, and h. Assume this a small
spherical cell – an isopotential. Use the values
and tools created in the above two questions. 
Use Euler method to calculate he area under the
4 curves. You may want to make a general Euler
function that you can use.
%}

% parameters
radius = 1e-3; % cm
Cm = 1e-6; % F/cm^2 
Istim = 1e-10; % amps injected
% max specific conductance
Gmax.K = 36e-3; % S/cm^2
Gmax.Na = 120e-3; % S/cm^2
Gmax.Cl = 6.7e-5; % S/cm^ 
% Nernst potentials 
E.K = -75e-3; % volts
E.Na= 55e-3; % volts
E.Cl= -99e-3; % volts
% initial conditions
Vo = -60e-3; % initial volts
n0 = .3; % initial n
m0 = .2; % initial m
h0 = .2; % initial h
% Time
dt = 1e-5; % sec. simu time 
tFinal = 0.1; % end time
t = 0:dt:tFinal;
v=zeros(1:length(t));
m=zeros(1:length(t));
n=zeros(1:length(t));
h=zeros(1:length(t));
v(1)=Vo;
m(1)=m0;
n(1)=n0;
h(1)=h0;
for time=1:length(t)
 [t,y] = ode15s(@dyn, tspan, S(:,n));
end 
function[Sdot] = dyn(voltage, n, m, h)
[nA,nB,mA,mB,hA,hB]=HH(V);
mdot = (-(mA+mB).*m+mA);
hdot = (-(hA+hB).*h+hA);
ndot = (-(nA+nB).*n+nA);
vdot = 
(-Gmax.Na*m^3*h*(voltage-E.Na)-Gmax.K*n^4*(voltage-E.K)-Gmax.Cl(voltage-E.Cl)+
Istim/(4*pi*radius^2))/Cm;
Sdot = [vdot; mdot; hdot; ndot];
end
function [nAlpha, nBeta, mAlpha, mBeta, hAlpha, hBeta] = HH(V)
V_rest = -60e-3;
V = V-V_rest;
V = V*1e3;
nAlpha = (0.01*(-V+10))./(exp(1-0.1*V)-1)*1e3;
nBeta = 0.125*exp(-V/80)*1e3;
mAlpha = (0.1*(-V+25))./((exp(2.5-0.1*V)-1))*1e3;
mBeta = 4*exp(-V/18)*1e3;
hAlpha = 0.07*exp(-V/20)*1e3;
hBeta = 1./(exp(3-0.1*V)+1)*1e3;
end