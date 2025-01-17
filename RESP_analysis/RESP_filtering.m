%Resp filtering

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
RESPext = "_RESP";
filtext = "_filt";
trimext = "_trimmed";

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, RESPext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext);
		savename = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\RESP_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',0.5);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\RESP_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

		%edw mporei na mpei filtro epipleon 
		%disp(savename);
    end
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12" "sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, RESPext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext);
		savename = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\RESP_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',0.5);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\RESP_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

		%edw mporei na mpei filtro epipleon 
		%disp(savename);
    end
end

subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, RESPext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext);
		savename = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\RESP_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',0.5);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\RESP_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

		%edw mporei na mpei filtro epipleon 
		%disp(savename);
    end
end

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, RESPext, trimext, setext);
		setname = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext);
		savename = strcat( subject{i}, lab, task{j}, RESPext, trimext, filtext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\RESP_trimmed\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',0.5);
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\RESP_filtered\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

		%edw mporei na mpei filtro epipleon 
		%disp(savename);
    end
end
