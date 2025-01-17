%PPG METHODS

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','sub-08_ses-lab1_task-grazMI_PPG.set','filepath','D:\\DATA_ARRANGED\\PPG\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

ppg = EEG.data';
srate = EEG.srate;
Fs = EEG.srate;

%set desired time and time vector
x = 80.5;
y = 85;
t = x:0.002:y;

%prin to filtro
figure('Name','The unprocessed PPG signal')
plot(t, ppg(x*500:y*500))
%title('The unprocessed PPG signal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_PPG_1.png","Resolution",300)

%filtro
EEG = pop_eegfiltnew(EEG, 'locutoff',0.3,'hicutoff',8);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off');

figure('Name','The filtered PPG signal')
plot(t, EEG.data(x*500:y*500))
%title('The filtered PPG signal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_PPG_2.png","Resolution",300)

%%%%%%%%%%%%%%%%%thelei diorthwsh
[peaks, onsets] = ims_beat_detector(EEG.data(x*500:y*500),500);

starting_point = x*500; %apo edw ksekinaei h metrhsh twn peaks

peaks_samples = starting_point + peaks; %se samples
peaks_times = peaks_samples / 500; %se seconds

peaks_height = EEG.data(peaks_samples);

figure('Name','Peaks detected using the IMS beat detector')
plot(t, EEG.data(x*500:y*500))
hold on
plot(peaks_times, peaks_height, 'ro')
%title('Peaks detected using the IMS beat detector')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_PPG_3.png","Resolution",300)

