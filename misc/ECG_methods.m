%ECG methods

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','sub-08_ses-lab1_task-grazMI_ECG.set','filepath','D:\\DATA_ARRANGED\\ECG\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

ecg = EEG.data';
srate = EEG.srate;
Fs = EEG.srate;

%set desired time and time vector
x = 80;
y = 84;
t = x:0.002:y;

%prin to filtro
figure('Name','The unprocessed ECG signal' )
plot(t, ecg(x*500:y*500))
%title('The unprocessed ECG signal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_ECG_1.png","Resolution",300)

%meta to baseline removal
[ecg_filtered_baseline,~] = ECG_Baseline_Removal(ecg,Fs,1,0.5);

figure('Name','ECG signal after baseline removal')
plot(t, ecg_filtered_baseline(x*500:y*500))
%title('ECG signal after baseline removal')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_ECG_2.png","Resolution",300)

%meta to high low filtering
[ecg_filtered_frq] = ECG_High_Low_Filter(ecg,Fs,1,40);
[ecg_filtered_frq]=Notch_Filter(ecg_filtered_frq,Fs,50,1);

figure('Name','ECG signal after Band-Pass filtering' )
plot(t, ecg_filtered_frq(x*500:y*500))
%title('ECG signal after Band-Pass filtering')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_ECG_3.png","Resolution",300)

%meta to isoline correction
[ecg_filtered_isoline,offset,~,~]=Isoline_Correction(ecg_filtered_frq);

figure('Name','ECG signal after isoline correction')
plot(t, ecg_filtered_isoline(x*500:y*500))
%title('ECG signal after isoline correction')
xlabel('Time (sec)')
ylabel('Amplitude (uV)')
ylim("padded")
exportgraphics(gca,"Methods_ECG_4.png","Resolution",300)

pan_tompkin(ecg_filtered_isoline(x*500:y*500),500,1,t,x)
exportgraphics(gca,"Methods_ECG_5.png","Resolution",300)
