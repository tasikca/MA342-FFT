clear all; close all hidden;

% [audio, fv] = audioread("Blondie - Dreaming.mp3");
% audio = audio*3;
% [audio, fv] = audioread("CAKE - ITZY.mp3");
% [audio, fv] = audioread("Blue Monday - New Order.mp3");
[audio, fv] = audioread("Enjoy the Silence - Depeche Mode.mp3");

F = fft(mean(audio,2));
LF = size(F,1);

H1 = zeros(LF,3);
% H1(1:1000,1) = 1; H1(size(H1)-1000:end,1) = 1;

bandCutoff = [1 250; 250 2000; 2000 20000;];
for i = 1:size(bandCutoff,1)
H1(round((LF/fv)*bandCutoff(i,1)):round((LF/fv)*bandCutoff(i,2)), i) = 1;
H1(size(H1,1)-round((LF/fv)*bandCutoff(i,2)):size(H1,1)-round((LF/fv)*bandCutoff(i,1)), i) = 1;
end


figure;
hold on
plot(1:size(H1(:,1),1),H1(:,1))
plot(1:size(H1(:,1),1),H1(:,2))
plot(1:size(H1(:,1),1),H1(:,3))
% plot(1:size(H1(:,1),1),H1(:,1)+H1(:,2)+H1(:,3))

title("Filter")
hold off

figure;
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F)/LF)))
title("Full Signal"); xlabel("f(Hz)");
xlim([-10000 10000]); ylim([0 0.0025]);

figure;
hold on
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F.*H1(:,1)))/LF))
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F.*H1(:,2))/LF)))
plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift((F.*H1(:,3))/LF)))
% plot((fv/LF)*(-LF/2:LF/2-1),abs(fftshift(((F.*(H1(:,1)+H1(:,2))+H1(:,3)) )/LF)))

xlim([-10000 10000]); ylim([0 0.0025]);
title("Band Breakdown"); xlabel("f(Hz)");
hold off

% sound(real(ifft(F.*H1(:,1))),fv)
% sound(real(ifft(F.*H1(:,2))),fv)
% sound(real(ifft(F.*H1(:,3))),fv)

sound(real(ifft(F.*(H1(:,1)+H1(:,2)+H1(:,3)))),fv)
% sound(ifft(fft(audio(:,1))),fv)
