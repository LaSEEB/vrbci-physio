%ECG only filtering and saving 

addpath(genpath('C:\Users\egeor\OneDrive\Έγγραφα\MATLAB\ECGdeli-master'));
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
ECGext = "_ECG";
filtext = "_filt";
trimext = "_trimmed";

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

		srate = EEG.srate;
        Fs = EEG.srate;
		ecg = EEG.data';

        [ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);
        [ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
        [ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);
        [ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

        ecg = ecg_filtered_isoline;
        EEG.data = ecg_filtered_isoline';
        EEG.offset = offset;

        EEG = pop_saveset( EEG, 'filename', num2str(savename), 'filepath','C:\\DATA_ARRANGED\\ECG_filtered\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

		srate = EEG.srate;
        Fs = EEG.srate;
		ecg = EEG.data';

        [ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);
        [ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
        [ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);
        [ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

        ecg = ecg_filtered_isoline;
        EEG.data = ecg_filtered_isoline';
        EEG.offset = offset;

        EEG = pop_saveset( EEG, 'filename', num2str(savename), 'filepath','C:\\DATA_ARRANGED\\ECG_filtered\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end


subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

		srate = EEG.srate;
        Fs = EEG.srate;
		ecg = EEG.data';

        [ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);
        [ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
        [ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);
        [ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

        ecg = ecg_filtered_isoline;
        EEG.data = ecg_filtered_isoline';
        EEG.offset = offset;

        EEG = pop_saveset( EEG, 'filename', num2str(savename), 'filepath','C:\\DATA_ARRANGED\\ECG_filtered\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

		srate = EEG.srate;
        Fs = EEG.srate;
		ecg = EEG.data';

        [ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);
        [ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
        [ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);
        [ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

        ecg = ecg_filtered_isoline;
        EEG.data = ecg_filtered_isoline';
        EEG.offset = offset;

        EEG = pop_saveset( EEG, 'filename', num2str(savename), 'filepath','C:\\DATA_ARRANGED\\ECG_filtered\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

		srate = EEG.srate;
        Fs = EEG.srate;
		ecg = EEG.data';

        [ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);
        [ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
        [ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);
        [ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

        ecg = ecg_filtered_isoline;
        EEG.data = ecg_filtered_isoline';
        EEG.offset = offset;

        EEG = pop_saveset( EEG, 'filename', num2str(savename), 'filepath','C:\\DATA_ARRANGED\\ECG_filtered\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);        
    end
end