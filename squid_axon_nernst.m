%{
Write a MATLAB function that determines the Nernst equilibrium potentials for the ions of the 
squid giant axon at T = 36°C, given the inside and outside concentrations and the valence. Have it 
report the values to the screen.
%}

a = Nequation("K+", 1, 420, 30);
b = Nequation("Na+", 1, 40, 400);
c = Nequation("Cl-", -1, 70, 550);
function NE = Nequation(ion, z, conc_in, conc_out)
 R = 8.314; % J/K*mol
 T = 36 + 273; % K
 F = 96485.3; % C/mol
 NE = ((R * T) / (z * F)) * log(conc_out / conc_in);
 disp(ion + " Nernst equilibrium potential is " + string(NE))
end