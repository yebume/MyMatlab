6%% setup
clear all
close all
clc
grid on

%% audio file
[y, fs] = audioread('valami.wav');

%% Elliptikus szűrő
N = 6;
R1 = 2;
R2 = 60;
[B, A] = ellip(N, R1, R2, [400, 480]/(fs/2), 'stop');
[v,w] = freqz(B,A);
plot(w/2/pi*fs/2, db(v))

hold on
y_filt = filter(B, A, y);
%soundsc(y_filt, fs)

%% Butterworth szűrő
N = 2;

[B, A] = butter(N, [400, 480]/(fs/2), 'stop');
[v,w] = freqz(B,A);
plot(w/2/pi*fs/2, db(v))
hold of
y_filt = filter(B, A, y);
soundsc(y_filt, fs)
