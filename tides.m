close all; clear all;
%https://tidesandcurrents.noaa.gov/stations.html?type=Water+Levels

data = readtable('hrBridgeportCTtides.csv', MissingRule='fill');
waterLevel = data.Verified_ft_;

Fs = 24;
T = 1/Fs;
L = size(waterLevel,1);

Y = fft(waterLevel);

figure
plot(1:L,waterLevel)

figure
plot((Fs/L)*(-L/2:L/2-1),abs(fftshift(Y/L)))
% xlim([-10 10]); 
ylim([0 5]); xlabel("hours");
