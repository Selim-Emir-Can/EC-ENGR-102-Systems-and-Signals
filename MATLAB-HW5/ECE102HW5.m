%% Question 5
clear all;
clc;
T_0 = 2;
w_0 = 2*pi/T_0;
dt = 0.001;
t_0 = 0;
t_f = 2;
t = t_0:dt:t_f;
k = -20:1:20;
x_1 = zeros(1, numel(k));
x_2 = zeros(1, numel(k));
for index = 1:1:41
x_1(index) = realsqrt((real((exp(1i*k(index)*pi)-1)/(1i*2*k(index)*pi)))^2 + ...
 (imag((exp(1i*k(index)*pi)-1)/(1i*2*k(index)*pi)))^2) ;
end
x_1(21) = 0.5;
for index = 1:1:41
x_2(index) = realsqrt((real((-exp(1i*pi*k(index))*(1-2*exp(-1i*pi*k(index))+ ...
 exp(-1i*2*pi*k(index))))/(2*pi^2*(k(index))^2)))^2 + ...
 (imag((-exp(1i*pi*k(index))*(1-2*exp(-1i*pi*k(index))+ ...
 exp(-1i*2*pi*k(index))))/(2*pi^2*(k(index))^2)))^2);
end
x_2(21) = 0.5;
hold on
figure(1);
stem(k, x_1);
title('stem plot for k vs |x_k| for x1(t) = u(t) - u(t-1)' );
xlabel('k');
ylabel('|x_k| for x1(t) = u(t) - u(t-1)');
figure(2);
stem(k, x_2);
title('stem plot for k vs |x_k| for x2(t) = r(t) - 2*r(t-1) + r(t-2)' );
xlabel('k');
ylabel('|x_k| for x2(t) = r(t) - 2*r(t-1) + r(t-2)' );
hold off