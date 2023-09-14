B = VarName2;
[h, w] = freqz(B, 1, 1000);
fs = 48000;
f = w/(pi)*(fs/2);
semilogx(f, 20*log10(abs(h)))                % átvitel