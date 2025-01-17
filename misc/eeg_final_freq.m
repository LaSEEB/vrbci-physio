%EEG FINAL RESULTS FREQUENCY

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
EEGext = "_EEG";

useparpool = true;

eeg_features.frequency.pwr = NaN(32,80,6,20);
eeg_features.frequency.pwr_dB = NaN(32,80,6,20);
eeg_features.frequency.freqs = NaN(1,80,6,20);

eeg_features.frequency.delta = NaN(32,6,20);
eeg_features.frequency.theta = NaN(32,6,20);
eeg_features.frequency.alpha = NaN(32,6,20);
eeg_features.frequency.beta = NaN(32,6,20);
eeg_features.frequency.low_gamma = NaN(32,6,20);

eeg_features.frequency.delta_norm_db = NaN(32,6,20);
eeg_features.frequency.theta_norm_db = NaN(32,6,20);
eeg_features.frequency.alpha_norm_db = NaN(32,6,20);
eeg_features.frequency.beta_norm_db = NaN(32,6,20);
eeg_features.frequency.low_gamma_norm_db = NaN(32,6,20);

eeg_features.frequency.delta_norm_ttlpwr = NaN(32,6,20);
eeg_features.frequency.theta_norm_ttlpwr = NaN(32,6,20);
eeg_features.frequency.alpha_norm_ttlpwr = NaN(32,6,20);
eeg_features.frequency.beta_norm_ttlpwr = NaN(32,6,20);
eeg_features.frequency.low_gamma_norm_ttlpwr = NaN(32,6,20);

eeg_features.frequency.IAF = NaN(32,6,20);
eeg_features.frequency.IAF_mean = NaN(1,6,20);

eeg_features.frequency.asymmetry = NaN(16,6,20);
eeg_features.frequency.asymmetry_norm = NaN(16,6,20);
eeg_features.frequency.asymmetry_pairs_labels = cell(16,6,20);
eeg_features.frequency.asymmetry_pairs_num = NaN(16,2,6,20);

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
        setname = strcat( subject{i}, lab, task{j}, EEGext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % General parameters
        fs = EEG.srate;
        chanlocs = EEG.chanlocs;

        usegpu = false;
        %useparpool = false;

        % Frequency domain parameters

        fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
        params.fRange = fRange; % to export

        wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
        params.wintype = wintype; % to export

        winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
        params.winlen = winlen; % to export

        overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
        params.overlap = overlap; % to export

        signals = EEG.data;

        nChan = size(signals,1); % no of channels

        %%%%% Band power %%%%%

        % number of frequency bins to preallocate memory
        samplesPerWindow = fs * winlen;
        nfft = 2^nextpow2(samplesPerWindow);
        freqResolution = fs / nfft;
        numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80 bins

        % preallocate memory
        pwr = NaN(nChan,numFrequencyBins);
        pwr_dB = NaN(nChan,numFrequencyBins);

        %disp('Calculating band-power on each EEG channel:')
        for iChan = 1:nChan

            %fprintf('  - channel %g \n', iChan)

            % Compute PSD using pwelch
            [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

            % Delta
            eeg_features.frequency.delta(iChan,j+1,i) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
            eeg_features.frequency.delta_norm_db(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
            eeg_features.frequency.delta_norm_ttlpwr(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Theta
            eeg_features.frequency.theta(iChan,j+1,i) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
            eeg_features.frequency.theta_norm_db(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
            eeg_features.frequency.theta_norm_ttlpwr(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Alpha
            eeg_features.frequency.alpha(iChan,j+1,i) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
            eeg_features.frequency.alpha_norm_db(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
            eeg_features.frequency.alpha_norm_ttlpwr(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Beta
            eeg_features.frequency.beta(iChan,j+1,i) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
            eeg_features.frequency.beta_norm_db(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
            eeg_features.frequency.beta_norm_ttlpwr(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Low gamma
            eeg_features.frequency.low_gamma(iChan,j+1,i) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
            eeg_features.frequency.low_gamma_norm_db(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
            eeg_features.frequency.low_gamma_norm_ttlpwr(iChan,j+1,i) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            if ~useparpool
                progressbar(iChan/nChan)
            end
        end 

        % Outputs
        eeg_features.frequency.freqs(:,:,j+1,i) = f;
        eeg_features.frequency.pwr(:,:,j+1,i) = pwr;
        eeg_features.frequency.pwr_dB(:,:,j+1,i) = pwr_dB;

        %%%%% Individual alpha frequency (IAF) %%%%%
        % Use alpha center of gravity (CoG) since it's the best
        disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
        [pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
        eeg_features.frequency.IAF_mean(:,j+1,i) = pSum.cog;
        eeg_features.frequency.IAF(:,j+1,i) = [pChans.gravs]';
        if ~isnan(eeg_features.frequency.IAF_mean(:,j+1,i))
            fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean(:,j+1,i))
        elseif sum(isnan(eeg_features.frequency.IAF(:,j+1,i))) == length(chanlocs)
            warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
        end

        %%%%% Alpha asymmetry %%%%%
        % on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
        alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
        [asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, false, chanlocs, false);
        [asy_norm, ~] = compute_asymmetry(alpha_pwr, true, chanlocs, false);
        lenasy = length(asy);
        eeg_features.frequency.asymmetry(1:lenasy,j+1,i) = asy;
        eeg_features.frequency.asymmetry_norm(1:lenasy,j+1,i) = asy_norm;
        eeg_features.frequency.asymmetry_pairs_labels(1:lenasy,j+1,i) = pairLabels;
        eeg_features.frequency.asymmetry_pairs_num(1:lenasy,:,j+1,i) = pairNums;

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-07" "sub-08" "sub-09" "sub-12"]
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
        setname = strcat( subject{i}, lab, task{j}, EEGext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % General parameters
        fs = EEG.srate;
        chanlocs = EEG.chanlocs;

        usegpu = false;
        %useparpool = false;

        % Frequency domain parameters

        fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
        params.fRange = fRange; % to export

        wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
        params.wintype = wintype; % to export

        winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
        params.winlen = winlen; % to export

        overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
        params.overlap = overlap; % to export

        signals = EEG.data;

        nChan = size(signals,1); % no of channels

        %%%%% Band power %%%%%

        % number of frequency bins to preallocate memory
        samplesPerWindow = fs * winlen;
        nfft = 2^nextpow2(samplesPerWindow);
        freqResolution = fs / nfft;
        numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80 bins

        % preallocate memory
        pwr = NaN(nChan,numFrequencyBins);
        pwr_dB = NaN(nChan,numFrequencyBins);

        %disp('Calculating band-power on each EEG channel:')
        for iChan = 1:nChan

            %fprintf('  - channel %g \n', iChan)

            % Compute PSD using pwelch
            [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

            % Delta
            eeg_features.frequency.delta(iChan,j,i+6) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
            eeg_features.frequency.delta_norm_db(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
            eeg_features.frequency.delta_norm_ttlpwr(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Theta
            eeg_features.frequency.theta(iChan,j,i+6) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
            eeg_features.frequency.theta_norm_db(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
            eeg_features.frequency.theta_norm_ttlpwr(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Alpha
            eeg_features.frequency.alpha(iChan,j,i+6) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
            eeg_features.frequency.alpha_norm_db(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
            eeg_features.frequency.alpha_norm_ttlpwr(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Beta
            eeg_features.frequency.beta(iChan,j,i+6) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
            eeg_features.frequency.beta_norm_db(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
            eeg_features.frequency.beta_norm_ttlpwr(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Low gamma
            eeg_features.frequency.low_gamma(iChan,j,i+6) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
            eeg_features.frequency.low_gamma_norm_db(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
            eeg_features.frequency.low_gamma_norm_ttlpwr(iChan,j,i+6) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            if ~useparpool
                progressbar(iChan/nChan)
            end
        end 

        % Outputs
        eeg_features.frequency.freqs(:,:,j,i+6) = f;
        eeg_features.frequency.pwr(:,:,j,i+6) = pwr;
        eeg_features.frequency.pwr_dB(:,:,j,i+6) = pwr_dB;

        %%%%% Individual alpha frequency (IAF) %%%%%
        % Use alpha center of gravity (CoG) since it's the best
        disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
        [pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
        eeg_features.frequency.IAF_mean(:,j,i+6) = pSum.cog;
        eeg_features.frequency.IAF(:,j,i+6) = [pChans.gravs]';
        if ~isnan(eeg_features.frequency.IAF_mean(:,j,i+6))
            fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean(:,j,i+6))
        elseif sum(isnan(eeg_features.frequency.IAF(:,j,i+6))) == length(chanlocs)
            warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
        end

        %%%%% Alpha asymmetry %%%%%
        % on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
        alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
        [asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, false, chanlocs, false);
        [asy_norm, ~] = compute_asymmetry(alpha_pwr, true, chanlocs, false);
        lenasy = length(asy);
        eeg_features.frequency.asymmetry(1:lenasy,j,i+6) = asy;
        eeg_features.frequency.asymmetry_norm(1:lenasy,j,i+6) = asy_norm;
        eeg_features.frequency.asymmetry_pairs_labels(1:lenasy,j,i+6) = pairLabels;
        eeg_features.frequency.asymmetry_pairs_num(1:lenasy,:,j,i+6) = pairNums;

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-13" ;
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
        setname = strcat( subject{i}, lab, task{j}, EEGext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % General parameters
        fs = EEG.srate;
        chanlocs = EEG.chanlocs;

        usegpu = false;
        %useparpool = false;

        % Frequency domain parameters

        fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
        params.fRange = fRange; % to export

        wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
        params.wintype = wintype; % to export

        winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
        params.winlen = winlen; % to export

        overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
        params.overlap = overlap; % to export

        signals = EEG.data;

        nChan = size(signals,1); % no of channels

        %%%%% Band power %%%%%

        % number of frequency bins to preallocate memory
        samplesPerWindow = fs * winlen;
        nfft = 2^nextpow2(samplesPerWindow);
        freqResolution = fs / nfft;
        numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80 bins

        % preallocate memory
        pwr = NaN(nChan,numFrequencyBins);
        pwr_dB = NaN(nChan,numFrequencyBins);

        %disp('Calculating band-power on each EEG channel:')
        for iChan = 1:nChan

            %fprintf('  - channel %g \n', iChan)

            % Compute PSD using pwelch
            [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

            % Delta
            eeg_features.frequency.delta(iChan,j,11) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
            eeg_features.frequency.delta_norm_db(iChan,j,11) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
            eeg_features.frequency.delta_norm_ttlpwr(iChan,j,11) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Theta
            eeg_features.frequency.theta(iChan,j,11) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
            eeg_features.frequency.theta_norm_db(iChan,j,11) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
            eeg_features.frequency.theta_norm_ttlpwr(iChan,j,11) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Alpha
            eeg_features.frequency.alpha(iChan,j,11) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
            eeg_features.frequency.alpha_norm_db(iChan,j,11) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
            eeg_features.frequency.alpha_norm_ttlpwr(iChan,j,11) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Beta
            eeg_features.frequency.beta(iChan,j,11) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
            eeg_features.frequency.beta_norm_db(iChan,j,11) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
            eeg_features.frequency.beta_norm_ttlpwr(iChan,j,11) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Low gamma
            eeg_features.frequency.low_gamma(iChan,j,11) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
            eeg_features.frequency.low_gamma_norm_db(iChan,j,11) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
            eeg_features.frequency.low_gamma_norm_ttlpwr(iChan,j,11) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            if ~useparpool
                progressbar(iChan/nChan)
            end
        end 

        % Outputs
        eeg_features.frequency.freqs(:,:,j,11) = f;
        eeg_features.frequency.pwr(:,:,j,11) = pwr;
        eeg_features.frequency.pwr_dB(:,:,j,11) = pwr_dB;

        %%%%% Individual alpha frequency (IAF) %%%%%
        % Use alpha center of gravity (CoG) since it's the best
        disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
        [pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
        eeg_features.frequency.IAF_mean(:,j,11) = pSum.cog;
        eeg_features.frequency.IAF(:,j,11) = [pChans.gravs]';
        if ~isnan(eeg_features.frequency.IAF_mean(:,j,11))
            fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean(:,j,11))
        elseif sum(isnan(eeg_features.frequency.IAF(:,j,11))) == length(chanlocs)
            warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
        end

        %%%%% Alpha asymmetry %%%%%
        % on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
        alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
        [asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, false, chanlocs, false);
        [asy_norm, ~] = compute_asymmetry(alpha_pwr, true, chanlocs, false);
        lenasy = length(asy);
        eeg_features.frequency.asymmetry(1:lenasy,j,11) = asy;
        eeg_features.frequency.asymmetry_norm(1:lenasy,j,11) = asy_norm;
        eeg_features.frequency.asymmetry_pairs_labels(1:lenasy,j,11) = pairLabels;
        eeg_features.frequency.asymmetry_pairs_num(1:lenasy,:,j,11) = pairNums;

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
        setname = strcat( subject{i}, lab, task{j}, EEGext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % General parameters
        fs = EEG.srate;
        chanlocs = EEG.chanlocs;

        usegpu = false;
        %useparpool = false;

        % Frequency domain parameters

        fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
        params.fRange = fRange; % to export

        wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
        params.wintype = wintype; % to export

        winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
        params.winlen = winlen; % to export

        overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
        params.overlap = overlap; % to export

        signals = EEG.data;

        nChan = size(signals,1); % no of channels

        %%%%% Band power %%%%%

        % number of frequency bins to preallocate memory
        samplesPerWindow = fs * winlen;
        nfft = 2^nextpow2(samplesPerWindow);
        freqResolution = fs / nfft;
        numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80 bins

        % preallocate memory
        pwr = NaN(nChan,numFrequencyBins);
        pwr_dB = NaN(nChan,numFrequencyBins);

        %disp('Calculating band-power on each EEG channel:')
        for iChan = 1:nChan

            %fprintf('  - channel %g \n', iChan)

            % Compute PSD using pwelch
            [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

            % Delta
            eeg_features.frequency.delta(iChan,j,i+11) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
            eeg_features.frequency.delta_norm_db(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
            eeg_features.frequency.delta_norm_ttlpwr(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Theta
            eeg_features.frequency.theta(iChan,j,i+11) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
            eeg_features.frequency.theta_norm_db(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
            eeg_features.frequency.theta_norm_ttlpwr(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Alpha
            eeg_features.frequency.alpha(iChan,j,i+11) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
            eeg_features.frequency.alpha_norm_db(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
            eeg_features.frequency.alpha_norm_ttlpwr(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Beta
            eeg_features.frequency.beta(iChan,j,i+11) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
            eeg_features.frequency.beta_norm_db(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
            eeg_features.frequency.beta_norm_ttlpwr(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Low gamma
            eeg_features.frequency.low_gamma(iChan,j,i+11) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
            eeg_features.frequency.low_gamma_norm_db(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
            eeg_features.frequency.low_gamma_norm_ttlpwr(iChan,j,i+11) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            if ~useparpool
                progressbar(iChan/nChan)
            end
        end 

        % Outputs
        eeg_features.frequency.freqs(:,:,j,i+11) = f;
        eeg_features.frequency.pwr(:,:,j,i+11) = pwr;
        eeg_features.frequency.pwr_dB(:,:,j,i+11) = pwr_dB;

        %%%%% Individual alpha frequency (IAF) %%%%%
        % Use alpha center of gravity (CoG) since it's the best
        disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
        [pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
        eeg_features.frequency.IAF_mean(:,j,i+11) = pSum.cog;
        eeg_features.frequency.IAF(:,j,i+11) = [pChans.gravs]';
        if ~isnan(eeg_features.frequency.IAF_mean(:,j,i+11))
            fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean(:,j,i+11))
        elseif sum(isnan(eeg_features.frequency.IAF(:,j,i+11))) == length(chanlocs)
            warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
        end

        %%%%% Alpha asymmetry %%%%%
        % on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
        alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
        [asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, false, chanlocs, false);
        [asy_norm, ~] = compute_asymmetry(alpha_pwr, true, chanlocs, false);
        lenasy = length(asy);
        eeg_features.frequency.asymmetry(1:lenasy,j,i+11) = asy;
        eeg_features.frequency.asymmetry_norm(1:lenasy,j,i+11) = asy_norm;
        eeg_features.frequency.asymmetry_pairs_labels(1:lenasy,j,i+11) = pairLabels;
        eeg_features.frequency.asymmetry_pairs_num(1:lenasy,:,j,i+11) = pairNums;

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
        setname = strcat( subject{i}, lab, task{j}, EEGext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % General parameters
        fs = EEG.srate;
        chanlocs = EEG.chanlocs;

        usegpu = false;
        %useparpool = false;

        % Frequency domain parameters

        fRange = [1 40];        % overall frequency range to compute PSD (in Hz)
        params.fRange = fRange; % to export

        wintype = 'hamming';    % window type. Default = 'hamming' (see Smith et al, 2017 for asymmetry)
        params.wintype = wintype; % to export

        winlen = 2;            % window size (in s). Default = 2 (see Smith et al, 2017 for asymmetry)
        params.winlen = winlen; % to export

        overlap = 50;           % window overlap. Default = 50% (see Smith et al, 2017 for asymmetry)
        params.overlap = overlap; % to export

        signals = EEG.data;

        nChan = size(signals,1); % no of channels

        %%%%% Band power %%%%%

        % number of frequency bins to preallocate memory
        samplesPerWindow = fs * winlen;
        nfft = 2^nextpow2(samplesPerWindow);
        freqResolution = fs / nfft;
        numFrequencyBins = floor((fRange(2) - fRange(1)) / freqResolution) + 1; % =80 bins

        % preallocate memory
        pwr = NaN(nChan,numFrequencyBins);
        pwr_dB = NaN(nChan,numFrequencyBins);

        %disp('Calculating band-power on each EEG channel:')
        for iChan = 1:nChan

            %fprintf('  - channel %g \n', iChan)

            % Compute PSD using pwelch
            [pwr(iChan,:), pwr_dB(iChan,:), f] = compute_psd(signals(iChan,:),fs*winlen,wintype,overlap,[],fs,fRange,'psd',usegpu);

            % Delta
            eeg_features.frequency.delta(iChan,j+1,i+17) = mean(pwr(iChan,f >= f(1) & f <= 3));       % no normalization (uV^2/Hz)
            eeg_features.frequency.delta_norm_db(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(1) & f <= 3));    % db
            eeg_features.frequency.delta_norm_ttlpwr(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(1) & f <= 3)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Theta
            eeg_features.frequency.theta(iChan,j+1,i+17) = mean(pwr(iChan,f >= f(3) & f <= 7));       % no normalization (uV^2/Hz)
            eeg_features.frequency.theta_norm_db(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(3) & f <= 7));    % db
            eeg_features.frequency.theta_norm_ttlpwr(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(3) & f <= 7)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Alpha
            eeg_features.frequency.alpha(iChan,j+1,i+17) = mean(pwr(iChan,f >= f(8) & f <= 13));       % no normalization (uV^2/Hz)
            eeg_features.frequency.alpha_norm_db(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(8) & f <= 13));    % db
            eeg_features.frequency.alpha_norm_ttlpwr(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(8) & f <= 13)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Beta
            eeg_features.frequency.beta(iChan,j+1,i+17) = mean(pwr(iChan,f >= f(13) & f <= 30));       % no normalization (uV^2/Hz)
            eeg_features.frequency.beta_norm_db(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(13) & f <= 30));    % db
            eeg_features.frequency.beta_norm_ttlpwr(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(13) & f <= 30)) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            % Low gamma
            eeg_features.frequency.low_gamma(iChan,j+1,i+17) = mean(pwr(iChan,f >= f(30) & f <= fRange(2)));       % no normalization (uV^2/Hz)
            eeg_features.frequency.low_gamma_norm_db(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2)));    % db
            eeg_features.frequency.low_gamma_norm_ttlpwr(iChan,j+1,i+17) = mean(pwr_dB(iChan,f >= f(30) & f <= fRange(2))) ./ sum(pwr_dB(iChan,:));   % normalized by total power of same channel

            if ~useparpool
                progressbar(iChan/nChan)
            end
        end 

        % Outputs
        eeg_features.frequency.freqs(:,:,j+1,i+17) = f;
        eeg_features.frequency.pwr(:,:,j+1,i+17) = pwr;
        eeg_features.frequency.pwr_dB(:,:,j+1,i+17) = pwr_dB;

        %%%%% Individual alpha frequency (IAF) %%%%%
        % Use alpha center of gravity (CoG) since it's the best
        disp('Attempting to find the individual alpha frequency (IAF) for each EEG channel...')
        [pSum, pChans, ~] = restingIAF(signals, size(signals,1), 1, [1 30], fs, [7 14], 11, 5);
        eeg_features.frequency.IAF_mean(:,j+1,i+17) = pSum.cog;
        eeg_features.frequency.IAF(:,j+1,i+17) = [pChans.gravs]';
        if ~isnan(eeg_features.frequency.IAF_mean(:,j+1,i+17))
            fprintf('Mean IAF across all channels: %g \n', eeg_features.frequency.IAF_mean(:,j+1,i+17))
        elseif sum(isnan(eeg_features.frequency.IAF(:,j+1,i+17))) == length(chanlocs)
            warning("Failed to find the IAF on all EEG channels. This can be due to improperly preprocessed data or lack of alpha peak in the power spectral distribution.")
        end

        %%%%% Alpha asymmetry %%%%%
        % on log(pwr) no pwr_dB - on all possible symmetric pairs of electrodes
        alpha_pwr = mean(pwr(:,f >= 8 & f <= 13),2);  % IMPORTANT: use power in μV^2/Hz NOT in decibels
        [asy, pairLabels, pairNums] = compute_asymmetry(alpha_pwr, false, chanlocs, false);
        [asy_norm, ~] = compute_asymmetry(alpha_pwr, true, chanlocs, false);
        lenasy = length(asy);
        eeg_features.frequency.asymmetry(1:lenasy,j+1,i+17) = asy;
        eeg_features.frequency.asymmetry_norm(1:lenasy,j+1,i+17) = asy_norm;
        eeg_features.frequency.asymmetry_pairs_labels(1:lenasy,j+1,i+17) = pairLabels;
        eeg_features.frequency.asymmetry_pairs_num(1:lenasy,:,j+1,i+17) = pairNums;

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];