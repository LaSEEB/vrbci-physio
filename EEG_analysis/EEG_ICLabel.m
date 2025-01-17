%EEG ICLabel + Remove Components STEP 11  

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
EEGext = "_EEG";

subject = "sub-01";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-02" "sub-03" "sub-04" "sub-05"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
end

subject = "sub-06";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
    STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12" "sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
end

subject = "sub-13" ;
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-01";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-02";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-03";
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
	for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, EEGext, setext);
		setname = strcat( subject{i}, lab, task{j}, EEGext);
		savename = strcat( subject{i}, lab, task{j}, EEGext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','D:\\DATA_ARRANGED\\EEG_ICA\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
		EEG = pop_iclabel(EEG, 'default');
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;0.9 1;NaN NaN]);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_subcomp( EEG, [], 0);
        [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','D:\\DATA_ARRANGED\\EEG_ICLabel\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end