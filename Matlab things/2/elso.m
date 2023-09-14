clear all
close all
clc

%% 1. Feladat - zajos szinusjel
fs = 8000;
fx = 440;
T = 3;

t = 0 : 1/fs : T;
w = 2*pi*fx;
SNR1_dB = 20;


Signal1 = sin(w*t);
N = size(Signal1);
N = N(end);

%soundsc(u1, fs);
 
Noise1 = rand(1, N)/(10^(SNR1_dB/10)/2);      % zaj létrehozása

SN1 = Signal1 + Noise1;
%soundsc(SN1, fs)

%% 2.Feladat - zajos négyszögjel
M = 128;
z = zeros(1, M);
o = ones(1, M);


Signal2 = [z o z o z o z o z o z o z o z o z o z o z o z o z o z o];
N_S2 = size(Signal2);
N_S2 = N_S2(end);
Noise2 = rand(1, N_S2)/(10^(SNR1_dB/10)/2);
SN2 = Signal2 + Noise2;
%soundsc(SN2, fs)

%% 3.Feladat - FIR szűrő
K = 32;
a1 = 1;
b1 = 1/K * ones(1, K);

% sin jel
FSN1 = filter(b1, a1, SN1);
plot(SN1)
hold on;
plot(FSN1)
hold off;
% kisebb lett a jel, de az amplitúdója is, mert az AMP modulálódik azzal az
% értéke ami a spektruma az adott frekvencián
% 1kHz-en szinte 0-ra csökkent az amplitúdó

% négyszög jel
FSN2 = filter(b1, a1, SN2);
nexttile
plot(SN2)
hold on;
plot(FSN2)
hold off;

%% 4.Feladat - exponenciális átlagoló
alpha = 0.01;
b2 = alpha;
a2 = [1 alpha-1];

EF1 = filter(b2, a2, SN1);

plot(EF1)
hold on
plot(SN1)
hold off

EF2 = filter(b2, a2, SN2);

plot(EF2)
hold on
plot(SN2)
hold off