%ECG peak viewer

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
ECGext = "_ECG";
filtext = "_filt";
trimext = "_trimmed";
detext = "_detected";

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);
		savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        HEP = EEG.HEP;
        heplab;
        uiwait(hepgui.main)

        EEG.HEP = HEP;

		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-07" "sub-08" "sub-09" "sub-12"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);
        savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        HEP = EEG.HEP;
        heplab;
        uiwait(hepgui.main)

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);
        savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        HEP = EEG.HEP;
        heplab;
        uiwait(hepgui.main)

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);
        savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        HEP = EEG.HEP;
        heplab;
        uiwait(hepgui.main)

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
        setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);
        savename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        HEP = EEG.HEP;
        heplab;
        uiwait(hepgui.main)

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end