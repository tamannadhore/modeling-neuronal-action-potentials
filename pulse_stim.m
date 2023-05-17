%{
Setup an injection of a pulse of current
that can be later queried using linear
interpolation: 𝐼𝑠𝑡𝑖𝑚 from t1 to t2 (ms)
%}

mag=1e-10; 
t1=9e-4;
d=2e-4; 
t2=t1+d; 
tf=10; 
Istim = [ 0, 0
 t1-eps, 0
 t1, mag
 t2, mag
 t2+eps, 0
 tf, 0 ]; 
t=0:1e-3:.01;
inputCurrent = interp1(Istim(:,1),Istim(:,2),t);
plot(t,inputCurrent)
xlabel("time(s)")
ylabel("current(A)")