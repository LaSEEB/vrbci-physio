%graphs EEG

load('RESULTS')

%% MEAN IAF

vg_meanIAF


% %mean IAF
% IAF_mean(:,:) = RESULTS.EEG.frequency.IAF_mean(1,:,:);
% figure(1)
% boxchart(IAF_mean', 'HandleVisibility','off')
% xticks(categorical([1 2 3 4 5 6]))
% xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
% title('Mean Individualized Alpha Frequency (IAF)')
% hold on
% plot(IAF_mean, 'r.', 'HandleVisibility','off')
% plot(IAF_mean)
% % yline(-0.03, 'r--') %na ta vrw
% % yline(0.43, 'r--')
% legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
%     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
%     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Condition')
% ylabel('Hz')

%% PSD

vg_PSD

% %PSD (mean across subjects, all 32 electrodes)
% mean_pwrs4 = mean(RESULTS.EEG.frequency.pwr,4, 'omitnan'); %kanei mean olwn twn subjects (4th dim)
% frequencies = mean(RESULTS.EEG.frequency.freqs,[1 3 4],'omitnan'); %vriskei tis freqs pou exoume ypologisei to PSD
% 
% max_pwr = max(mean_pwrs4, [], 'all');
% min_pwr = min(mean_pwrs4, [], 'all');
% 
% figure(2)
% tiledlayout(3,2)
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,1), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,2), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,3), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,4), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,5), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs4(:,:,6), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(1, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(30, 'r--')
% xline(40, 'r--')
% ylim([0 max_pwr])
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')

% %% 
% %PSD (mean across subjects and across electrodes)
% mean_pwrs14 = mean(RESULTS.EEG.frequency.pwr,[1 4], 'omitnan'); %kanei mean olwn twn subjects (4th dim)
% frequencies = mean(RESULTS.EEG.frequency.freqs,[1 3 4],'omitnan'); %vriskei tis freqs pou exoume ypologisei to PSD
% 
% figure
% tiledlayout(3,2)
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,1), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,2), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,3), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,4), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,5), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')
% 
% nexttile
% plot(frequencies, mean_pwrs14(:,:,6), 'HandleVisibility','off')
% xticks([2.25 6 10 23.5 37.5])
% xticklabels({'delta', 'theta', 'alpha', 'beta', 'lower gamma'})
% title('Power Spectral Density')
% xline(0.5, 'r--') %na ta vrw
% xline(4, 'r--')
% xline(8, 'r--')
% xline(12, 'r--')
% xline(35, 'r--')
% xline(40, 'r--')
% % legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
% %     "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
% %     "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Hz')
% ylabel('Power (uV^2/Hz)')

%% TOPOPLOTS
vg_topoplots_sky
vg_topoplots_parula

% %% TOPOPLOTS ALPHA
% 
% mean_alpha = mean(RESULTS.EEG.frequency.alpha, 3, 'omitnan');
% load('chanlocs');
% max_alpha = max(mean_alpha,[],'all');
% min_alpha = min(mean_alpha,[],'all');
% 
% tiledlayout(3,2)
% 
% nexttile
% topoplot(mean_alpha(:,1), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% nexttile
% topoplot(mean_alpha(:,2), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% nexttile
% topoplot(mean_alpha(:,3), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% nexttile
% topoplot(mean_alpha(:,4), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% nexttile
% topoplot(mean_alpha(:,5), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% nexttile
% topoplot(mean_alpha(:,6), chanlocs, 'maplimits', [min_alpha max_alpha])
% 
% %% TOPOPLOTS BETA
% 
% mean_beta = mean(RESULTS.EEG.frequency.beta, 3, 'omitnan');
% load('chanlocs');
% max_beta = max(mean_beta,[],'all');
% min_beta = min(mean_beta,[],'all');
% 
% tiledlayout(3,2)
% 
% nexttile
% topoplot(mean_beta(:,1), chanlocs, 'maplimits', [min_beta max_beta])
% 
% nexttile
% topoplot(mean_beta(:,2), chanlocs, 'maplimits', [min_beta max_beta])
% 
% nexttile
% topoplot(mean_beta(:,3), chanlocs, 'maplimits', [min_beta max_beta])
% 
% nexttile
% topoplot(mean_beta(:,4), chanlocs, 'maplimits', [min_beta max_beta])
% 
% nexttile
% topoplot(mean_beta(:,5), chanlocs, 'maplimits', [min_beta max_beta])
% 
% nexttile
% topoplot(mean_beta(:,6), chanlocs, 'maplimits', [min_beta max_beta])
% 
% %% TOPOPLOTS GAMMA
% 
% mean_gamma = mean(RESULTS.EEG.frequency.gamma, 3, 'omitnan');
% load('chanlocs');
% max_gamma = max(mean_gamma,[],'all');
% min_gamma = min(mean_gamma,[],'all');
% 
% tiledlayout(3,2)
% 
% nexttile
% topoplot(mean_gamma(:,1), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% nexttile
% topoplot(mean_gamma(:,2), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% nexttile
% topoplot(mean_gamma(:,3), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% nexttile
% topoplot(mean_gamma(:,4), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% nexttile
% topoplot(mean_gamma(:,5), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% nexttile
% topoplot(mean_gamma(:,6), chanlocs, 'maplimits', [min_gamma max_gamma])
% 
% %% TOPOPLOTS DELTA
% 
% mean_delta = mean(RESULTS.EEG.frequency.delta, 3, 'omitnan');
% load('chanlocs');
% max_delta = max(mean_delta,[],'all');
% min_delta = min(mean_delta,[],'all');
% 
% tiledlayout(3,2)
% 
% nexttile
% topoplot(mean_delta(:,1), chanlocs, 'maplimits', [min_delta max_delta])
% 
% nexttile
% topoplot(mean_delta(:,2), chanlocs, 'maplimits', [min_delta max_delta])
% 
% nexttile
% topoplot(mean_delta(:,3), chanlocs, 'maplimits', [min_delta max_delta])
% 
% nexttile
% topoplot(mean_delta(:,4), chanlocs, 'maplimits', [min_delta max_delta])
% 
% nexttile
% topoplot(mean_delta(:,5), chanlocs, 'maplimits', [min_delta max_delta])
% 
% nexttile
% topoplot(mean_delta(:,6), chanlocs, 'maplimits', [min_delta max_delta])
% 
% %% TOPOPLOTS THETA
% 
% mean_theta = mean(RESULTS.EEG.frequency.theta, 3, 'omitnan');
% load('chanlocs');
% max_theta = max(mean_theta,[],'all');
% min_theta = min(mean_theta,[],'all');
% 
% tiledlayout(3,2)
% 
% nexttile
% topoplot(mean_theta(:,1), chanlocs, 'maplimits', [min_theta max_theta])
% 
% nexttile
% topoplot(mean_theta(:,2), chanlocs, 'maplimits', [min_theta max_theta])
% 
% nexttile
% topoplot(mean_theta(:,3), chanlocs, 'maplimits', [min_theta max_theta])
% 
% nexttile
% topoplot(mean_theta(:,4), chanlocs, 'maplimits', [min_theta max_theta])
% 
% nexttile
% topoplot(mean_theta(:,5), chanlocs, 'maplimits', [min_theta max_theta])
% 
% nexttile
% topoplot(mean_theta(:,6), chanlocs, 'maplimits', [min_theta max_theta])
