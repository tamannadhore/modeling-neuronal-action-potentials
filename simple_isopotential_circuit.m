%{
The simple isopotential circuit model (radius = 10.1 μm), 
with a leaky, biased, and dielectric membrane has 
 Cm = 0.89 μF/cm^2 
 gCl = 0.31 mS/cm^2. 
(Remember conductances g is a reciprocal of resistance). 
Capacitance and conductance are per unit area of membrane 
patch, so they they should be scaled to understand the whole 
cell. 
As was shown in lecture, Kirchhoff’s current law can provide 
a characteristic equation in terms of the parameters 
provided in the figure above. (dV_m/dt = ?) Solve the 
characteristic equation analytically for the given current 
pulse. Create MATLAB code that uses this equation to give 
voltages across time, from zero to tMax.
%}

close all;
clear;
clc;
%% Assign given variables
cM = 0.89*10^-6; % microfarads per square cm
gCl = 0.31e-3; % milliSiemens per square cm
r = 10.1 * 10^-4; % in meters
clOut = 560*10^-3; % in milliMolar
clIn = 40*10^-3; % in Millimolar
T = 300.25; % in Kelvin
R = 8.314; % Ideal Gas Constant 
F = (9.684)*(10^4); % Faraday's Constant
z = -1; % the valence for each given ion is +/- 1 (in mols)
ECl = ((R*T)/(F*z)) * log(clOut/clIn); 
% Nernst (resting) Potential for Chloride
disp(ECl + " mV is the Nernst Potential for Chloride ");
% A check for correctness
%% Define pulse paramters
pulseAmplitude = 11 *10^-12; % in Amps
pulseStart = 10*1e-3; % starting index
pulseWidth = 25*1e-3; 
pulseEnd = pulseStart + pulseWidth;
tMax = 50*10^-3; % in milliseconds
t = 0 : 10^-5 : tMax;
% pulse = zeros(1,length(t));
% pulse((pulseStart:pulseEnd))= pulseAmplitude;
%% Compute, define, and assign surface area, capacitance, resistance, and 
conductance
SA = 4*pi*r^2;
cCell = cM*SA;
gCell = gCl*SA;
rCell = 1/gCell;
tau = rCell*cCell;
V_analytic = double.empty(length(t),0);
%% Plotting and Evaluation of analytic solution to RC Circuit
for i = 1:length(t)
 if t(i)>=pulseStart && t(i)<=pulseEnd
 
 I = pulseAmplitude;
 
 else
 I = 0;
 end
 if t(i)<=pulseEnd
 V_analytic(i) = I*rCell*(1-exp(-(t(i)-pulseStart)/(rCell*cCell)))+ECl;
 
 else
 V_pulseEnd = (I*cCell)*(1-exp(-(pulseEnd- pulseStart)/(rCell*cCell)))+ECl;
 V_analytic(i) = -(ECl-V_pulseEnd)*exp(-(t(i)- pulseEnd)/(rCell*cCell))+ECl;
 end
end
%subplot(2,1,1);
plot(t*1e3,V_analytic*1e3, 'b','LineWidth',1.5, 'DisplayName', 'Analytic Solution');
xlabel('Time(ms)');
ylabel('Voltage(mV)');
hold on;
% Subplot current versus time for comparison of time intervals
% 
% subplot(2,1,2);
% plot(t,pulse, 'r-', 'DisplayName', 'Input Current');
% xlabel('Time(s)');
% ylabel('Current(pA)');
% ylim([0 1.2*10^-11])