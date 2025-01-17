%topoplots percentage change - ME control condition 

load('chanlocs')
load('RESULTS')

clmap = colormap("turbo");

%TOPOPLOTS PARULA COLORMAP

mean_freqs(:,:,1) = median(RESULTS.EEG.frequency.delta, 3, 'omitnan');

mean_freqs(:,:,2) = median(RESULTS.EEG.frequency.theta, 3, 'omitnan');

mean_freqs(:,:,3) = median(RESULTS.EEG.frequency.alpha, 3, 'omitnan');

mean_freqs(:,:,4) = median(RESULTS.EEG.frequency.beta, 3, 'omitnan');

mean_freqs(:,:,5) = median(RESULTS.EEG.frequency.low_gamma, 3, 'omitnan');

%title(t,'Percentage')
%xlabel(t,'Condition')
%ylabel(t,'Frequency Band')

sum_freqs = sum(mean_freqs,1);

freqs_perc = (mean_freqs./sum_freqs)*100;

lower_limit = min(min(min(freqs_perc)));
upper_limit = max(max(max(freqs_perc)));

%DELTA

subplot(5,6,1, ylabel, 'delta')
topoplot(freqs_perc(:,1,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
title('ME', 'FontAngle', 'italic')

subplot(5,6,2)
topoplot(freqs_perc(:,2,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
title('MI', 'FontAngle', 'italic')

subplot(5,6,3)
topoplot(freqs_perc(:,3,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
title('MIMO', 'FontAngle', 'italic')

subplot(5,6,4)
topoplot(freqs_perc(:,4,1), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)
title('MIMOHP', 'FontAngle', 'italic')

subplot(5,6,5)
topoplot(freqs_perc(:,5,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
title('MIMOVR', 'FontAngle', 'italic')

subplot(5,6,6)
topoplot(freqs_perc(:,6,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%THETA

subplot(5,6,7)
topoplot(freqs_perc(:,1,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,8)
topoplot(freqs_perc(:,2,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,9)
topoplot(freqs_perc(:,3,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,10)
topoplot(freqs_perc(:,4,2), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

subplot(5,6,11)
topoplot(freqs_perc(:,5,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,12)
topoplot(freqs_perc(:,6,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%ALPHA

subplot(5,6,13)
topoplot(freqs_perc(:,1,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,14)
topoplot(freqs_perc(:,2,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,15)
topoplot(freqs_perc(:,3,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,16)
topoplot(freqs_perc(:,4,3), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

subplot(5,6,17)
topoplot(freqs_perc(:,5,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,18)
topoplot(freqs_perc(:,6,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%BETA

subplot(5,6,19)
topoplot(freqs_perc(:,1,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,20)
topoplot(freqs_perc(:,2,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,21)
topoplot(freqs_perc(:,3,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,22)
topoplot(freqs_perc(:,4,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

subplot(5,6,23)
topoplot(freqs_perc(:,5,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,24)
topoplot(freqs_perc(:,6,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%GAMMA

subplot(5,6,25)
topoplot(freqs_perc(:,1,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,26)
topoplot(freqs_perc(:,2,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,27)
topoplot(freqs_perc(:,3,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,28)
topoplot(freqs_perc(:,4,5), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

subplot(5,6,29)
topoplot(freqs_perc(:,5,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

subplot(5,6,30)
topoplot(freqs_perc(:,6,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar