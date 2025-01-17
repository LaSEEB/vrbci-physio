%ECG V PPG 

%HR vs PR

load('RESULTS')

% for i = 1:6
% 
%     x = [RESULTS.ECG.HR.vertically(:,i),RESULTS.PPG.HR.vertically(:,i)]
% 
%     kruskalwallis(x)
% 
% end

%HRV vs PRV

%SDNN

% for i = 2:6
% 
%     y = [RESULTS.ECG.HRV.time.SDNN(i,:);RESULTS.PPG.HRV.time.SDNN(i,:)]
% 
%     kruskalwallis(y')
% 
% end

%RMSSD

% for i = 2:6
% 
%     z = [RESULTS.ECG.HRV.time.RMSSD(i,:);RESULTS.PPG.HRV.time.RMSSD(i,:)]
% 
%     kruskalwallis(z')
% 
% end

%RMSSD

for i = 1:6

    k = [RESULTS.ECG.HRV.time.pNN50(i,:);RESULTS.PPG.HRV.time.pNN50(i,:)]

    kruskalwallis(k')

end