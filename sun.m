clear all; close all hidden;

data = readtable('SN_d_tot_V2.0.csv', MissingRule='omitrow');
firstIndex = find(data.decYear>1974,1);
lastIndex = find(data.decYear>2024,1);
decDates = data.decYear(firstIndex:lastIndex);
sunSpots = data.Snvalue(firstIndex:lastIndex);
sunSpots(find(sunSpots==-1))=mean(sunSpots);

Fs = 365.25;
T = 1/Fs;
L = size(sunSpots,1);

Y = fft(sunSpots);

figure
plot(decDates,smoothdata(sunSpots))

figure
plot((Fs/L)*(-L/2:L/2-1),abs(fftshift(Y/L)))
ylim([0 10]); xlim([-30 30]); xlabel("years");
