%PSD PLOTS

%PSD (mean across subjects, all 32 electrodes)
mean_pwrs4 = mean(RESULTS.EEG.frequency.pwr,4, 'omitnan'); %kanei mean olwn twn subjects (4th dim)
frequencies = mean(RESULTS.EEG.frequency.freqs,[1 3 4],'omitnan'); %vriskei tis freqs pou exoume ypologisei to PSD

max_pwr = max(mean_pwrs4, [], 'all');
min_pwr = min(mean_pwrs4, [], 'all');

figure
plot(frequencies, mean_pwrs4(:,:,1), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')

figure
plot(frequencies, mean_pwrs4(:,:,2), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--') 
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')

figure
plot(frequencies, mean_pwrs4(:,:,3), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')

figure
plot(frequencies, mean_pwrs4(:,:,4), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')

figure
plot(frequencies, mean_pwrs4(:,:,5), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')

figure
plot(frequencies, mean_pwrs4(:,:,6), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('Power Spectral Density')
xline(1, 'r--') 
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
xlabel('Hz')
ylabel('Power (uV^2/Hz)')