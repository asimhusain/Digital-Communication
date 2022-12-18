% Task-1
% Free-Space and Flat Earth Path Loss Models 
% Plot and compare the path loss (dB) for the free-space and flat specular surface models at 800 MHz versus distance on a log-scale for distances from 1 m to 40 km. Assume that the antennas are isotropic and have a height of 10 m. (Use the sinusoidal path loss equation on page 28 Lecture 4 for simulating the flat surface model) 

fc=800*10^6; %frequency 
hb=10; %transmission antenna length
hm=10;% receiver antenna length
d=1:10:40000;
c=3*10^8;%speed of light
lamda=c/fc;
L_free_space=(((4*pi)^2)*(d.^2))./(lamda^2);
loglog(d,L_free_space)
L_flat_earth = (((lamda./(4.*pi.*d)).^2).*4.*(sin((2*pi*ht*hr)./(lamda.*d))).^2).^-1;
hold on
loglog(d,L_flat_earth)
xlabel('Path Length, d (m)')
ylabel('Path Loss (dB)')
title('Free-Space and Flat Earth Path Loss')
 
 

