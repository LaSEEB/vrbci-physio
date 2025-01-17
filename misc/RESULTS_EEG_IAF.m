%RESULTS EEG IAF per brain lobe

load('RESULTS')

median_IAF = median(RESULTS.EEG.frequency.IAF, 3, 'omitnan') %median olwn twn subjects

%%
%%% FRONTAL LOBE : ELECTRODES fp1,fp2,f7,f3,fz,f4,f8 = 1,2,3,4,30,31,32 =
%%% 1:4;30:32

frontal = median_IAF([1:4,30:32], :);
frontal_median = median(frontal, 1, 'omitnan');

%%
%%% CENTRAL LOBE : ELECTRODES 6,7,8,11,12,22,23,24,25,28,29 =
%%% 6:8,11:12,22:25,28:29

central = median_IAF([6:8,11:12,22:25,28:29], :);
central_median = median(central, 1, 'omitnan');

%%
%%% PARIETAL LOBE : ELECTRODES 13,14,15,19,20=
%%% 13:15,19:20

parietal = median_IAF([13:15,19:20], :);
parietal_median = median(parietal, 1, 'omitnan');

%%
%%% OCCIPITAL LOBE : ELECTRODES 16,17,18 =
%%% 16:18

occipital = median_IAF([13:15,19:20], :);
occipital_median = median(occipital, 1, 'omitnan');

%%
%%% TEMPORAL LOBE : ELECTRODES 5,9,10,21,26,27
%%% 5,9:10,21,26:27

temporal = median_IAF([13:15,19:20], :);
temporal_median = median(temporal, 1, 'omitnan');

%%
median_IAF_per_lobe = [frontal_median; central_median; parietal_median; occipital_median; temporal_median];

%%
%%%plotting

