%EKSAGWGH GRAFIKWN PARASTASEWN TWN APOTELESMATWN

load('RESULTS');
load('FINRESULTS');

%% RESP
%RESPIRATION RATE

figure('Name','Respiration Rate')
boxchart(RESULTS.RESP.RespRate.vertically, 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
%title('Respiration Rate')
hold on
plot(RESULTS.RESP.RespRate.horizontally, 'r.', 'HandleVisibility','off')
plot(RESULTS.RESP.RespRate.horizontally)
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03", ...
    'Location','bestoutside')
xlabel('Condition')
ylabel('Breaths Per Minute')
ylim('padded')
box on

%% ECG
%HEART RATE

figure
boxchart(RESULTS.ECG.HR.vertically, 'HandleVisibility','off')
ylim([55 105])
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Heart Rate (extracted from ECG)')
hold on
plot(RESULTS.ECG.HR.horizontally, 'r.', 'HandleVisibility','off')
plot(RESULTS.ECG.HR.horizontally)
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03", ...
    'Location','bestoutside')
xlabel('Condition')
ylabel('Beats per Minute')
ylim('padded')
box on

%HEART RATE VARIABILITY
%TIME

%SDNN - need to fix outliers
figure
boxchart(RESULTS.ECG.HRV.time.SDNN', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Standard Deviation of NN Intervals (SDNN - extracted from ECG)')
hold on
plot(RESULTS.ECG.HRV.time.SDNN, 'r.', 'HandleVisibility','off')
plot(RESULTS.ECG.HRV.time.SDNN)
yline(50, 'r--')
yline(100, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('SDNN')

%RMSSD -need to fix outliers
figure
boxchart(RESULTS.ECG.HRV.time.RMSSD', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Root-Mean-Square of Successive RR interval Difference (RMSSD - extracted from ECG)')
hold on
plot(RESULTS.ECG.HRV.time.RMSSD, 'r.', 'HandleVisibility','off')
plot(RESULTS.ECG.HRV.time.RMSSD)
yline(19, 'r--')
yline(107, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('RMSSD')

%pNN50 -need to fix outliers
figure
boxchart(RESULTS.ECG.HRV.time.pNN50', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Percentage of Successive RR interval Difference (pNN50 - extracted from ECG)')
hold on
plot(RESULTS.ECG.HRV.time.pNN50, 'r.', 'HandleVisibility','off')
plot(RESULTS.ECG.HRV.time.pNN50)
yline(-0.03, 'r--')
yline(0.43, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('pNN50')

%lfhf -need to fix outliers
figure
boxchart(RESULTS.ECG.HRV.frequency.lfhf', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('LF/HF (extracted from ECG)')
hold on
plot(RESULTS.ECG.HRV.frequency.lfhf, 'r.', 'HandleVisibility','off')
plot(RESULTS.ECG.HRV.frequency.lfhf)
% yline(-0.03, 'r--') %na ta vrw
% yline(0.43, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('LF/HF')

%% PPG
%HEART RATE

figure
boxchart(RESULTS.PPG.HR.vertically, 'HandleVisibility','off')
ylim([55 105])
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Heart Rate (extracted from PPG)')
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

%HEART RATE VARIABILITY
%TIME

%SDNN - need to fix outliers
figure
boxchart(RESULTS.PPG.HRV.time.SDNN', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Standard Deviation of NN Intervals (SDNN - extracted from PPG)')
hold on
plot(RESULTS.PPG.HRV.time.SDNN, 'r.', 'HandleVisibility','off')
plot(RESULTS.PPG.HRV.time.SDNN)
yline(50, 'r--')
yline(100, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('SDNN')

%RMSSD -need to fix outliers
figure
boxchart(RESULTS.PPG.HRV.time.RMSSD', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Root-Mean-Square of Successive RR interval Difference (RMSSD - extracted from PPG)')
hold on
plot(RESULTS.PPG.HRV.time.RMSSD, 'r.', 'HandleVisibility','off')
plot(RESULTS.PPG.HRV.time.RMSSD)
yline(19, 'r--')
yline(107, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('RMSSD')

%pNN50 -need to fix outliers
figure
boxchart(RESULTS.PPG.HRV.time.pNN50', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('Percentage of Successive RR interval Difference (pNN50 - extracted from PPG)')
hold on
plot(RESULTS.PPG.HRV.time.pNN50, 'r.', 'HandleVisibility','off')
plot(RESULTS.PPG.HRV.time.pNN50)
yline(-0.03, 'r--')
yline(0.43, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('pNN50')

%lfhf -need to fix outliers
figure
boxchart(RESULTS.PPG.HRV.frequency.lfhf', 'HandleVisibility','off')
xticks(categorical([1 2 3 4 5 6]))
xticklabels({'ME', 'MI', 'MIMO', 'MIMOVR', 'MIMOHP', 'MIMOVRHP'})
title('LF/HF (extracted from PPG)')
hold on
plot(RESULTS.PPG.HRV.frequency.lfhf, 'r.', 'HandleVisibility','off')
plot(RESULTS.PPG.HRV.frequency.lfhf)
% yline(-0.03, 'r--') %na ta vrw
% yline(0.43, 'r--')
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", ...
    "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", ...
    "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('LF/HF')

