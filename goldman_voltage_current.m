%{
Write a MATLAB function to calculate
Goldman (GHK) voltage-current equation for
calcium voltage-current relation,
(equation 14.2 in the text – yes, chapter
14), which considers membrane thickness.
Keep [Ca]in constant and vary [Ca]out to
get multiple different ratios of
[Ca]out/[Ca]in. (Assume z=+2, F=9.648e4
C/mole, R=8.314 J/K/mole, T=292K).
%}

T = 36 + 273;
k= 1.380649*10^-23;
v = -100:0.01:-0.1;
e = 1.602176634*10^19;
vT = k * T / e;
CaIn = 10^-4;
CaOut = 1;
u = CaIn/CaOut;
phi1 = v*((1-u*exp(z*v./vT))/(1-exp(z*v./vT)));
plot(v,phi1)
hold on
CaOut = 2;
u = CaIn/CaOut;
phi2 = v*((1-u*exp(z*v./vT))/(1-exp(z*v./vT)));
plot(v,phi2)
CaOut = 3;
u = CaIn/CaOut;
phi3 = v*((1-u*exp(z*v./vT))/(1-exp(z*v./vT)));
plot(v,phi3)