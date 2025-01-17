%topoplots percentage change - ME control condition 

load('chanlocs')
load('RESULTS')

%TOPOPLOTS PARULA COLORMAP

mean_alpha = mean(RESULTS.EEG.frequency.alpha, 3, 'omitnan');

mean_beta = mean(RESULTS.EEG.frequency.beta, 3, 'omitnan');

mean_gamma = mean(RESULTS.EEG.frequency.low_gamma, 3, 'omitnan');

mean_delta = mean(RESULTS.EEG.frequency.delta, 3, 'omitnan');

mean_theta = mean(RESULTS.EEG.frequency.theta, 3, 'omitnan');

figure
t = tiledlayout(5,6);
title(t,'Percentage Change')
xlabel(t,'Condition')
ylabel(t,'Frequency Band')

%DELTA
sum_delta = sum(mean_delta);

mean_freq = mean_delta;
sum_freq = sum_delta;

freq_perc = (mean_freq./sum_freq)*100;

for i = 1:6
    perc_change(:,i) = freq_perc(:,1) - freq_perc(:,i);
end

lower_limit = min(min(perc_change));
upper_limit = max(max(perc_change));

nexttile
topoplot(perc_change(:,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%THETA

sum_theta = sum(mean_theta);

mean_freq = mean_theta;
sum_freq = sum_theta;

freq_perc = (mean_freq./sum_freq)*100;

for i = 1:6
    perc_change(:,i) = freq_perc(:,1) - freq_perc(:,i);
end

lower_limit = min(min(perc_change));
upper_limit = max(max(perc_change));

nexttile
topoplot(perc_change(:,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%ALPHA

sum_alpha = sum(mean_alpha);

mean_freq = mean_alpha;
sum_freq = sum_alpha;

freq_perc = (mean_freq./sum_freq)*100;

for i = 1:6
    perc_change(:,i) = freq_perc(:,1) - freq_perc(:,i);
end

lower_limit = min(min(perc_change));
upper_limit = max(max(perc_change));

nexttile
topoplot(perc_change(:,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%BETA

sum_beta = sum(mean_beta);

mean_freq = mean_beta;
sum_freq = sum_beta;

freq_perc = (mean_freq./sum_freq)*100;

for i = 1:6
    perc_change(:,i) = freq_perc(:,1) - freq_perc(:,i);
end

lower_limit = min(min(perc_change));
upper_limit = max(max(perc_change));

nexttile
topoplot(perc_change(:,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%GAMMA

sum_gamma = sum(mean_gamma);

mean_freq = mean_gamma;
sum_freq = sum_gamma;

freq_perc = (mean_freq./sum_freq)*100;

for i = 1:6
    perc_change(:,i) = freq_perc(:,1) - freq_perc(:,i);
end

lower_limit = min(min(perc_change));
upper_limit = max(max(perc_change));

nexttile
topoplot(perc_change(:,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', parula)
title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', parula)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar