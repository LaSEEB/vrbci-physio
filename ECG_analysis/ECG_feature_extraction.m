%ECG feature extraction
%meanRR(Inter Beat Interval)
%meanBPM(beats per minute)

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

setext = ".set";
ECGext = "_ECG";
filtext = "_filt";
trimext = "_trimmed";
detext = "_detected";

meanRR_grazME = NaN(1,20);
meanRR_grazMI = NaN(1,20);
meanRR_neurowMIMO = NaN(1,20);
meanRR_neurowMIMOVR = NaN(1,20);
meanRR_neurowMIMOHP = NaN(1,20);
meanRR_neurowMIMOVRHP = NaN(1,20);

subject = ["sub-01" "sub-02" "sub-03" "sub-04" "sub-05" "sub-06"];
task = ["grazMI" "neurowMIMO" "neurowMIMOHP" "neurowMIMOVR" "neurowMIMOVRHP"];
lab = "_ses-lab1_task-";

for i = 1 : length(subject)
    for j = 1 : length(task)

		filename = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext, setext);
		setname = strcat( subject{i}, lab, task{j}, ECGext, trimext, filtext, detext);

		EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
		[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        meanRR = EEG.xmax / length(EEG.HEP.qrs);
        meanBPM = 60/meanRR; 

        if task{j} == "grazMI"
            meanRR_grazMI(i) = meanRR;
        elseif task{j} == "neurowMIMO"
            meanRR_neurowMIMO(i) = meanRR;
        elseif task{j} == "neurowMIMOVR"
            meanRR_neurowMIMOVR(i) = meanRR;
        elseif task{j} == "neurowMIMOHP"
            meanRR_neurowMIMOHP(i) = meanRR;
        elseif task{j} == "neurowMIMOVRHP"
            meanRR_neurowMIMOVRHP(i) = meanRR;
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

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        meanRR = EEG.xmax / length(EEG.HEP.qrs);
        meanBPM = 60/meanRR; 

        if task{j} == "grazME"
            meanRR_grazME(i+6) = meanRR;
        elseif task{j} == "grazMI"
            meanRR_grazMI(i+6) = meanRR;  
        elseif task{j} == "neurowMIMO"
            meanRR_neurowMIMO(i+6) = meanRR;
        elseif task{j} == "neurowMIMOVR"
            meanRR_neurowMIMOVR(i+6) = meanRR;
        elseif task{j} == "neurowMIMOHP"
            meanRR_neurowMIMOHP(i+6) = meanRR;
        elseif task{j} == "neurowMIMOVRHP"
            meanRR_neurowMIMOVRHP(i+6) = meanRR;
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

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        meanRR = EEG.xmax / length(EEG.HEP.qrs);
        meanBPM = 60/meanRR;

        if task{j} == "grazME"
            meanRR_grazME(11) = meanRR;
        elseif task{j} == "grazMI"
            meanRR_grazMI(11) = meanRR;  
        elseif task{j} == "neurowMIMO"
            meanRR_neurowMIMO(11) = meanRR;
        elseif task{j} == "neurowMIMOVR"
            meanRR_neurowMIMOVR(11) = meanRR;
        elseif task{j} == "neurowMIMOHP"
            meanRR_neurowMIMOHP(11) = meanRR;
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

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        meanRR = EEG.xmax / length(EEG.HEP.qrs);
        meanBPM = 60/meanRR;

        if task{j} == "grazME"
            meanRR_grazME(i+11) = meanRR;
        elseif task{j} == "grazMI"
            meanRR_grazMI(i+11) = meanRR;    
        elseif task{j} == "neurowMIMO"
            meanRR_neurowMIMO(i+11) = meanRR;
        elseif task{j} == "neurowMIMOVR"
            meanRR_neurowMIMOVR(i+11) = meanRR;
        elseif task{j} == "neurowMIMOHP"
            meanRR_neurowMIMOHP(i+11) = meanRR;
        elseif task{j} == "neurowMIMOVRHP"
            meanRR_neurowMIMOVRHP(i+11) = meanRR;
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

        EEG = pop_loadset('filename', num2str(filename),'filepath','C:\\DATA_ARRANGED\\ECG_detected\\');
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

        meanRR = EEG.xmax / length(EEG.HEP.qrs);
        meanBPM = 60/meanRR;

        if task{j} == "grazMI"
            meanRR_grazMI(i+17) = meanRR;
        elseif task{j} == "neurowMIMO"
            meanRR_neurowMIMO(i+17) = meanRR;
        elseif task{j} == "neurowMIMOVR"
            meanRR_neurowMIMOVR(i+17) = meanRR;
        elseif task{j} == "neurowMIMOHP"
            meanRR_neurowMIMOHP(i+17) = meanRR;
        elseif task{j} == "neurowMIMOVRHP"
            meanRR_neurowMIMOVRHP(i+17) = meanRR;
        end
    end
end

%cleaning sub04, sub07 grazME, sub12 MIMOVR and sub18 as they are too noisy 
meanRR_grazME(4) = NaN;
meanRR_grazMI(4) = NaN;
meanRR_neurowMIMO(4) = NaN;
meanRR_neurowMIMOVR(4) = NaN;
meanRR_neurowMIMOHP(4) = NaN;
meanRR_neurowMIMOVRHP(4) = NaN;
meanRR_grazME(7) = NaN;
meanRR_neurowMIMOVR(10) = NaN;
meanRR_grazME(16) = NaN;
meanRR_grazMI(16) = NaN;
meanRR_neurowMIMO(16) = NaN;
meanRR_neurowMIMOVR(16) = NaN;
meanRR_neurowMIMOHP(16) = NaN;
meanRR_neurowMIMOVRHP(16) = NaN;

meanRR_ME = mean(meanRR_grazME, 'omitnan');
meanRR_MI = mean(meanRR_grazMI, 'omitnan');
meanRR_MIMO = mean(meanRR_neurowMIMO, 'omitnan');
meanRR_MIMOVR = mean(meanRR_neurowMIMOVR, 'omitnan');
meanRR_MIMOHP = mean(meanRR_neurowMIMOHP, 'omitnan');
meanRR_MIMOVRHP = mean(meanRR_neurowMIMOVRHP, 'omitnan');

meanRR_values = [meanRR_ME meanRR_MI meanRR_MIMO meanRR_MIMOVR meanRR_MIMOHP meanRR_MIMOVRHP];

A = NaN(6,20);
A(1,1:length(meanRR_grazME)) = meanRR_grazME;
A(2,1:length(meanRR_grazMI)) = meanRR_grazMI;
A(3,1:length(meanRR_neurowMIMO)) = meanRR_neurowMIMO;
A(4,1:length(meanRR_neurowMIMOVR)) = meanRR_neurowMIMOVR;
A(5,1:length(meanRR_neurowMIMOHP)) = meanRR_neurowMIMOHP;
A(6,1:length(meanRR_neurowMIMOVRHP)) = meanRR_neurowMIMOVRHP;

meanRR_allconditions_horizontally = A;
meanRR_allconditions_vertically = A';

%BPM calculation
B = NaN(6,20);
C = NaN(6,20);
C(:,:) = 60;
B(:,:) = C(:,:) ./ A(:,:);

meanBPM_allconditions_horizontally = B;
meanBPM_allconditions_vertically = B';

figure
boxchart(meanRR_allconditions_vertically, 'HandleVisibility','off')
title('RR ECG')
hold on
plot(A, 'r.', 'HandleVisibility','off')
plot(A)
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('RR')

figure
t = tiledlayout(2,6);
nexttile
boxchart(meanRR_grazME)
xlabel('ME')
ylabel('RR')
nexttile
histogram(meanRR_grazME)
view([90 -90])
nexttile
boxchart(meanRR_grazMI)
xlabel('MI')
ylabel('RR')
nexttile
histogram(meanRR_grazMI)
view([90 -90])
nexttile
boxchart(meanRR_neurowMIMO)
xlabel('MIMO')
ylabel('RR')
nexttile
histogram(meanRR_neurowMIMO)
view([90 -90])
nexttile
boxchart(meanRR_neurowMIMOVR)
xlabel('MIMOVR')
ylabel('RR')
nexttile
histogram(meanRR_neurowMIMOVR)
view([90 -90])
nexttile
boxchart(meanRR_neurowMIMOHP)
xlabel('MIMOHP')
ylabel('RR')
nexttile
histogram(meanRR_neurowMIMOHP)
view([90 -90])
nexttile
boxchart(meanRR_neurowMIMOVRHP)
xlabel('MIMOVRHP')
ylabel('RR')
nexttile
histogram(meanRR_neurowMIMOVRHP)
view([90 -90])

figure
boxchart(meanBPM_allconditions_vertically, 'HandleVisibility','off')
title('BPM ECG')
hold on
plot(B, 'r.', 'HandleVisibility','off')
plot(B)
legend("sub-01", "sub-02", "sub-03", "sub-04", "sub-05", "sub-06", "sub-07", "sub-08", "sub-09", "sub-12", "sub-13", "sub-14", "sub-15", "sub-16", "sub-17", "sub-18", "sub-19", "pilot-01", "pilot-02", "pilot-03" )
xlabel('Condition')
ylabel('BPM')