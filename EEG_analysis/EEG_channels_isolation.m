%EEG channels isolation - STEP1

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
EEGext = "_EEG";

subject = "sub-01";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'Aux1','Aux2', 'Aux3','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-02" "sub-03" "sub-04" "sub-05"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'Aux3','Aux1','Aux2', 'x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-06";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'ECG','PPG','Resp','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-07" "sub-08" "sub-09" "sub-12" "sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'ECG','PPG','Resp','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-13" ;
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'ECG','PPG','Resp','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-01";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'Aux1','Aux2','Aux3','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-02";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'Aux1','Aux2','Aux3','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-03";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\DATASETS\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_select( EEG, 'rmchannel',{'Aux1','Aux3','Aux2','x_dir','y_dir','z_dir'});
		[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname', num2str(setname),'gui','off'); 
		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
		disp(savename);
    end
end
