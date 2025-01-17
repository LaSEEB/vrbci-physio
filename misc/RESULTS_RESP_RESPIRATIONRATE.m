%RESPIRATION RATE

load('RESULTS');

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

median_resprate = RESULTS.RESP.RespRate.median;

for i = 1:6
    percentage_difference(i) = ((median_resprate(i) - median_resprate(1))/median_resprate(1))*100;
end