%PPG peak detection and EEG.HEP structure saving

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
PPGext = "_PPG";
filtext = "_filt";
trimext = "_trimmed";
detext = "_detected";

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);
		setname = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext);
		savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, detext, setext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        pop_heplab;
        uiwait(hepgui.main);

        EEG.HEP = HEP;

		EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_detected\\');
		[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-07" "sub-08" "sub-09" "sub-12"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);
        setname = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext);
        savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        pop_heplab;
        uiwait(hepgui.main);

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = "sub-13";
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);
        setname = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext);
        savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        pop_heplab;
        uiwait(hepgui.main);

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-14" "sub-15" "sub-16" "sub-17" "sub-18" "sub-19"];
task = ["grazME" "grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);
        setname = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext);
        savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        pop_heplab;
        uiwait(hepgui.main);

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

subject = ["sub-01" "sub-02" "sub-03"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-pilot1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

        filename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, setext);
        setname = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext);
        savename = strcat( subject{i}, lab, task{j}, PPGext, trimext, filtext, detext, setext);

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\PPG_filtered\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        pop_heplab;
        uiwait(hepgui.main);

        EEG.HEP = HEP;

        EEG = pop_saveset( EEG, 'filename', num2str(savename),'filepath','C:\\DATA_ARRANGED\\PPG_detected\\');
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    end
end

% mean_ME = mean(meanRR_grazME, 'omitnan');
% mean_MI = mean(meanRR_grazMI, 'omitnan');
% mean_MIMO = mean(meanRR_neurowMIMO, 'omitnan');
% mean_MIMOVR = mean(meanRR_neurowMIMOVR, 'omitnan');
% mean_MIMOHP = mean(meanRR_neurowMIMOHP, 'omitnan');
% mean_MIMOVRHP = mean(meanRR_neurowMIMOVRHP, 'omitnan');
% 
% mean_values = [mean_ME mean_MI mean_MIMO mean_MIMOVR mean_MIMOHP mean_MIMOVRHP];
% 
% A = NaN(6,20);
% A(1,1:length(meanRR_grazME)) = meanRR_grazME;
% A(2,1:length(meanRR_grazMI)) = meanRR_grazMI;
% A(3,1:length(meanRR_neurowMIMO)) = meanRR_neurowMIMO;
% A(4,1:length(meanRR_neurowMIMOVR)) = meanRR_neurowMIMOVR;
% A(5,1:length(meanRR_neurowMIMOHP)) = meanRR_neurowMIMOHP;
% A(6,1:length(meanRR_neurowMIMOVRHP)) = meanRR_neurowMIMOVRHP;
% 
% 
% meanRR_allconditions = A';
% 
% figure
% boxchart(meanRR_allconditions, 'HandleVisibility','off')
% hold on
% plot(A, 'r.', 'HandleVisibility','off')
% plot(A)
% legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
% xlabel('Condition')
% ylabel('RR')
% 
% figure
% boxchart(meanRR_allconditions)
% hold on
% plot(mean_values)
% hold on
% plot(mean_values, 'r*')
% xlabel('condition')
% ylabel('RR')
% 
% figure
% t = tiledlayout(2,6);
% nexttile
% boxchart(meanRR_grazME)
% xlabel('ME')
% ylabel('RR')
% nexttile
% histogram(meanRR_grazME)
% view([90 -90])
% nexttile
% boxchart(meanRR_grazMI)
% xlabel('MI')
% ylabel('RR')
% nexttile
% histogram(meanRR_grazMI)
% view([90 -90])
% nexttile
% boxchart(meanRR_neurowMIMO)
% xlabel('MIMO')
% ylabel('RR')
% nexttile
% histogram(meanRR_neurowMIMO)
% view([90 -90])
% nexttile
% boxchart(meanRR_neurowMIMOVR)
% xlabel('MIMOVR')
% ylabel('RR')
% nexttile
% histogram(meanRR_neurowMIMOVR)
% view([90 -90])
% nexttile
% boxchart(meanRR_neurowMIMOHP)
% xlabel('MIMOHP')
% ylabel('RR')
% nexttile
% histogram(meanRR_neurowMIMOHP)
% view([90 -90])
% nexttile
% boxchart(meanRR_neurowMIMOVRHP)
% xlabel('MIMOVRHP')
% ylabel('RR')
% nexttile
% histogram(meanRR_neurowMIMOVRHP)
% view([90 -90])