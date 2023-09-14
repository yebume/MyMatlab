fs = 8000;
fx = 440;
fx2 = 419;
T = 3;

t = 0 : 1/fs : T;
w = 2*pi*fx;
w2 = 2*pi*fx2;

%% sin jel
% soundsc(sin(w*t) , fs);

%% haromszog jel
u = sin(w*t) - sin(3*w*t)/(3^2) + sin(5*w*t)/(5^2);
%plot(u)

F1 = 0;
for k = 0:3
F1 = F1 + (8/pi^2)*cos((2*k+1)*w*t)/(2*k+1)^2;
end
G1 = 0;
for k = 0:3
G1 = G1 + (8/pi^2)*cos((2*k+1)*w2*t)/(2*k+1)^2;
end
%plot(F1);
%soundsc(F1, fs)

N = 16384;

F1 = F1 + G1;

F2 = hanning(N)'.*F1(1:N);
F3 = flattopwin(N)'.*F1(1:N);
F4 = gausswin(N)'.*F1(1:N);


X1 = fft(F1, N);
X2 = fft(F2, N);
X3 = fft(F3, N);
X4 = fft(F4, N);


f = 0 : fs/N : (N-1)*(fs/N);

plot(f, 20*log10(abs(X1)))
hold on;
plot(f, 20*log10(abs(X2)))
plot(f, 20*log10(abs(X3)))
plot(f, 20*log10(abs(X4)))
hold off;

