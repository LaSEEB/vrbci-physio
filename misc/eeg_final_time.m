%EEG FINAL RESULTS TIME 

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
EEGext = "_EEG";

eeg_features.time.rms = NaN(32,6,20);
eeg_features.time.mode = NaN(32,6,20);
eeg_features.time.var = NaN(32,6,20);
eeg_features.time.skewness = NaN(32,6,20);
eeg_features.time.kurtosis = NaN(32,6,20);
eeg_features.time.iqr = NaN(32,6,20);

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_finalcont\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        signals = EEG.data;

        % Time domain
        eeg_features.time.rms(:,j+1,i) = rms(signals,2);
        eeg_features.time.mode(:,j+1,i) = mode(signals,2);
        eeg_features.time.var(:,j+1,i) = var(signals,0,2);
        eeg_features.time.skewness(:,j+1,i) = skewness(signals,0,2);
        eeg_features.time.kurtosis(:,j+1,i) = kurtosis(signals,0,2);
        eeg_features.time.iqr(:,j+1,i) = iqr(signals,2);

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

        signals = EEG.data;

        % Time domain
        eeg_features.time.rms(:,j,i+6) = rms(signals,2);
        eeg_features.time.mode(:,j,i+6) = mode(signals,2);
        eeg_features.time.var(:,j,i+6) = var(signals,0,2);
        eeg_features.time.skewness(:,j,i+6) = skewness(signals,0,2);
        eeg_features.time.kurtosis(:,j,i+6) = kurtosis(signals,0,2);
        eeg_features.time.iqr(:,j,i+6) = iqr(signals,2);
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

        signals = EEG.data;

        % Time domain
        eeg_features.time.rms(:,j,11) = rms(signals,2);
        eeg_features.time.mode(:,j,11) = mode(signals,2);
        eeg_features.time.var(:,j,11) = var(signals,0,2);
        eeg_features.time.skewness(:,j,11) = skewness(signals,0,2);
        eeg_features.time.kurtosis(:,j,11) = kurtosis(signals,0,2);
        eeg_features.time.iqr(:,j,11) = iqr(signals,2);

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

        signals = EEG.data;

        % Time domain
        eeg_features.time.rms(:,j,i+11) = rms(signals,2);
        eeg_features.time.mode(:,j,i+11) = mode(signals,2);
        eeg_features.time.var(:,j,i+11) = var(signals,0,2);
        eeg_features.time.skewness(:,j,i+11) = skewness(signals,0,2);
        eeg_features.time.kurtosis(:,j,i+11) = kurtosis(signals,0,2);
        eeg_features.time.iqr(:,j,i+11) = iqr(signals,2);

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

        signals = EEG.data;

        % Time domain
        eeg_features.time.rms(:,j+1,i+17) = rms(signals,2);
        eeg_features.time.mode(:,j+1,i+17) = mode(signals,2);
        eeg_features.time.var(:,j+1,i+17) = var(signals,0,2);
        eeg_features.time.skewness(:,j+1,i+17) = skewness(signals,0,2);
        eeg_features.time.kurtosis(:,j+1,i+17) = kurtosis(signals,0,2);
        eeg_features.time.iqr(:,j+1,i+17) = iqr(signals,2);

    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

% load('RESULTS')
% RESULTS.EEG.time = eeg_features.time;
% save('RESULTS','RESULTS')