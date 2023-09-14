%% setup
clear all
close all
clc
grid on

%% zaj generálása
fs = 44100;
noise = randn(1, fs);
%soundsc(noise, fs)

%% zaj vizsgálata
M = 1024;
spektrum = fft(noise, M);
f = 0 : fs/M : (M-1)*(fs/M);
%semilogy(fs, abs(spektrum))
%pwelch(noise)
%periodogram(noise)     %kedvenc


%% 8. fokú Butterworth IIR szűrő
N = 8   ;
fc = 5000; %5kHz
[B, A] = butter(N, fc/(fs/2));
h = filter(B,A,noise);
H = fft(h, M);

plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));
hold on

%% 4. fokú Butterworth IIR szűrő
%{
N = 4;
fc = 5000; %5kHz
[B, A] = butter(N, fc/(fs/2));
h = filter(B,A,noise);
H = fft(h, M);
%}
plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));

%% 2. fokú felüláteresztő szűrő IIR szűrő
%{
N = 2;
fc = 5000; %5kHz
[B, A] = butter(N, fc/(fs/2), 'high');
h = filter(B,A,noise);
H = fft(h, M);
plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));
%}
hold off

% Amp és fázis
%freqz(B,A);
[v,w] = freqz(B,A); % táblán [h,w]
plot(w, db(v))
hold on


%% 8. fokú Chebyshev1 szűrő
N = 8;
R = 2; %dB
[B,A] = cheby1(N,R,fc/(fs/2));
h = filter(B,A,noise);
H = fft(h, M);

%plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));

% Amp és fázis
[v,w] = freqz(B,A); % táblán [h,w]
plot(w, db(v))


%% 8. fokú Chebyshev2 szűrő
N = 8;
R = 60; %dB
[B,A] = cheby2(N,R,fc/(fs/2));
h = filter(B,A,noise);
H = fft(h, M);

%plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));

% Amp és fázis
[v,w] = freqz(B,A); % táblán [h,w]
plot(w, db(v))


%% 8. fokú Elliptikus szűrő
N = 8;
R1 = 2; %dB
R2 = 60; %dB
[B,A] = ellip(N,R1,R2,fc/(fs/2));
h = filter(B,A,noise);
H = fft(h, M);

%plot(f(1:(M/2)), 20*log10(abs(H(1:(M/2)))));

% Amp és fázis
[v,w] = freqz(B,A); % táblán [h,w]
plot(w, db(v))
hold off














