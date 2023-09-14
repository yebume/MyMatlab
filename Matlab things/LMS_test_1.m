clear all
close all
clc
%% Szűrő
[y, fs] = audioread('C:\Users\Yebume\Documents\Egyetem\MATLAB\Tema Lab\LMS teszt\valami.wav');
N = 2^17;
spektrum = fft(y, N);

f_noise = 440; % Hz
a = 10;
b = 50;
Num = 1000;     % szűrő e ható

h = firpm(Num, [0 f_noise-b f_noise-a f_noise+a f_noise+b fs/2]/(fs/2), [1 0 0 0 0 1], [1 10 1]);
y_filt = conv(y, h);
%soundsc(y_filt*1125, fs)

Signal = y;
%% LMS

M = 1001;            % szűrő ehatók száma
mu = 1/1001;         % bátorsági tényező
L = length(y);       % gerj hossza
w = zeros(M, 1);     % szűrő e.hatók
s = randn(1,L);      % bemeneti jel
%d = y_filt;         % kimeneti jel
d = filter(h,1,s);
x = zeros(M,1);      % forgó vekt, késleltetők imeneti értékét tartalmazza
e = zeros(1,L);      % hiba vektor
%w = h';

    for k = 1:L      % k: futó időváltózó
        x(1)   = s(k); 
        y      = w' * x; 
        e(k)   = d(k)  - y;
        w      = w  + mu*e(k)*x;
        x(2:M) = x(1:(M-1)); 
    end

filtfilt = filter(w,1,Signal);

%% Vizsgálat
f = 0 : fs/N : (N-1)*(fs/N);
figure('Name','Az eredeti jel');
legend('Eredeti jel')
xlabel('Frekvencia [Hz]');
xlim([0 6000])
ylabel('Amplitudó');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(fft(y, N)));

figure('Name','FIR szűrő kimenete');
legend('FIR szűrő kimenete')
xlabel('Frekvencia [Hz]');
xlim([0 6000])
ylabel('Amplitudó');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(fft(y_filt, N)));

figure('Name','LMS szűrő kimenete');
legend('LMS által megvalósított szűrő kimenete')
xlabel('Frekvencia [Hz]');
xlim([0 6000])
ylabel('Amplitudó');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(fft(filtfilt, N)));

semilogy(abs(e))


%soundsc(y, fs)
%soundsc(y_filt, fs)
%soundsc(filtfilt, fs)

