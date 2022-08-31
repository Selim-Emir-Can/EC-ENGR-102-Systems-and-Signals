close all;
clear all;
clc;
syms s t k;

%%% Question 1)
%% Part e)
%% K1 = 1 (stable)
stable = tf([1 -1],[2 3]);
figure (1);
h1 = pzplot(stable);

%% K2 = 5 (unstable) 
unstable = tf([1 -1],[6 -1]);
figure (2);
h2 = pzplot(unstable);



%%% Question 2)
%% Part a)
stable1 = (s-1)/(2*s+3); 
unstable1= (s-1)/(6*s-1);

X = laplace(1/2 * heaviside(t) - 1/2 * heaviside(t-3));

figure(3); % K1 = 1
Y_stable = X*stable1;
y_stable = ilaplace(Y_stable);
fplot(y_stable,[0,10]);
title("y(t) dervied from H(s) evaluated at K = 1");
ylabel("y(t)");
xlabel("t");
grid on;

figure(4); % K2 = 5
Y_unstable = X*unstable1;
y_unstable = ilaplace(Y_unstable);
fplot(y_unstable,[0,10]);
title("y(t) dervied form H(s) evaluated at K = 5")
ylabel("y(t)");
xlabel("t");
grid on;

%%% Question 2)
%% Part b)

t_0 = 0;
dt = 0.01;
t_f = 10;
t = t_0:dt:t_f;

g_stable = step(stable,t);
figure(5);
plot(t,g_stable);
title("Step Response (K = 1)")
ylabel("g(t)");
xlabel("t");
grid on;


%K = 5:
g_unstable = step(unstable,t);
figure(6);
plot(t,g_unstable);
title("Step Response (K = 5)")
ylabel("g(t)");
xlabel("t");
grid on;

%%% Question 3)
%% Part b)
w = -10*pi:pi:10*pi;
H = @(w) (1i * w - 1)/(3 * 1i * w + 2);

amp = zeros(1,length(w));
phase = zeros(1,length(w));

for i = 1:1:21
    amp(i) = sqrt(H(w(i))*conj(H(w(i))));
    phase(i) = angle(H(w(i)));
end

figure(7);
stem(w, amp);
title("Magnitude Spectra")
ylabel("|H(w)|");
xlabel("w");

figure(8);
stem(w,phase);
title("Phase Spectra")
ylabel("angle(H(w))");
xlabel("w");

%%% Question 4)
%% Part b)
t = -20:0.01:20;

n = -20:1:20;
f_n = @(n)((1i*pi*n - 1 + (-1)^n)/(2*(pi*n)^2));
An  = zeros(1,41);
magnitude_An = zeros(1,41);
angle_An = zeros(1,41);

for i = 1:1:41
    if (n(i) == 0)
        An(i) = 0.75;
    else
        An(i) = f_n(n(i));
    end
    magnitude_An(i) = sqrt(An(i)*conj(An(i)));
    angle_An(i) = angle(An(i));
end
figure(9);
stem(n,magnitude_An);
title("Magnitude Spectra of An")
ylabel("|An|");
xlabel("n");
figure(10);
stem(n, angle_An);
title("Phase Spectra of An")
ylabel("angle(An)");
xlabel("n");

%%% Question 4)
%% Part d)
Y_k = zeros(1,41);
magnitude_y = zeros(1,41);
angle_y = zeros(1,41);
k = -20:1:20;

for i = 1:1:41
    if (n(i) == 0)
        Y_k(i) = (1i*k(i)*pi-2)*3/(4*(3*pi*k(i)*1i + 4));
    else
        Y_k(i) = An(i)*(1i*k(i)*pi-2)/(3*pi*k(i)*1i + 4);
    end
    magnitude_y(i) = sqrt(Y_k(i)*conj(Y_k(i)));
    angle_y(i) = angle(Y_k(i));
end
    
figure(11);
stem(n,magnitude_y);
title("Magnitude Spectra of yk")
ylabel("|yk|");
xlabel("k");
figure(12);
stem(n, angle_y);
title("Phase Spectra of yk")
ylabel("angle(yk)");
xlabel("k");

%%% Question 4)
%% Part e)
tt = 0:0.01:12;
y_a = zeros(1,length(tt));
for i = 1:length(tt)
for k = -20:1:20
y_a(i) = y_a(i) + magnitude_y(k+21) * abs(H(1i*pi/2*k)) * cos(k*pi/2*tt(i) + angle_y(k+21));
end

end
a = zeros (1, length(tt));
for i = 1:1:length(tt)
if ((tt(i) >= 0 && tt(i) <= 2) || (tt(i) >= 4 && tt(i) <= 6) || (tt(i) >= 8 && tt(i) <= 10))
    a(i) = tt(i)/2;
else
    a(i) = 1;
end
end

figure(13);
hold on;
plot(tt, y_a, 'b-');
plot(tt, a, 'r-');
title("y_a(t) (n = 41 appx.)");
xlabel("t");
legend('y_a(t)', 'a(t)')
grid on;
hold off;


