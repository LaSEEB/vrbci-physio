%ECG HRV feature extraction
%ONLY TIME
%NN = EEG.HEP.ibi
%NN_times = EEG.HEP.qrs

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
ECGext = "_ECG";
filtext = "_filt";
trimext = "_trimmed";
detext = "_detected";

HRV.time.NN_mean = NaN(6,20);
HRV.time.NN_median = NaN(6,20);
HRV.time.NN_mode = NaN(6,20);
HRV.time.NN_var = NaN(6,20);
HRV.time.NN_skew = NaN(6,20);
HRV.time.NN_kurt = NaN(6,20);
HRV.time.NN_iqr = NaN(6,20);

% SDNN (standard deviation of the NN intervals)
HRV.time.SDNN = NaN(6,20);

% RMSSD (sqrt of the mean squared time diff between heartbeats)
HRV.time.RMSSD = NaN(6,20);

% pNN50 (fraction of differences larger than alpha = 50)
% requires at least 2 min of data (see Ginsberg and Schaffer 2017)
HRV.time.pNN50 = NaN(6,20);

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\ECG_detected\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        % NN statistics
        NN = EEG.HEP.ibi;

        HRV.time.NN_mean(j+1,i) = mean(NN.*1000);      % in ms
        HRV.time.NN_median(j+1,i) = median(NN.*1000);  % in ms
        HRV.time.NN_mode(j+1,i) = mode(NN.*1000);      % in ms
        HRV.time.NN_var(j+1,i) = var(NN.*1000);        % in ms
        HRV.time.NN_skew(j+1,i) = skewness(NN);
        HRV.time.NN_kurt(j+1,i) = kurtosis(NN);
        HRV.time.NN_iqr(j+1,i) = iqr(NN.*1000);        % in ms

        % SDNN (standard deviation of the NN intervals)
        HRV.time.SDNN(j+1,i) = std(NN.*1000);   % in ms

        % RMSSD (sqrt of the mean squared time diff between heartbeats)
        HRV.time.RMSSD(j+1,i) = sqrt(mean(diff(NN.*1000).^2));  % in ms

        % pNN50 (fraction of differences larger than alpha = 50)
        % requires at least 2 min of data (see Ginsberg and Schaffer 2017)
        alpha = 50;
        HRV.time.pNN50(j+1,i) = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));
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

        % NN statistics
        NN = EEG.HEP.ibi;

        HRV.time.NN_mean(j,i+6) = mean(NN.*1000);      % in ms
        HRV.time.NN_median(j,i+6) = median(NN.*1000);  % in ms
        HRV.time.NN_mode(j,i+6) = mode(NN.*1000);      % in ms
        HRV.time.NN_var(j,i+6) = var(NN.*1000);        % in ms
        HRV.time.NN_skew(j,i+6) = skewness(NN);
        HRV.time.NN_kurt(j,i+6) = kurtosis(NN);
        HRV.time.NN_iqr(j,i+6) = iqr(NN.*1000);        % in ms

        % SDNN (standard deviation of the NN intervals)
        HRV.time.SDNN(j,i+6) = std(NN.*1000);   % in ms

        % RMSSD (sqrt of the mean squared time diff between heartbeats)
        HRV.time.RMSSD(j,i+6) = sqrt(mean(diff(NN.*1000).^2));  % in ms

        % pNN50 (fraction of differences larger than alpha = 50)
        % requires at least 2 min of data (see Ginsberg and Schaffer 2017)
        alpha = 50;
        HRV.time.pNN50(j,i+6) = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));
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

        % NN statistics
        NN = EEG.HEP.ibi;

        HRV.time.NN_mean(j,11) = mean(NN.*1000);      % in ms
        HRV.time.NN_median(j,11) = median(NN.*1000);  % in ms
        HRV.time.NN_mode(j,11) = mode(NN.*1000);      % in ms
        HRV.time.NN_var(j,11) = var(NN.*1000);        % in ms
        HRV.time.NN_skew(j,11) = skewness(NN);
        HRV.time.NN_kurt(j,11) = kurtosis(NN);
        HRV.time.NN_iqr(j,11) = iqr(NN.*1000);        % in ms

        % SDNN (standard deviation of the NN intervals)
        HRV.time.SDNN(j,11) = std(NN.*1000);   % in ms

        % RMSSD (sqrt of the mean squared time diff between heartbeats)
        HRV.time.RMSSD(j,11) = sqrt(mean(diff(NN.*1000).^2));  % in ms

        % pNN50 (fraction of differences larger than alpha = 50)
        % requires at least 2 min of data (see Ginsberg and Schaffer 2017)
        alpha = 50;
        HRV.time.pNN50(j,11) = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));
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

        % NN statistics
        NN = EEG.HEP.ibi;

        HRV.time.NN_mean(j,i+11) = mean(NN.*1000);      % in ms
        HRV.time.NN_median(j,i+11) = median(NN.*1000);  % in ms
        HRV.time.NN_mode(j,i+11) = mode(NN.*1000);      % in ms
        HRV.time.NN_var(j,i+11) = var(NN.*1000);        % in ms
        HRV.time.NN_skew(j,i+11) = skewness(NN);
        HRV.time.NN_kurt(j,i+11) = kurtosis(NN);
        HRV.time.NN_iqr(j,i+11) = iqr(NN.*1000);        % in ms

        % SDNN (standard deviation of the NN intervals)
        HRV.time.SDNN(j,i+11) = std(NN.*1000);   % in ms

        % RMSSD (sqrt of the mean squared time diff between heartbeats)
        HRV.time.RMSSD(j,i+11) = sqrt(mean(diff(NN.*1000).^2));  % in ms

        % pNN50 (fraction of differences larger than alpha = 50)
        % requires at least 2 min of data (see Ginsberg and Schaffer 2017)
        alpha = 50;
        HRV.time.pNN50(j,i+11) = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));
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

        % NN statistics
        NN = EEG.HEP.ibi;

        HRV.time.NN_mean(j+1,i+17) = mean(NN.*1000);      % in ms
        HRV.time.NN_median(j+1,i+17) = median(NN.*1000);  % in ms
        HRV.time.NN_mode(j+1,i+17) = mode(NN.*1000);      % in ms
        HRV.time.NN_var(j+1,i+17) = var(NN.*1000);        % in ms
        HRV.time.NN_skew(j+1,i+17) = skewness(NN);
        HRV.time.NN_kurt(j+1,i+17) = kurtosis(NN);
        HRV.time.NN_iqr(j+1,i+17) = iqr(NN.*1000);        % in ms

        % SDNN (standard deviation of the NN intervals)
        HRV.time.SDNN(j,i+17) = std(NN.*1000);   % in ms

        % RMSSD (sqrt of the mean squared time diff between heartbeats)
        HRV.time.RMSSD(j,i+17) = sqrt(mean(diff(NN.*1000).^2));  % in ms

        % pNN50 (fraction of differences larger than alpha = 50)
        % requires at least 2 min of data (see Ginsberg and Schaffer 2017)
        alpha = 50;
        HRV.time.pNN50(j,i+17) = sum( abs(diff(NN)) >= alpha/1000 )/length(diff(NN));
    end
end

% %cleaning sub04, sub07 grazME, sub12 MIMOVR and sub18 as they are too noisy 
% meanRR_grazME(4) = NaN;
% meanRR_grazMI(4) = NaN;
% meanRR_neurowMIMO(4) = NaN;
% meanRR_neurowMIMOVR(4) = NaN;
% meanRR_neurowMIMOHP(4) = NaN;
% meanRR_neurowMIMOVRHP(4) = NaN;
% meanRR_grazME(7) = NaN;
% meanRR_neurowMIMOVR(10) = NaN;
% meanRR_grazME(16) = NaN;
% meanRR_grazMI(16) = NaN;
% meanRR_neurowMIMO(16) = NaN;
% meanRR_neurowMIMOVR(16) = NaN;
% meanRR_neurowMIMOHP(16) = NaN;
% meanRR_neurowMIMOVRHP(16) = NaN;