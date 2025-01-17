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

figure
t = tiledlayout(5,6);
%title(t,'Percentage Change')
%xlabel(t,'Condition')
%ylabel(t,'Frequency Band')

sum_freqs = sum(mean_freqs,1);

freqs_perc = (mean_freqs./sum_freqs)*100;

for i = 1:5
    for j = 1:6
        perc_change(:,j,i) = freqs_perc(:,1,i) - freqs_perc(:,j,i);
    end
end

lower_limit = min(min(min(perc_change)));
upper_limit = max(max(max(perc_change)));

%DELTA

nexttile
topoplot(perc_change(:,1,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
%title('ME', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,2,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
%title('MI', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,3,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
%title('MIMO', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,4,1), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)
%title('MIMOHP', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,5,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
%title('MIMOVR', 'FontAngle', 'italic')

nexttile
topoplot(perc_change(:,6,1), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
%title('MIMOVRHP', 'FontAngle', 'italic')
colorbar

%THETA

nexttile
topoplot(perc_change(:,1,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,2,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,3,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,4,2), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

nexttile
topoplot(perc_change(:,5,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,6,2), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%ALPHA

nexttile
topoplot(perc_change(:,1,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,2,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,3,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,4,3), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

nexttile
topoplot(perc_change(:,5,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,6,3), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%BETA

nexttile
topoplot(perc_change(:,1,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,2,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,3,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,4,4), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

nexttile
topoplot(perc_change(:,5,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,6,4), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar

%GAMMA

nexttile
topoplot(perc_change(:,1,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,2,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,3,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,4,5), chanlocs, 'maplimits', [lower_limit upper_limit],'colormap', clmap)

nexttile
topoplot(perc_change(:,5,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)

nexttile
topoplot(perc_change(:,6,5), chanlocs, 'maplimits', [lower_limit upper_limit], 'colormap', clmap)
colorbar