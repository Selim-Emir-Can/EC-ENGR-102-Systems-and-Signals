clear all;
clc;

w_0 = -10;
dw = 0.01;
w_f = 10;
w = w_0:dw:w_f;

amplitude = realsqrt( ((2*pi*(1 + 4*pi^2 - w.^2))./((1 + 4*pi^2 - w.^2).^2 +(2*w).^2) + cos(-2*w)).^2 +...
    ((-4*pi*w)./((1 + 4*pi^2 - w.^2).^2 +(2*w).^2) + sin(-2*w)).^2);

phase = atan(((-4*pi*w)./((1 + 4*pi^2 - w.^2).^2 +(2*w).^2) + sin(-2*w))./...
    ((2*pi*(1 + 4*pi^2 - w.^2))./((1 + 4*pi^2 - w.^2).^2 +(2*w).^2) + cos(-2*w)));


figure(1);
plot(w, amplitude);
title('Amplitude Spectrum' );
xlabel('Omega');
ylabel('|X(Omega)|');
figure(2);
plot(w, phase, 'o');
title('Phase Spectrum' );
xlabel('Omega');
ylabel('Phase(X(Omega))');
hold off

