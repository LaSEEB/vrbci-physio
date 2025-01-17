%TOPOPLOTS SKY COLORMAP

mean_alpha = mean(RESULTS.EEG.frequency.alpha, 3, 'omitnan');
load('chanlocs');
max_alpha = max(mean_alpha,[],'all');
min_alpha = min(mean_alpha,[],'all');

mean_beta = mean(RESULTS.EEG.frequency.beta, 3, 'omitnan');
load('chanlocs');
max_beta = max(mean_beta,[],'all');
min_beta = min(mean_beta,[],'all');

mean_gamma = mean(RESULTS.EEG.frequency.low_gamma, 3, 'omitnan');
load('chanlocs');
max_gamma = max(mean_gamma,[],'all');
min_gamma = min(mean_gamma,[],'all');

mean_delta = mean(RESULTS.EEG.frequency.delta, 3, 'omitnan');
load('chanlocs');
max_delta = max(mean_delta,[],'all');
min_delta = min(mean_delta,[],'all');

mean_theta = mean(RESULTS.EEG.frequency.theta, 3, 'omitnan');
load('chanlocs');
max_theta = max(mean_theta,[],'all');
min_theta = min(mean_theta,[],'all');

% min_all = min([min_delta min_theta min_alpha min_beta min_gamma])
% max_all = max([max_delta max_theta max_alpha max_beta max_gamma])

figure
tiledlayout(5,6)

%DELTA

nexttile
topoplot(mean_delta(:,1), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)

nexttile
topoplot(mean_delta(:,2), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)

nexttile
topoplot(mean_delta(:,3), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)

nexttile
topoplot(mean_delta(:,4), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)

nexttile
topoplot(mean_delta(:,5), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)

nexttile
topoplot(mean_delta(:,6), chanlocs, 'maplimits', [min_delta max_delta], 'colormap', sky)
colorbar

%THETA

nexttile
topoplot(mean_theta(:,1), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)

nexttile
topoplot(mean_theta(:,2), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)

nexttile
topoplot(mean_theta(:,3), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)

nexttile
topoplot(mean_theta(:,4), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)

nexttile
topoplot(mean_theta(:,5), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)

nexttile
topoplot(mean_theta(:,6), chanlocs, 'maplimits', [min_theta max_theta], 'colormap', sky)
colorbar

%ALPHA

nexttile
topoplot(mean_alpha(:,1), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)

nexttile
topoplot(mean_alpha(:,2), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)

nexttile
topoplot(mean_alpha(:,3), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)

nexttile
topoplot(mean_alpha(:,4), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)

nexttile
topoplot(mean_alpha(:,5), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)

nexttile
topoplot(mean_alpha(:,6), chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', sky)
colorbar

%BETA

nexttile
topoplot(mean_beta(:,1), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)

nexttile
topoplot(mean_beta(:,2), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)

nexttile
topoplot(mean_beta(:,3), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)

nexttile
topoplot(mean_beta(:,4), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)

nexttile
topoplot(mean_beta(:,5), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)

nexttile
topoplot(mean_beta(:,6), chanlocs, 'maplimits', [min_beta max_beta], 'colormap', sky)
colorbar

%GAMMA

nexttile
topoplot(mean_gamma(:,1), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)

nexttile
topoplot(mean_gamma(:,2), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)

nexttile
topoplot(mean_gamma(:,3), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)

nexttile
topoplot(mean_gamma(:,4), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)

nexttile
topoplot(mean_gamma(:,5), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)

nexttile
topoplot(mean_gamma(:,6), chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', sky)
colorbar
