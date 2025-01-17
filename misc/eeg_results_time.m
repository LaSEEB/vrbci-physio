%% Extract EEG features in TIME
%
% Example:
%   eeg_features = get_eeg_features(EEG.data,params)
% 
% Copyright (C) - Cedric Cannard, 2023

%function [eeg_features, params] = get_eeg_features(signals,params)

% General parameters
if isfield(params,'fs') && ~isempty(params.fs)
    fs = params.fs;
else
    errordlg("The 'params' structure must contain EEG sample frequency. Example to add it: params.fs = 256;  % in Hz","error in get_eeg_features.m")
end
if isfield(params,'chanlocs') && ~isempty(params.chanlocs)
    chanlocs = params.chanlocs;
else
    errordlg("The 'params' structure must contain EEG channel locations. Example to add it: params.chanlocs = EEG.chanlocs;","error in get_eeg_features.m")
end
if isfield(params,'gpu') && ~isempty(params.gpu)
    usegpu = params.gpu;
else
    usegpu = false;
end
if isfield(params,'parpool') && ~isempty(params.parpool)
    useparpool = params.parpool;
else
    useparpool = false;
end

disp('----------------------------------------------------')
disp('               Extracting EEG features ')
disp('----------------------------------------------------')

signals = EEG.data;

% Time domain
eeg_features.time.rms = rms(signals,2);
eeg_features.time.mode = mode(signals,2);
eeg_features.time.var = var(signals,0,2);
eeg_features.time.skewness = skewness(signals,0,2);
eeg_features.time.kurtosis = kurtosis(signals,0,2);
eeg_features.time.iqr = iqr(signals,2);