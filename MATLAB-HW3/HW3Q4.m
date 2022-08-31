clear all;
clc;
clf;

syms t
u = @(t)(heaviside(t));
r = @(t)(t*u(t));
tri = @(t)(r(t)-2*r(t-1)+r(t-2));
x = @(t)(sin(2*pi*t)*u(t+1)*u(-t+1));
h = @(t)(u(t) - u(t-1));
hold on

%% Q4 part a)

figure(1);
grid on
axis equal on
fplot(t, x(t));
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('x(t)', 'Interpreter', 'none', 'fontsize', 16);
legend('x(t)');
title('Q4 part  a) t vs. x(t)', 'Interpreter', 'none', 'fontsize', 18);
xlim([-3,3]);
ylim([-3,3]);

figure(2);
fplot(t, h(t));
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('h(t)', 'Interpreter', 'none', 'fontsize', 16);
legend('h(t)');
title('Q4 part  a) t vs. h(t)', 'Interpreter', 'none', 'fontsize', 18);
xlim([-3,3]);
ylim([-1,2]);


%% Q4 part d)

y1 = @(t)((( (1-cos(2*pi*t))/(2*pi) )*(u(t+1)-u(t)))+(( (cos(2*pi*t)-1)/(2*pi) )*(u(t-1)-u(t-2))));
y2 = @(t)(sin(2*pi*t)*(u(t)-u(t-1))*u(t+1)*u(-t+1));

figure(3);
fplot(t, y1(t));
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('y1(t)', 'Interpreter', 'none', 'fontsize', 16);
legend('y1(t)');
title('Q4 part d) t vs. y1(t)', 'Interpreter', 'none', 'fontsize', 18);
xlim([-3,3]);
ylim([-1.5,1.5]);

figure(4);
fplot(t, y2(t));
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('y2(t)', 'Interpreter', 'none', 'fontsize', 16);
legend('y2(t)');
title('Q4 part d) t vs. y2(t)', 'Interpreter', 'none', 'fontsize', 18);
xlim([-3,3]);
ylim([-1.5,1.5]);


%% Q4 part e)

dt = 0.001;
t = -3:dt:3;
x = zeros(1, numel(t));
h = zeros(1, numel(t));
convolution = zeros(1, numel(t));
for i =1:1:numel(t)
    x(i) = sin(2*pi*t(i))*heaviside((t(i)+1))*heaviside((1-t(i)));
    h(i) = heaviside(t(i))- heaviside(t(i)-1); 
    convolution(i) = 2*pi*(1 - cos(2*pi*t(i)))*(heaviside(t(i)+1)-heaviside(t(i)));
end
z = conv(x, h, 'same');
t1 = linspace(-3,3, numel(z));
figure(5);
plot(t, z*dt);
grid on
axis on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('conv(x, h)', 'Interpreter', 'none', 'fontsize', 16);
legend('conv(x, h)')
title('Part e) t vs conv(x, h)', 'Interpreter', 'none', 'fontsize', 18);
xlim([-3,3]);
ylim([-1.5,1.5]);

hold off
