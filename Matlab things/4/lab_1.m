%% setup
clear all
close all
clc
grid on

%% 1.feladat
[s, f_sample] = audioread('taram.wav');
N_sample = 2^15;
window = hanning(N_sample);
f_sampling = 44100;

pwelch(s, window, 0, N_sample, f_sampling)
%(jel, ablak, átlapolódás, mintavételi freq)

spectrogram(s, window, 0, N_sample, f_sampling)
colormap jet