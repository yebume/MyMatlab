%% setup
clear all
close all
clc

%% szűrő
load('guitadm.mat');
u = impresp;
N_samp = 44100;
fs = 44100;


%% FIR szűrő
spektrum = fft(u, N_samp);
f = 0 : fs/N_samp : (N_samp-1)*(fs/N_samp);
plot(f(1:(N_samp/2)), db(abs(spektrum(1:N_samp/2))));
hold on

imp = zeros(N_samp, 1);
imp(1) = 1;

NFIR = 400; %szűrő fokszáma
BFIR = u(1:NFIR);
firresp = filter(BFIR,1,imp);
firresp_fft = fft(firresp, N_samp);
plot(db(abs(firresp_fft(1:44100/2))));


%% IIR szűrő
NB = 200;   %számláló fokszáma
NA = 200;   %nevező fokszáma
NPRONY = 5000;
[BIIR, AIIR] = prony(u(1:NPRONY), NB, NA);    %44100 *44100 as mátrixot csinál és azzal számol :)
iirresp = filter(BIIR, AIIR, imp);
iirresp_fft = fft(iirresp, fs);
plot(db(abs(iirresp_fft(1:44100/2))));
hold off
