%% FIR szuro
h = firpm(50, [0 0.3 0.4 1], [1 1 0 0]);
%plot(h);
x = [1, zeros(1,30)];
y = filter(h,1,x);
%plot(y);
N = 1024;
H = fft(h, N);
plot(20*log10(abs(H)))

%% IIR szuro 
b = [1 -0.4164 1.2346];
a = [1 0.6627 0.6414];
h1 = filter(b,a,x);
%plot(h1);
H1 = fft(h1, N);
plot(20*log10(abs(H1)))
hold on;

%% masik modszer (ugyan az az IIR szuro)
H2 = fft(b,N)./fft(a,N);
plot(20*log10(abs(H2)))
hold off;
