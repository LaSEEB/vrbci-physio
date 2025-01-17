%SPIDER PLOTS

load('RESULTS')

Conditions = {'ME' 'MI' 'MIMO' 'MIMOHP' 'MIMOVR' 'MIMOVRHP'};
Signals = {'Respiration Rate' 'Heart Rate(ECG)' 'Heart Rate(PPG)'};

%Conditions as Axes

A = RESULTS.RESP.RespRate.median;
B = RESULTS.ECG.HR.median;
C = RESULTS.PPG.HR.median;
P = [A; B; C];

figure
spider_plot(P, ...
    'AxesLabels', Conditions, ...
    'AxesDisplay', 'all', ...
    'AxesWebType','circular')
legend('Respiration Rate', 'Heart Rate(ECG)', 'Heart Rate(PPG)')

%Features as Axes
A = RESULTS.RESP.RespRate.median';
B = RESULTS.ECG.HR.median';
C = RESULTS.PPG.HR.median';
P = [A B C];

figure
spider_plot(P, ...
    'AxesLabels', Signals, ...
    'AxesWebType','circular')
legend(Conditions)