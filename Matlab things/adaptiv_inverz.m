clear all
close all
clc

%% filter
M = 50;
%a = 1;
g = firpm(M, [0 0.3 0.4 0.6 0.7 1], [0.01 0.01 1 1 0.01 0.01]);
%g = firpm(M, [0 0.3 0.4 0.6 0.7 1], [0 0 1 1 0 0]);
y = randn(1, 1000000);

%% data
b = g;
a = 1;

%% LMS
N = 500;
s = filter(b, a, y);
s0 = filter(b, a, [1 zeros(1,999)]);
nz = 200;
d = [zeros(1, nz), y(1:end-nz)];
mu = .1/N;
[error, w] = myLMS(N, mu, s, d);

P = 1000;
[h0, w0] = freqz(b, a, P);
[ha, wa] = freqz(w, 1, P);

figure(1)

plot(abs(h0),'LineWidth',2.0);
hold on;
plot(abs(ha),'LineWidth',2.0);
plot(abs(ha.*h0),'LineWidth',2.0);


legend('Sáv záró szűrő', 'A szűrő inverze','Sávzáró és inverzének a szorzata')
xlabel('Frekvencia [Hz]');
xlim([300 700])
ylabel('Amplitudó [dB]');
ylim([0 3]);
grid on

%figure(2);
%plot(log(abs(error)));
%semilogy(abs(error))

%figure(3)

%plot(s0)
%hold on;
%plot(w);


