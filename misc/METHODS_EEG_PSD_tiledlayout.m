%PSD PLOTS

load('RESULTS')

%PSD (mean across subjects, all 32 electrodes)
mean_pwrs4 = mean(RESULTS.EEG.frequency.pwr,4, 'omitnan'); %kanei mean olwn twn subjects (4th dim)
frequencies = mean(RESULTS.EEG.frequency.freqs,[1 3 4],'omitnan'); %vriskei tis freqs pou exoume ypologisei to PSD

max_pwr = max(mean_pwrs4, [], 'all');
min_pwr = min(mean_pwrs4, [], 'all');

figure(2)
tiledlayout(3,2)

nexttile
plot(frequencies, mean_pwrs4(:,:,1), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('ME')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

nexttile
plot(frequencies, mean_pwrs4(:,:,2), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('MI')
xline(1, 'r--') 
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

nexttile
plot(frequencies, mean_pwrs4(:,:,3), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('MIMO')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

nexttile
plot(frequencies, mean_pwrs4(:,:,4), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('MIMOHP')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

nexttile
plot(frequencies, mean_pwrs4(:,:,5), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('MIMOVR')
xline(1, 'r--')
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

nexttile
plot(frequencies, mean_pwrs4(:,:,6), 'HandleVisibility','off')
xticks([2.25 6 10 23.5 37.5])
xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
title('MIMOVRHP')
xline(1, 'r--') 
xline(4, 'r--')
xline(8, 'r--')
xline(12, 'r--')
xline(30, 'r--')
xline(40, 'r--')
ylim([0 max_pwr])
%xlabel('Hz')
ylabel('Power (uV^2/Hz)')

exportgraphics(gca,"Methods_EEG_1.png","Resolution",300)

% %BAND POWER 
% 
% mean_powers = []; 
% mean_powers(1,:) = mean(RESULTS.EEG.frequency.delta, [1 3], 'omitnan');
% mean_powers(2,:) = mean(RESULTS.EEG.frequency.theta, [1 3], 'omitnan');
% mean_powers(3,:) = mean(RESULTS.EEG.frequency.alpha, [1 3], 'omitnan');
% mean_powers(4,:) = mean(RESULTS.EEG.frequency.beta, [1 3], 'omitnan');
% mean_powers(5,:) = mean(RESULTS.EEG.frequency.low_gamma, [1 3], 'omitnan');
% 
% sum_of_conditions = sum(mean_powers, 1);
% 
% percentage_of_bands = (mean_powers ./ sum_of_conditions);
% 
% mp = max(percentage_of_bands,[], 'all');
% 
% figure
% title('Percentage A')
% spider_plot(percentage_of_bands, ...
%     'AxesLabels', {'ME', 'MI', 'MIMO', 'MIMOHP', 'MIMOVR', 'MIMOVRHP'}, ...
%     'AxesWebType', 'circular', ...
%     'AxesDisplay', 'none', ...
%     'FillOption', 'on', ...
%     'FillTransparency', 0.1, ...
%     'AxesDisplay', 'data-percent', ...
%     'AxesDataOffset', 0.1, ...
%     'AxesFontSize', 8, ...
%     'AxesLimits', [0,0,0,0,0,0;mp,mp,mp,mp,mp,mp])
% legend('Delta', 'Theta', 'Alpha', 'Beta', 'Low Gamma')
% 
% 
% figure
% title('Percentage B')
% spider_plot(percentage_of_bands', ...
%     'AxesLabels', {'Delta', 'Theta', 'Alpha', 'Beta', 'Low Gamma'}, ...
%     'AxesWebType', 'circular', ...
%     'AxesDisplay', 'none', ...
%     'FillOption', 'on', ...
%     'AxesDisplay', 'data-percent', ...
%     'AxesDataOffset', 0.1, ...
%     'AxesFontSize', 8)
% legend('ME', 'MI', 'MIMO', 'MIMOHP', 'MIMOVR', 'MIMOVRHP')


%PERCENTAGE DIFFERENCE

% for i = 1:6
%     percentage_difference(:,i) = percentage_of_bands(:,i) - percentage_of_bands(:,1)
% end
% 
% figure
% title('Percentage Difference A')
% spider_plot(percentage_difference(:,2:6), ...
%     'AxesLabels', {'MI', 'MIMO', 'MIMOHP', 'MIMOVR', 'MIMOVRHP'}, ...
%     'AxesWebType', 'circular', ...
%     'AxesDisplay', 'none', ...
%     'FillOption', 'on', ...
%     'FillTransparency', 0.1, ...
%     'AxesDisplay', 'data-percent', ...
%     'AxesDataOffset', 0.1, ...
%     'AxesFontSize', 8)
% legend('Delta', 'Theta', 'Alpha', 'Beta', 'Low Gamma')
% 
% figure
% title('Percentage Difference B')
% spider_plot(percentage_difference(:,2:6)', ...
%     'AxesLabels', {'Delta', 'Theta', 'Alpha', 'Beta', 'Low Gamma'}, ...
%     'AxesWebType', 'circular', ...
%     'AxesDisplay', 'none', ...
%     'FillOption', 'on', ...
%     'AxesDisplay', 'data-percent', ...
%     'AxesDataOffset', 0.1, ...
%     'AxesFontSize', 8)
% legend('MI', 'MIMO', 'MIMOHP', 'MIMOVR', 'MIMOVRHP')

%%%divided in different brain lobes

%%% FRONTAL LOBE : ELECTRODES fp1,fp2,f7,f3,fz,f4,f8 = 1,2,3,4,30,31,32 =
%%% 1:4;30:32

