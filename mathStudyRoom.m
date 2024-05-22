clear all; close all hidden;

[background, fv] = audioread("Math study room video.m4a");
[video, fb] = audioread("Math Study room background.m4a");

T = 1/fv;
Lv = size(video,1);
Lb = size(background,1);

vF = fft(video);
bF = fft(background);

Lv = size(vF,1)
Lb = size(bF,1)


H1 = ones(size(vF));
% lowCutoff = 6000;
% H1(round((Lv/fv)*lowCutoff):size(H1,1)-round((Lv/fv)*lowCutoff)) = 0;
% 
% highCutoff = 4000;
% H1(1:round((Lv/fv)*highCutoff)) = 0;
% H1(size(H1,1)-round((Lv/fv)*highCutoff):end) = 0;

% bandCutoff1 = [1775 1825];
% H1(round((Lv/fv)*bandCutoff1(1)):round((Lv/fv)*bandCutoff1(2))) = 0;
% H1(size(H1,1)-round((Lv/fv)*bandCutoff1(2)):size(H1,1)-round((Lv/fv)*bandCutoff1(1))) = 0;
% 
% bandCutoff2 = [1900 1950];
% H1(round((Lv/fv)*bandCutoff2(1)):round((Lv/fv)*bandCutoff2(2))) = 0;
% H1(size(H1,1)-round((Lv/fv)*bandCutoff2(2)):size(H1,1)-round((Lv/fv)*bandCutoff2(1))) = 0;
% 
% bandCutoff3 = [5600 5700];
% H1(round((Lv/fv)*bandCutoff3(1)):round((Lv/fv)*bandCutoff3(2))) = 0;
% H1(size(H1,1)-round((Lv/fv)*bandCutoff3(2)):size(H1,1)-round((Lv/fv)*bandCutoff3(1))) = 0;

% bandCutoff = [35 55; 75 95; 100 170; 700 750; 1775 1825; 1900 1950; 5500 5700; 6200 6300; 8500 8600;];
% for i = 1:size(bandCutoff,1)
% H1(round((Lv/fv)*bandCutoff(i,1)):round((Lv/fv)*bandCutoff(i,2))) = 0;
% H1(size(H1,1)-round((Lv/fv)*bandCutoff(i,2)):size(H1,1)-round((Lv/fv)*bandCutoff(i,1))) = 0;
% end

vF(find(abs(vF/Lv)>0.5e-5)) = 0;

figure
plot(1:size(H1,1),H1)

% figure
% plot(1:Lv,video)

figure
plot((fv/Lv)*(0:Lv-1),(vF.*H1))

figure
plot((fv/Lv)*(-Lv/2:Lv/2-1),abs(fftshift((vF)/Lv)))
% xlim([-500 500])

% figure
% plot((fb/Lb)*(-Lb/2:Lb/2-1),abs(fftshift((bF)/Lb)))



% ifft(vF.*H)
sound(real(ifft(vF)),fv)
% sound(real(ifft(vF.*H1)),fv)