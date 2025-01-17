%topoplots percentage

load('chanlocs')
load('RESULTS')

%TOPOPLOTS PARULA COLORMAP

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
t = tiledlayout(5,6);
title(t,'Percentage')
xlabel(t,'Condition')
ylabel(t,'Frequency Band')

%DELTA
sum_delta = sum(mean_delta);

mean_freq = mean_delta;
sum_freq = sum_delta;

freq_perc = (mean_freq./sum_freq)*100;

upper_limit = max(max(freq_perc));

nexttile
topoplot(freq_perc(:,1), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,2), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,3), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,4), chanlocs, 'maplimits', [0 upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,5), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,6), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%THETA

sum_theta = sum(mean_theta);

mean_freq = mean_theta;
sum_freq = sum_theta;

freq_perc = (mean_freq./sum_freq)*100;

upper_limit = max(max(freq_perc));

nexttile
topoplot(freq_perc(:,1), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,2), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,3), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,4), chanlocs, 'maplimits', [0 upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,5), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,6), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%ALPHA

sum_alpha = sum(mean_alpha);

mean_freq = mean_alpha;
sum_freq = sum_alpha;

freq_perc = (mean_freq./sum_freq)*100;

upper_limit = max(max(freq_perc));

nexttile
topoplot(freq_perc(:,1), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,2), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,3), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,4), chanlocs, 'maplimits', [0 upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,5), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,6), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%BETA

sum_beta = sum(mean_beta);

mean_freq = mean_beta;
sum_freq = sum_beta;

freq_perc = (mean_freq./sum_freq)*100;

upper_limit = max(max(freq_perc));

nexttile
topoplot(freq_perc(:,1), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,2), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,3), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,4), chanlocs, 'maplimits', [0 upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,5), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,6), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%GAMMA

sum_gamma = sum(mean_gamma);

mean_freq = mean_gamma;
sum_freq = sum_gamma;

freq_perc = (mean_freq./sum_freq)*100;

upper_limit = max(max(freq_perc));

nexttile
topoplot(freq_perc(:,1), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,2), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,3), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,4), chanlocs, 'maplimits', [0 upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,5), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(freq_perc(:,6), chanlocs, 'maplimits', [0 upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar