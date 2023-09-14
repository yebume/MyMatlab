clear all
close all
clc
%% Audio file
[Signal, fs] = audioread('valami.wav');
N = 2^17;
spektrum = fft(Signal, N);
L = length(Signal);

% késleltetett jel
K = 16;
Signal_delayed = [zeros(K, 1); Signal(1:end-K)];

%% LMS
N_filt = 1000;
[e, w] = myLMS(N_filt, .01/N_filt, Signal, Signal_delayed);
%soundsc(Signal, fs);
soundsc(e, fs);
cut = [zeros(1, 300), e(300:end)];
%soundsc(cut, fs);

f = 0 : fs/N : (N-1)*(fs/N);
figure('Name','Eredeti jel');
legend('Eredeti jel')
xlabel('Frekvencia [Hz]');
xlim([0 6000])
ylabel('Amplitudó [dB]');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(spektrum));


figure('Name','Szűrt jel');
legend('Szűrt jel')
xlabel('Frekvencia [Hz]');
xlim([0 6000])
ylabel('Amplitudó [dB]');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(fft(e, N)));

t = 0 : 1/fs : 1/fs*(100000-1);
figure('Name','Eredeti jel időtartományban');
legend('Eredeti jel')
grid on
xlabel('Idő [s]');
ylabel('Amplitúdó');
xlim([0 9])
plot(t, Signal)



figure('Name','Szűrt jel időtartományban');
legend('Szűrt jel')
grid on
xlabel('Idő [s]');
ylabel('Amplitúdó');
xlim([0 9])
plot(t, e)


