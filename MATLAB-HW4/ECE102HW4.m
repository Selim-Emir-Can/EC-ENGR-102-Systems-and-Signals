clear all
clc;
clf;
close all

%% Question 5) part a)
syms t;
f = ((t-5)^4*exp(-3*t)*heaviside(t));
L = laplace(f);
fprintf('The equation for the laplace transform of f(t) is:\n F(s) = %s.\n',char(L));

%% Question 5) part b)
syms s
F = 1/(s*(s+2-1i*(pi/3))*(s+2+1i*(pi/3)));
h = ilaplace(F);
real_h = real(h);
figure(1);
fplot(real_h,[0,2]);
xlabel('t');
ylabel('f(t)');
title('t vs f(t)');
grid on;
