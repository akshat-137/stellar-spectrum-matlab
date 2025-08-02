% STELLAR  MOTION  SPECTRA
load spectra.csv
nObs = size(spectra,1);
lambdaStart = 630.02;
lambdaDelta = 0.14;
%% The star spectrum data in the spectra matrix was collected at evenly spaced wavelengths 
lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta;
lambda = (lambdaStart:lambdaDelta:lambdaEnd);
%% Each column of spectra is the spectrum of a different star.
s = spectra(:,2);
%% Plot the spectra (s) as a function of wavelength (lambda)
plot(lambda,s,".-");
xlabel("Wavelength");
ylabel("Intensity");
hold ;
%% location of the hydrogen-alpha line
[sHa,idx] = min(s);
lambdaHa = lambda(idx);
%% The point (lambdaHa,sHa) is the location of the hydrogen-alpha line.
plot(lambdaHa,sHa,"rs",MarkerSize=8);
hold off;
%% Calculate the redshift factor (z) and the speed (in km/s) at which the star is moving away from Earth.
z = lambdaHa/656.28 - 1
speed = z*299792.458