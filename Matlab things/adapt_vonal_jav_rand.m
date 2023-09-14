clear all
close all
clc
%% Audio file
[Signal, fs] = audioread('WHY.wav');
N = 2^17;
spektrum = fft(Signal, N);
L = length(Signal);

Noise = randn(L, 1)/50;

SN = Signal+Noise;



% késleltetett jel
K = 200;
SN_delayed = [zeros(K, 1); SN(1:end-K)];

%% LMS
N_filt = 400;
[e, w, yk] = myLMS(N_filt, .1/N_filt, SN_delayed, SN);
%soundsc(SN, fs);

%soundsc(yk, fs);


f = 0 : fs/N : (N-1)*(fs/N);
figure('Name','Eredeti jel');
legend('Eredeti jel')
xlabel('Frekvencia [Hz]');
xlim([0 20000])
ylabel('Amplitudó [dB]');
grid on
semilogy(f, abs(spektrum));


figure('Name','Szűrt jel');
legend('Szűrt jel')
xlabel('Frekvencia [Hz]');
xlim([0 20000])
ylabel('Amplitudó [dB]');
ylim([0.0001 1000]);
grid on
semilogy(f, abs(fft(yk,N)));


t = 0 : 1/fs : 1/fs*(332187-1);
figure('Name','Eredeti jel időtartományban');
legend('Eredeti jel')
grid on
xlabel('Idő [s]');
ylabel('Amplitúdó');
xlim([0 7.5])
plot(t, Signal)

figure(3)
figure('Name','Szűrt jel időtartományban');
legend('Szűrt jel')
grid on
xlabel('Idő [s]');
ylabel('Amplitúdó');
xlim([0 7.5])
plot(t, yk)
