%ECG_hrv_features_extraction

%get_hrv_features (from BrainBeats toolbox!!!) customized code
%ypologizei mono TIME (OLA) kai FREQ (LF, HF, LF/HF)
%periexei sto telos ena poly wraio kwdika gia visualise 

%% Compute HRV measures on NN time series.
% 1) Time domain: NN stats, SDNN, RMSSD, pNN50
% 
% 2) Frequency domain: ULF, VLF, LF, HF, LF/HF ratio, TTLPWR.
%   Options: PSD can be calculated using the normalized Lomb-Scargle 
%   periodogram (default), standard Lomb-Scargle periodogram, 
%   Welch, or FFT. Lomb-Scargle periodogram does not require 
%   interpolation or resampling of the data (contrary to welch or FFT), thus 
%   preserving the original information. The Lomb-Scargle method is
%   recommended as it better deals with non-uniformly sampled data, missing 
%   data, noise (common with NN intervals), and does not require resampling. 
%   The normalized version is selected by default (although users can choose 
%   the standard version) by scaling the power by the variance of the signal, 
%   making results more comparable across different recordings or subjects. 
%   If users set hrv_norm to ON, a 2nd level normalization is applied
%   by dividing each band-power by the total power, to provide a more 
%   intuitive measure of the relative contribution of each frequency 
%   component to the overall power. Preferable to do this option when VLF
%   and ULF are available (long time-series required). 

% Following recommendations by the Task Force of the European Society of 
% Cardiology and the North American Society of Pacing and Electrophysiology
% (1996), minimum data length for each band is 5-10 cycles
%   - LF (0.04-0.15 Hz): at least 125 s
%   - HF (0.15-0.40 Hz): at least 34 s
% 
% To maximize trade-off between time resolution and frequency resolution,
% sliding time windows using these minimum lengths are used for each band.
% Warnings are printed when length is smaller than minimum recommended. 
% 
% Time and nonlinear HRV features are computed over the whole time-series 
% for faster computation and higher reliability. 
% 
% Copyright (C) - Cedric Cannard, 2023

%function [HRV, params] = get_hrv_features(NN, NN_times, params)


%% Time domain O KWDIKAS EINAI ETOIMOS!!!!!!!!!

% NN statistics
HRV.time.NN_mean = mean(NN.*1000);      % in ms
HRV.time.NN_median = median(NN.*1000);  % in ms
HRV.time.NN_mode = mode(NN.*1000);      % in ms
HRV.time.NN_var = var(NN.*1000);        % in ms
HRV.time.NN_skew = skewness(NN);
HRV.time.NN_kurt = kurtosis(NN);
HRV.time.NN_iqr = iqr(NN.*1000);        % in ms

% SDNN (standard deviation of the NN intervals)
HRV.time.SDNN = std(NN.*1000);   % in ms

% RMSSD (sqrt of the mean squared time diff between heartbeats)
HRV.time.RMSSD = sqrt(mean(diff(NN.*1000).^2));  % in ms

% pNN50 (fraction of differences larger than alpha = 50)
% requires at least 2 min of data (see Ginsberg and Schaffer 2017)
alpha = 50;
HRV.time.pNN50 = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));

%% Frequency domain

hrv_spec = 'LombScargle_norm';
params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

norm = true;

% if isfield(params,'hrv_norm') && ~isempty(params.hrv_norm)
%     norm = params.hrv_norm;
% else
%     norm = false;
%     params.hrv_normalization = norm;     % for exportation for users
% end

overlap = .25;  % window overlap (default = 25 %)
params.hrv_window_overlap = overlap;  % for exportation for users

% HRV frequency bands (LF; HF)
bands = [.04 .15; 0.15 0.40 ];
bandNames = {'LF' 'HF'};
params.hrv_band_freqs = bands;  % for exportation for users
params.hrv_band_names = bandNames;  % for exportation for users

% Minimum data length requirements for each band
% minLF = 5/0.04;       % 5 cycles/0.04 hz  (in s)
% minHF = 5/0.15;       % 5 cycles/0.15 hz  (in s)
minLength = ceil([5/0.04 5/0.15 ]);

for iBand = 1:size(bands,1)

    if NN_times(end) >= minLength(iBand)

        % Determine best sliding window length and indices
        winLength = minLength(iBand);
        stepSize = winLength * (1 - overlap);
        nWindows = floor((NN_times(end) - winLength) / stepSize) + 1;

        fprintf('Frequency band: %s \n', bandNames{iBand});

        % Compute PSD on each sliding window
        for iWin = 1:nWindows
            fprintf(' - window %g \n', iWin)

            start_idx = (iWin - 1) * stepSize + 1;
            end_idx = start_idx + winLength - 1;
            win_idx = NN_times >= start_idx & NN_times <= end_idx;

            % Frequency resolution and vector for this window
            % nfft = 2^nextpow2(length(NN(win_idx)));    % dynamic nfft based on window length
            nfft = max(2^nextpow2(length(NN(win_idx))), 512);  % use 512 as minimum value for smaller windows
            fvec = bands(iBand,1):1/nfft:bands(iBand,2);

            % Lomb-Scargle Periodogram (no resampling required and best method)
            if strcmp(hrv_spec, 'LombScargle_norm')
                [pwr,freqs] = plomb(NN(win_idx),NN_times(win_idx),fvec,'normalized');
                fprintf('Computing normalized Lomb-Scargle periodogram on the NN series... \n')
            elseif strcmp(hrv_spec, 'LombScargle')
                [pwr,freqs] = plomb(NN(win_idx),NN_times(win_idx),fvec,'psd');
                fprintf('Computing standard Lomb-Scargle periodogram on the NN series... \n')
            end

            % Freq index
            freq_idx = bands(iBand,1) <= freqs & freqs <= bands(iBand,2);
            freq_res = freqs(2)-freqs(1); % resolution

            % Power for each band in ms^2
            if iBand == 1
                HRV.frequency.lf(iWin,:) = sum(pwr(freq_idx)*freq_res) * 1e6;       % LF
            elseif iBand == 2
                HRV.frequency.hf(iWin,:) = sum(pwr(freq_idx)*freq_res) * 1e6;       % HF
            end

            % Overal power spectra
            PWR{iBand,:} = pwr;         % for exporting overall power spectra
            PWR_freqs{iBand,:} = freqs;  % for exporting overall power spectra

        end
    else
        warning('File length is too short for estimating %s power reliably. At least %1.1f minutes are required. Cannot export this variable.', bandNames{iBand},minLength(iBand)/60)
    end
end

% LF/HF ratio (average power across windows)
if isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
    HRV.frequency.lfhf = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
end

% Total power and normalize if all bands are present (average across windows)
% if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
%         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
if norm
    HRV.frequency.ttlpwr = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
end

% Normalize 2nd level (capture contribution of each band to overall
% power)
if norm
    if isfield(HRV.frequency,'ttlpwr')
        disp('Normalizing HRV power to overall power')
        if isfield(HRV.frequency,'lf')
            HRV.frequency.lf_norm = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr;
        end
        if isfield(HRV.frequency,'hf')
            HRV.frequency.hf_norm = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr;
        end
        if isfield(HRV.frequency,'lfhf')
            HRV.frequency.lfhf_norm = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
        end
    end
end

% remove empty cells
PWR(cellfun(@isempty,PWR)) = [];
PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];

% Merge spectra from each band and export
HRV.frequency.pwr_freqs = [cat(1, PWR_freqs{:})];
HRV.frequency.pwr = [cat(1, PWR{:})];
HRV.frequency.bands = bands;

% Average across time windows
if isfield(HRV.frequency,'lf')
    HRV.frequency.lf_mean = mean(HRV.frequency.lf,'omitnan');
end
if isfield(HRV.frequency,'hf')
    HRV.frequency.hf_mean = mean(HRV.frequency.hf,'omitnan');
end