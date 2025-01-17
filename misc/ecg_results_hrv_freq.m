%ECG HRV feature extraction
%ONLY FREQUENCY
%NN = EEG.HEP.ibi
%NN_times = EEG.HEP.qrs

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
ECGext = "_ECG";
filtext = "_filt";
trimext = "_trimmed";
detext = "_detected";

HRV.frequency.lfhf = NaN(6,20);
HRV.frequency.ttlpwr = NaN(6,20);
HRV.frequency.lf_norm = NaN(6,20);
HRV.frequency.hf_norm = NaN(6,20);
HRV.frequency.lfhf_norm = NaN(6,20);
HRV.frequency.lf_mean = NaN(6,20); 
HRV.frequency.hf_mean  = NaN(6,20);

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        %FREQ
        NN = EEG.HEP.ibi;
        NN_times = EEG.HEP.qrs/500;

        if isempty(NN_times)
            continue
        else
            hrv_spec = 'LombScargle_norm';
            params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

            norm = true;

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
                HRV.frequency.lfhf(j+1,i) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
            end

            % Total power and normalize if all bands are present (average across windows)
            % if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
            %         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
            if norm
                HRV.frequency.ttlpwr(j+1,i) = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
            end

            % Normalize 2nd level (capture contribution of each band to overall
            % power)
            if norm
                if isfield(HRV.frequency,'ttlpwr')
                    disp('Normalizing HRV power to overall power')
                    if isfield(HRV.frequency,'lf')
                        HRV.frequency.lf_norm(j+1,i) = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr(j+1,i);
                    end
                    if isfield(HRV.frequency,'hf')
                        HRV.frequency.hf_norm(j+1,i) = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr(j+1,i);
                    end
                    if isfield(HRV.frequency,'lfhf')
                        HRV.frequency.lfhf_norm(j+1,i) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
                    end
                end
            end

            % % remove empty cells
            % PWR(cellfun(@isempty,PWR)) = [];
            % PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];
            %
            % % Merge spectra from each band and export
            % HRV.frequency.pwr_freqs(j+1,i) = [cat(1, PWR_freqs{:})];
            % HRV.frequency.pwr(j+1,i) = [cat(1, PWR{:})];
            % HRV.frequency.bands(j+1,i) = bands;

            % Average across time windows
            if isfield(HRV.frequency,'lf')
                HRV.frequency.lf_mean(j+1,i) = mean(HRV.frequency.lf,'omitnan');
            end
            if isfield(HRV.frequency,'hf')
                HRV.frequency.hf_mean(j+1,i) = mean(HRV.frequency.hf,'omitnan');
            end
        end
    end
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        %FREQ
        NN = EEG.HEP.ibi;
        NN_times = EEG.HEP.qrs/500;

        if isempty(NN_times)
            continue
        else

            hrv_spec = 'LombScargle_norm';
            params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

            norm = true;

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
                HRV.frequency.lfhf(j,i+6) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
            end

            % Total power and normalize if all bands are present (average across windows)
            % if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
            %         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
            if norm
                HRV.frequency.ttlpwr(j,i+6) = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
            end

            % Normalize 2nd level (capture contribution of each band to overall
            % power)
            if norm
                if isfield(HRV.frequency,'ttlpwr')
                    disp('Normalizing HRV power to overall power')
                    if isfield(HRV.frequency,'lf')
                        HRV.frequency.lf_norm(j,i+6) = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr(j,i+6);
                    end
                    if isfield(HRV.frequency,'hf')
                        HRV.frequency.hf_norm(j,i+6) = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr(j,i+6);
                    end
                    if isfield(HRV.frequency,'lfhf')
                        HRV.frequency.lfhf_norm(j,i+6) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
                    end
                end
            end

            % remove empty cells
            PWR(cellfun(@isempty,PWR)) = [];
            PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];

            % % Merge spectra from each band and export
            % HRV.frequency.pwr_freqs(j,i+6) = [cat(1, PWR_freqs{:})];
            % HRV.frequency.pwr(j,i+6) = [cat(1, PWR{:})];
            % HRV.frequency.bands(j,i+6) = bands;

            % Average across time windows
            if isfield(HRV.frequency,'lf')
                HRV.frequency.lf_mean(j,i+6) = mean(HRV.frequency.lf,'omitnan');
            end
            if isfield(HRV.frequency,'hf')
                HRV.frequency.hf_mean(j,i+6) = mean(HRV.frequency.hf,'omitnan');
            end
        end
    end
end

subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        %FREQ
        NN = EEG.HEP.ibi;
        NN_times = EEG.HEP.qrs/500;

        if isempty(NN_times)
            continue
        else

            hrv_spec = 'LombScargle_norm';
            params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

            norm = true;

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
                HRV.frequency.lfhf(j,11) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
            end

            % Total power and normalize if all bands are present (average across windows)
            % if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
            %         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
            if norm
                HRV.frequency.ttlpwr(j,11) = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
            end

            % Normalize 2nd level (capture contribution of each band to overall
            % power)
            if norm
                if isfield(HRV.frequency,'ttlpwr')
                    disp('Normalizing HRV power to overall power')
                    if isfield(HRV.frequency,'lf')
                        HRV.frequency.lf_norm(j,11) = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr(j,11);
                    end
                    if isfield(HRV.frequency,'hf')
                        HRV.frequency.hf_norm(j,11) = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr(j,11);
                    end
                    if isfield(HRV.frequency,'lfhf')
                        HRV.frequency.lfhf_norm(j,11) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
                    end
                end
            end

            % remove empty cells
            PWR(cellfun(@isempty,PWR)) = [];
            PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];

            % % Merge spectra from each band and export
            % HRV.frequency.pwr_freqs(j,11) = [cat(1, PWR_freqs{:})];
            % HRV.frequency.pwr(j,11) = [cat(1, PWR{:})];
            % HRV.frequency.bands(j,11) = bands;

            % Average across time windows
            if isfield(HRV.frequency,'lf')
                HRV.frequency.lf_mean(j,11) = mean(HRV.frequency.lf,'omitnan');
            end
            if isfield(HRV.frequency,'hf')
                HRV.frequency.hf_mean(j,11) = mean(HRV.frequency.hf,'omitnan');
            end
        end
    end
end

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        %FREQ
        NN = EEG.HEP.ibi;
        NN_times = EEG.HEP.qrs/500;

        if isempty(NN_times)
            continue
        else

            hrv_spec = 'LombScargle_norm';
            params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

            norm = true;

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
                HRV.frequency.lfhf(j,i+11) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
            end

            % Total power and normalize if all bands are present (average across windows)
            % if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
            %         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
            if norm
                HRV.frequency.ttlpwr(j,i+11) = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
            end

            % Normalize 2nd level (capture contribution of each band to overall
            % power)
            if norm
                if isfield(HRV.frequency,'ttlpwr')
                    disp('Normalizing HRV power to overall power')
                    if isfield(HRV.frequency,'lf')
                        HRV.frequency.lf_norm(j,i+11) = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr(j,i+11);
                    end
                    if isfield(HRV.frequency,'hf')
                        HRV.frequency.hf_norm(j,i+11) = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr(j,i+11);
                    end
                    if isfield(HRV.frequency,'lfhf')
                        HRV.frequency.lfhf_norm(j,i+11) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
                    end
                end
            end

            % remove empty cells
            PWR(cellfun(@isempty,PWR)) = [];
            PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];

            % % Merge spectra from each band and export
            % HRV.frequency.pwr_freqs(j,i+11) = [cat(1, PWR_freqs{:})];
            % HRV.frequency.pwr(j,i+11) = [cat(1, PWR{:})];
            % HRV.frequency.bands(j,i+11) = bands;

            % Average across time windows
            if isfield(HRV.frequency,'lf')
                HRV.frequency.lf_mean(j,i+11) = mean(HRV.frequency.lf,'omitnan');
            end
            if isfield(HRV.frequency,'hf')
                HRV.frequency.hf_mean(j,i+11) = mean(HRV.frequency.hf,'omitnan');
            end
        end
    end
end

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        %FREQ
        NN = EEG.HEP.ibi;
        NN_times = EEG.HEP.qrs/500;

        if isempty(NN_times)
            continue
        else

            hrv_spec = 'LombScargle_norm';
            params.hrv_spec_method = 'LombScargle_norm';  % for exportation for users

            norm = true;

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
                HRV.frequency.lfhf(j+1,i+17) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
            end

            % Total power and normalize if all bands are present (average across windows)
            % if isfield(HRV.frequency,'ulf') && isfield(HRV.frequency,'vlf') ...
            %         && isfield(HRV.frequency,'lf') && isfield(HRV.frequency,'hf')
            if norm
                HRV.frequency.ttlpwr(j+1,i+17) = sum([mean(HRV.frequency.lf) mean(HRV.frequency.hf)]);
            end

            % Normalize 2nd level (capture contribution of each band to overall
            % power)
            if norm
                if isfield(HRV.frequency,'ttlpwr')
                    disp('Normalizing HRV power to overall power')
                    if isfield(HRV.frequency,'lf')
                        HRV.frequency.lf_norm(j+1,i+17) = mean(HRV.frequency.lf) / HRV.frequency.ttlpwr(j+1,i+17);
                    end
                    if isfield(HRV.frequency,'hf')
                        HRV.frequency.hf_norm(j+1,i+17) = mean(HRV.frequency.hf) / HRV.frequency.ttlpwr(j+1,i+17);
                    end
                    if isfield(HRV.frequency,'lfhf')
                        HRV.frequency.lfhf_norm(j+1,i+17) = round(mean(HRV.frequency.lf) / mean(HRV.frequency.hf) * 100)/100;
                    end
                end
            end

            % remove empty cells
            PWR(cellfun(@isempty,PWR)) = [];
            PWR_freqs(cellfun(@isempty,PWR_freqs)) = [];

            % % Merge spectra from each band and export
            % HRV.frequency.pwr_freqs(j+1,i+17) = [cat(1, PWR_freqs{:})];
            % HRV.frequency.pwr(j+1,i+17) = [cat(1, PWR{:})];
            % HRV.frequency.bands(j+1,i+17) = bands;

            % Average across time windows
            if isfield(HRV.frequency,'lf')
                HRV.frequency.lf_mean(j+1,i+17) = mean(HRV.frequency.lf,'omitnan');
            end
            if isfield(HRV.frequency,'hf')
                HRV.frequency.hf_mean(j+1,i+17) = mean(HRV.frequency.hf,'omitnan');
            end
        end
    end
end