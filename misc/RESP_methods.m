%RESP methods graphs

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','sub-09_ses-lab1_task-grazMI_RESP.set','filepath','D:\\DATA_ARRANGED\\RESP\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

%set desired time
x = 60;
y = 120;

%[pks,locs] = findpeaks(EEG.data,500)

%prin to filtro
figure('Name','Detected Peaks of the unprocessed signal')
findpeaks(EEG.data,500)
%title('Detected Peaks of the unprocessed signal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
xlim([x,y])
ylim("padded")
exportgraphics(gca,"Methods_respiration_1.png","Resolution",300)

EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',0.5);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');

%meta to filtro
figure('Name','Detected Peaks of the filtered signal')
findpeaks(EEG.data,500)
%title('Detected Peaks of the filtered signal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
xlim([x,y])
ylim("padded")
exportgraphics(gca,"Methods_respiration_2.png","Resolution",300)

%apostash
figure('Name','Detected Peaks of the filtered signal, with MinPeakDistance set to 2 seconds')
findpeaks(EEG.data,500, 'MinPeakDistance', 2)
%title({'Detected Peaks of the filtered signal,','with MinPeakDistance set to 2 seconds'})
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
xlim([x,y])
ylim("padded")
exportgraphics(gca,"Methods_respiration_3.png","Resolution",300)