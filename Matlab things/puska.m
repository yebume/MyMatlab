%% Szűrők:
%% Ált:
%h = filter(b, a, s);
%% FIR:
% h = firpm(N,F,A);
%% N-ed fokú Butterworth szűrő:
% [B, A] = butter(N, fc/(fs/2));
%% N-ed fokú Chebyshev1 szűrő
% [B,A] = cheby1(N,R,fc/(fs/2));
%% N-ed fokú Elliptikus szűrő
% [B,A] = ellip(N,R1,R2,fc/(fs/2));


%% Elemzők:
% plot(20*log10(abs(fft(h))));
% f = 0 : fs/N : (N-1)*(fs/M);
% semilogy(fs, abs(spektrum))
% pwelch(noise)
% periodogram(noise)
% Amp és fázis
%   [h,w] = freqz(b,a);
%   plot(w, db(h)
% spectrogram(s, window, 0, N_sample, f_sampling)
%    colormap jet


%% Ablak jelek:
% F = hanning(N)'     .*F1(1:N);
% F = flattopwin(N)'  .*F1(1:N);
% F = gausswin(N)'    .*F1(1:N);

