%MEAN IAF PLOT

%mean IAF
IAF_mean(:,:) = RESULTS.EEG.frequency.IAF_mean(1,:,:);
figure(1)
boxchart(IAF_mean', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Mean Individualized Alpha Frequency (IAF)')
hold on
plot(IAF_mean, 'r.', 'HandleVisibility','off')
plot(IAF_mean)
% yline(-0.03, 'r--') %na ta vrw
% yline(0.43, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('Hz')