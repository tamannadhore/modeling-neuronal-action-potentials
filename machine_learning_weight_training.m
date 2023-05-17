% Step 1
wn = [-1 0 0];
input1 = [1, 1, 0];
x = dot(wn,input1);
if x < 0
 theta = 0;
else
 theta = 1;
end
disp('value of initial output is ' + string(theta))
dx = theta;
% Step 2
n = 1;
y = 1;
wnplus1 = wn + -n*(y-dx)*input1;
disp('weights after one training are ')
disp(wnplus1)
% Step 3
input2 = [1, 1, 1];
x = dot(wnplus1,input2);
if x < 0
 theta = 0;
else
 theta = 1;
end
disp('value of second output is ' + string(theta))
dx = theta;
y = y+1;
wnplus2 = wnplus1 + n*(y-dx)*input2;
% Step 4
input3 = [1, -2, 0];
x = dot(wnplus2,input3);
if x < 0
 theta = 0;
else
 theta = 1;
end
dx = theta;
y = y+1;
wnplus3 = wnplus2 + n*(y-dx)*input3;
disp('value of third output is ' + string(theta))
input4 = [1, -1, -3];
x = dot(wnplus3,input4);
if x < 0
 theta = 0;
else
 theta = 1;
end
dx = theta;
disp('value of second output is ' + string(theta))
y = y+1;
wnplus4 = wnplus3 + n*(y-dx)*input4;
disp("first Epoch of Training complete")