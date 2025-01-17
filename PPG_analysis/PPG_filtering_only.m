%PPG filtering

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
PPGext = "_PPG";
filtext = "_filt";
trimext = "_trimmed";

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

%%%%%%%%%%%%%SOS BEAT DETECTION%%%%%%%%%%%%%%%%%%%%
% 
% diff = ppg_raw - EEG.data;
% diff = abs(diff);
% 
% figure
% plot(ppg_raw, 'b');
% hold on
% plot(EEG.data, 'r');
% hold on 
% plot(diff, 'y');
% 
% figure 
% plot(EEG.data, 'b');
% hold on
% plot(peaks, 'r+')
% 
% 		srate = EEG.srate;
%         Fs = EEG.srate;
% 		ppg = EEG.data;
% 
%         S.v = ppg;
%         S.fs = Fs;
% 
%         beat_detector = 'PDA';     % Select Incremental-Merge Segmentation beat detector
%         [peaks, onsets] = detect_ppg_beats(S, beat_detector);     % detect beats in PPG
%         meanRR = EEG.xmax / length(peaks);
% 
