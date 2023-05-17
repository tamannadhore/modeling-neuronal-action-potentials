%{
Write a Matlab function that takes the voltage and calulates the six rates (alphas and betas) 
known as the Hodgkin and Huxley equations
%}

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