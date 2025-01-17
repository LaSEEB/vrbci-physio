%HEART RATE PPG

load('RESULTS')

figure
boxchart(RESULTS.PPG.HR.vertically, 'HandleVisibility','off')
ylim([55 105])
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
%title('Heart Rate (extracted from PPG)')
hold on
plot(RESULTS.PPG.HR.horizontally, 'r.', 'HandleVisibility','off')
plot(RESULTS.PPG.HR.horizontally)
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03", ...
    'Location','bestoutside')
xlabel('Condition')
ylabel('Beats per Minute')
ylim('padded')
box on