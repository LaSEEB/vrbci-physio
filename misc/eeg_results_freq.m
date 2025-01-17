%% Extract EEG features in FREQUENCY
%
% Example:
%   eeg_features = get_eeg_features(EEG.data,params)
% 
% Copyright (C) - Cedric Cannard, 2023

% function [eeg_features, params] = get_eeg_features(signals,params)

% General parameters
fs = EEG.srate;
chanlocs = EEG.chanlocs;
   
usegpu = false;
useparpool = false;

% Frequency domain parameters

fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
params.fRange = fRange; % to export

wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
params.wintype = wintype; % to export

winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
params.winlen = winlen; % to export

overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
params.overlap = overlap; % to export

asy_norm = false;      % normalization by dividing electrode's alpha power by total power (true) or not (false). see Smith et al. (2017)
params.asy_norm = asy_norm; % to export

disp('----------------------------------------------------')
disp('               Extracting EEG features ')
disp('----------------------------------------------------')

%% Frequency domain

nChan = size(signals,1);

%%%%% Band power %%%%%

% number of frequency bins to preallocate memory
samplesPerWindow = fs * winlen;
nfft = 2^nextpow2(samplesPerWindow);
freqResolution = fs / nfft;
numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80

% preallocate memory
pwr = nan(nChan,numFrequencyBins);
pwr_dB = nan(nChan,numFrequencyBins);
delta = nan(nChan,1);
delta_norm_db = nan(nChan,1);
delta_norm_ttlpwr = nan(nChan,1);
theta = nan(nChan,1);
theta_norm_db = nan(nChan,1);
theta_norm_ttlpwr = nan(nChan,1);
alpha = nan(nChan,1);
alpha_norm_db = nan(nChan,1);
alpha_norm_ttlpwr = nan(nChan,1);
beta = nan(nChan,1);
beta_norm_db = nan(nChan,1);
beta_norm_ttlpwr = nan(nChan,1);
low_gamma = nan(nChan,1);
low_gamma_norm_db = nan(nChan,1);
low_gamma_norm_ttlpwr = nan(nChan,1);

disp('Calculating band-power on each EEG channel:')
for iChan = 1:nChan

    fprintf('  - channel %g \n', iChan)

    % Compute PSD using pwelch
    [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

    % Delta
    delta(iChan,:) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
    delta_norm_db(iChan,:) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
    delta_norm_ttlpwr(iChan,:) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

    % Theta
    theta(iChan,:) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
    theta_norm_db(iChan,:) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
    theta_norm_ttlpwr(iChan,:) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

    % Alpha
    alpha(iChan,:) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
    alpha_norm_db(iChan,:) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
    alpha_norm_ttlpwr(iChan,:) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

    % Beta
    beta(iChan,:) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
    beta_norm_db(iChan,:) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
    beta_norm_ttlpwr(iChan,:) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

    % Low gamma
    low_gamma(iChan,:) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
    low_gamma_norm_db(iChan,:) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
    low_gamma_norm_ttlpwr(iChan,:) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel
    
    if ~useparpool
        progressbar(iChan/nChan)
    end

end

% Outputs
eeg_features.frequency.freqs = f;
eeg_features.frequency.pwr = pwr;
eeg_features.frequency.pwr_dB = pwr_dB;

eeg_features.frequency.delta = delta;
eeg_features.frequency.theta = theta;
eeg_features.frequency.alpha = alpha;
eeg_features.frequency.beta = beta;
eeg_features.frequency.low_gamma = low_gamma;

eeg_features.frequency.delta_norm_db = delta_norm_db;
eeg_features.frequency.theta_norm_db = theta_norm_db;
eeg_features.frequency.alpha_norm_db = alpha_norm_db;
eeg_features.frequency.beta_norm_db = beta_norm_db;
eeg_features.frequency.low_gamma_norm_db = low_gamma_norm_db;

eeg_features.frequency.delta_norm_ttlpwr = delta_norm_ttlpwr;
eeg_features.frequency.theta_norm_ttlpwr = theta_norm_ttlpwr;
eeg_features.frequency.alpha_norm_ttlpwr = alpha_norm_ttlpwr;
eeg_features.frequency.beta_norm_ttlpwr = beta_norm_ttlpwr;
eeg_features.frequency.low_gamma_norm_ttlpwr = low_gamma_norm_ttlpwr;

%%%%% Individual alpha frequency (IAF) %%%%%
% Use alpha center of gravity (CoG) since it's the best
disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
[pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
eeg_features.frequency.IAF_mean = pSum.cog;
eeg_features.frequency.IAF = [pChans.gravs]';
if ~isnan(eeg_features.frequency.IAF_mean)
    fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean)
elseif sum(isnan(eeg_features.frequency.IAF)) == length(chanlocs)
    warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
end

%%%%% Alpha asymmetry %%%%%
% on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
[asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, asy_norm, chanlocs, false);
eeg_features.frequency.asymmetry = asy;
eeg_features.frequency.asymmetry_pairs_labels = pairLabels;
eeg_features.frequency.asymmetry_pairs_num = pairNums;