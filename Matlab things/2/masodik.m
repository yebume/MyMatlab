clear all
close all
clc

%% 5.Feladat - szűrd le a valami.waw-ot
% 1. fft -> freq csúcs megkeresése
% 2. sávzáró szűrő tervezése (FIRPM) (kell minden a 0 és az Fs/2 között)


[y, fs] = audioread('valami.wav');

N = 2^17;
spektrum = fft(y, N);
f = 0 : fs/N : (N-1)*(fs/N);
semilogy(f, abs(spektrum));

f_noise = 440; % Hz
kutya = 10;
macska = 50;
Num = 1000;     % szűrő e ható

B = firpm(Num, [0 f_noise-macska f_noise-kutya f_noise+kutya f_noise+macska fs/2]/(fs/2), [1 0 0 0 0 1], [1 10 1]);


y_filt = conv(y, B);

% illene valami levágást
soundsc(y_filt*1125, fs)