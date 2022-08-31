%%% Question 3
clear all;
clc;
clf;

dt = 0.001;
t = -5:dt:5; %% t(5001) = 0 , t(5501) = 0.5

y1 = zeros(1, numel(t));
y2 = zeros(1, numel(t));
y3 = zeros(1, numel(t));

sinc = @(t)(sin(t*pi)/(t*pi));


%% part 3)a)



for i = 1:1:numel(t)
    y1(i) = sinc(2*t(i)-1);
end
y1(5501) = 1;

figure(1);
plot(t, y1);
grid on
axis on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('Signal y(2t-1)', 'Interpreter', 'none', 'fontsize', 16);
legend('y = sinc(2t-1)');
title('Part 3)a) t vs y(2t-1)', 'Interpreter', 'none', 'fontsize', 18);



%% part 3)b)

for i = 1:1:numel(t)
    y2(i) = (sinc(t(i)))^2;
end
y2(5001) = 1;

figure(2);
plot(t, y2);
grid on
axis on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('Signal y(t)^2', 'Interpreter', 'none', 'fontsize', 16);
legend('y = sinc(t)^2');
title('Part 3)b) t vs y(t)^2', 'Interpreter', 'none', 'fontsize', 18);


%% part 3)c)

for i = 1:1:numel(t)
    y3(i) = sinc(t(i)); 
end
y3(5001) = 1;

z = conv(y3, y3, 'same');
figure(3);
plot(t, z*dt);
grid on
axis on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('Signal z(t)', 'Interpreter', 'none', 'fontsize', 16);
legend('z = conv(y,y)')
title('Part 3)c) t vs z(t)', 'Interpreter', 'none', 'fontsize', 18);



%% part 3)d)

t1 = zeros(1, numel(t));

for i = 1:1:numel(t)
    t1(i) = (t(i)+1)/2;
end

figure(4);
plot(t1, (z*dt));
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('Signal z(2t-1)', 'Interpreter', 'none', 'fontsize', 16);
legend('z(2t-1)')
title('Part 3)d) t vs z(2t-1)', 'Interpreter', 'none', 'fontsize', 18);


%%y1(i) = sinc(2*t(i)-1)
%%y3(i) = sinc(t(i))

h = conv(y3, y1, 'same');
figure(5);
plot(t, h*dt);
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('conv(y(t),y(2t-1))', 'Interpreter', 'none', 'fontsize', 16);
legend('conv(y(t),y(2t-1))')
title('Part 3)d) t vs conv(y(t),y(2t-1))', 'Interpreter', 'none', 'fontsize', 18);


g = conv(y1, y1, 'same');
figure(6);
plot(t, g*dt);
grid on
axis equal on
xlabel('Time (t)', 'Interpreter', 'none', 'fontsize', 16);
ylabel('conv(y(2t-1),y(2t-1))', 'Interpreter', 'none', 'fontsize', 16);
legend('conv(y(2t-1),y(2t-1))')
title('Part 3)d) t vs conv(y(2t-1),y(2t-1))', 'Interpreter', 'none', 'fontsize', 18);
