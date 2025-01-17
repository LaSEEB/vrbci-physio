%PSD per brain lobe

load('RESULTS')

%median olwn twn subjects, ara katalhgw se freqband (5) * elecs (32) *
%condition (6) array 
median_powers(1,:,:) = median(RESULTS.EEG.frequency.delta, 3, 'omitnan');
median_powers(2,:,:) = median(RESULTS.EEG.frequency.theta, 3, 'omitnan');
median_powers(3,:,:) = median(RESULTS.EEG.frequency.alpha, 3, 'omitnan');
median_powers(4,:,:) = median(RESULTS.EEG.frequency.beta, 3, 'omitnan');
median_powers(5,:,:) = median(RESULTS.EEG.frequency.low_gamma, 3, 'omitnan');
%%
%%% FRONTAL LOBE : ELECTRODES fp1,fp2,f7,f3,fz,f4,f8 = 1,2,3,4,30,31,32 =
%%% 1:4;30:32

frontal_lobe = median_powers(:,[1:4,30:32],:);

frontal_lobe_delta(:,:) = frontal_lobe(1,:,:);
frontal_lobe_theta(:,:) = frontal_lobe(2,:,:);
frontal_lobe_alpha(:,:) = frontal_lobe(3,:,:);
frontal_lobe_beta(:,:) = frontal_lobe(4,:,:);
frontal_lobe_low_gamma(:,:) = frontal_lobe(5,:,:);

[p_frontal(1), tbl_frontal1] = kruskalwallis(frontal_lobe_delta,[],'off');
[p_frontal(2), tbl_frontal2] = kruskalwallis(frontal_lobe_theta,[],'off');
[p_frontal(3), tbl_frontal3] = kruskalwallis(frontal_lobe_alpha,[],'off');
[p_frontal(4), tbl_frontal4] = kruskalwallis(frontal_lobe_beta,[],'off');
[p_frontal(5), tbl_frontal5] = kruskalwallis(frontal_lobe_low_gamma,[],'off');
%%
%%% CENTRAL LOBE : ELECTRODES 6,7,8,11,12,22,23,24,25,28,29 =
%%% 6:8,11:12,22:25,28:29 
central_lobe = median_powers(:,[6:8,11:12,22:25,28:29],:);

central_lobe_delta(:,:) = central_lobe(1,:,:);
central_lobe_theta(:,:) = central_lobe(2,:,:);
central_lobe_alpha(:,:) = central_lobe(3,:,:);
central_lobe_beta(:,:) = central_lobe(4,:,:);
central_lobe_low_gamma(:,:) = central_lobe(5,:,:);

[p_central(1), tbl_central1] = kruskalwallis(central_lobe_delta,[],'off');
[p_central(2), tbl_central2] = kruskalwallis(central_lobe_theta,[],'off');
[p_central(3), tbl_central3] = kruskalwallis(central_lobe_alpha,[],'off');
[p_central(4), tbl_central4] = kruskalwallis(central_lobe_beta,[],'off');
[p_central(5), tbl_central5] = kruskalwallis(central_lobe_low_gamma,[],'off');
%%
%%% PARIETAL LOBE : ELECTRODES 13,14,15,19,20=
%%% 13:15,19:20
parietal_lobe = median_powers(:,[13:15,19:20],:);

parietal_lobe_delta(:,:) = parietal_lobe(1,:,:);
parietal_lobe_theta(:,:) = parietal_lobe(2,:,:);
parietal_lobe_alpha(:,:) = parietal_lobe(3,:,:);
parietal_lobe_beta(:,:) = parietal_lobe(4,:,:);
parietal_lobe_low_gamma(:,:) = parietal_lobe(5,:,:);

[p_parietal(1), tbl_parietal1] = kruskalwallis(parietal_lobe_delta,[],'off');
[p_parietal(2), tbl_parietal2] = kruskalwallis(parietal_lobe_theta,[],'off');
[p_parietal(3), tbl_parietal3] = kruskalwallis(parietal_lobe_alpha,[],'off');
[p_parietal(4), tbl_parietal4] = kruskalwallis(parietal_lobe_beta,[],'off');
[p_parietal(5), tbl_parietal5] = kruskalwallis(parietal_lobe_low_gamma,[],'off');
%%
%%% OCCIPITAL LOBE : ELECTRODES 16,17,18 =
%%% 16:18
occipital_lobe = median_powers(:,[16:18],:);

occipital_lobe_delta(:,:) = occipital_lobe(1,:,:);
occipital_lobe_theta(:,:) = occipital_lobe(2,:,:);
occipital_lobe_alpha(:,:) = occipital_lobe(3,:,:);
occipital_lobe_beta(:,:) = occipital_lobe(4,:,:);
occipital_lobe_low_gamma(:,:) = occipital_lobe(5,:,:);

[p_occipital(1), tbl_occipital1] = kruskalwallis(occipital_lobe_delta,[],'off');
[p_occipital(2), tbl_occipital2] = kruskalwallis(occipital_lobe_theta,[],'off');
[p_occipital(3), tbl_occipital3] = kruskalwallis(occipital_lobe_alpha,[],'off');
[p_occipital(4), tbl_occipital4] = kruskalwallis(occipital_lobe_beta,[],'off');
[p_occipital(5), tbl_occipital5] = kruskalwallis(occipital_lobe_low_gamma,[],'off');
%%
%%% TEMPORAL LOBE : ELECTRODES 5,9,10,21,26,27
%%% 5,9:10,21,26:27
temporal_lobe = median_powers(:,[5,9:10,21,26:27],:);

temporal_lobe_delta(:,:) = temporal_lobe(1,:,:);
temporal_lobe_theta(:,:) = temporal_lobe(2,:,:);
temporal_lobe_alpha(:,:) = temporal_lobe(3,:,:);
temporal_lobe_beta(:,:) = temporal_lobe(4,:,:);
temporal_lobe_low_gamma(:,:) = temporal_lobe(5,:,:);

[p_temporal(1), tbl_temporal1] = kruskalwallis(temporal_lobe_delta,[],'off');
[p_temporal(2), tbl_temporal2] = kruskalwallis(temporal_lobe_theta,[],'off');
[p_temporal(3), tbl_temporal3] = kruskalwallis(temporal_lobe_alpha,[],'off');
[p_temporal(4), tbl_temporal4] = kruskalwallis(temporal_lobe_beta,[],'off');
[p_temporal(5), tbl_temporal5] = kruskalwallis(temporal_lobe_low_gamma,[],'off');