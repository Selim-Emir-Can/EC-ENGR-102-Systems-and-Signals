clear all;
clc;
clf;

t_0 = -10;
t_f = 10;
dt = 0.01;
t = t_0:dt:t_f;

y = 2 + cos(t.*2*pi)- 3*cos(t.*20 + pi/4);
x_0 = (2-6*realsqrt(2)*sin(10));
a_1 = -0.5 - ((3*sin(10)/realsqrt(2))*((4*pi)/(20^2+(2*pi)^2)));
f = zeros(1, numel(t));
g = zeros(1, numel(t));
for i = 1:1:999
    
end
for i = 1:1:numel(t)
    f(i) = x_0 + 2*a_1*cos(2*pi*t(i));
end


