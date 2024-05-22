clear all; close all hidden;
%https://www.nasa.gov/history/alsj/quindar.html#:~:text=%22'Other%20space%20missions'%20is,an%20outgoing%20transmission%20from%20Earth.

[audio, fv] = audioread("hskquindar.mp3");

F = fft(audio);
LF = size(F,1);

H1 = ones(LF,1);

bandCutoff = [2510 2540; 2560 2590;];
for i = 1:size(bandCutoff,1)
H1(round((LF/fv)*bandCutoff(i,1)):round((LF/fv)*bandCutoff(i,2))) = 0;
H1(size(H1,1)-round((LF/fv)*bandCutoff(i,2)):size(H1,1)-round((LF/fv)*bandCutoff(i,1))) = 0;
end

figure
plot(1:size(H1,1),H1)

figure
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F)/LF)))
xlabel("f(Hz)"); ylabel("|fft(X)|")

figure
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F.*H1)/LF)))
xlabel("f(Hz)"); ylabel("|fft(X)|")

% sound(real(ifft(F)),fv)
sound(real(ifft(F.*H1)),fv)
