clear
clc
Fs = 100;
T = 1/Fs;
t = 0:T:1-T;
s = sin(2*pi*10*t);
% plot(s,'r');
hold on;
noise = 0.5*randn(size(t));
x = s + noise;
% plot(x,'g');

Fc = 10;
omega = 2*pi*Fc;
num = 2*pi*Fc;
den = [1 2*pi*Fc];
H = tf(num,den);
Hd = c2d(H,0.01)

y=0;

% for i = 1:length(x)
%     y(i+1) = (y(i)*0.501)+(x(i)*0.499);
% end    
% plot(y,'b');

d = designfilt('lowpassfir','filterorder',5,'CutoffFrequency',5,'SampleRate',Fs);
plot(x,'b');
y = filter(d,x);
plot(y,'Y');

% nfft = length(s);
% nfft2 = 2^nextpow2(nfft);
% ff = fft(s,nfft2);
% plot(abs(ff));
% 
% nfft = length(y);
% nfft2 = 2^nextpow2(nfft);
% ff = fft(y,nfft2);
% plot(abs(ff),'r');


