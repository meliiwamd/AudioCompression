clc
clear all
Compressor();
%% Function
%compression function
function[] = Compressor()  
%% Read 
[Voice, Frequency] = audioread('Sample.m4a');

% Chosing a block size 
windowSize = 7000;
 
% Compression  percentages
samplesHalf = windowSize / 2;

% Initializing compressed matrice
HalfCompression = [];

 
%% Compression
for i= 1: windowSize:length(Voice) - windowSize
    windowDCT = dct(Voice(i: i + windowSize - 1));
    HalfCompression(i: i + windowSize - 1) = idct(windowDCT(1: samplesHalf), windowSize);
end

%% Plot
figure(1)
h1 = subplot(2, 1, 1);
plot(Voice), title('Original Waveform');
subplot(2, 1, 2)
plot(HalfCompression), title('Compression Factor 2'), axis(axis(h1));

%%
%expanded view of audio signals
figure(2)
h1 = subplot(2, 1 ,1); plot(Voice(100000: 120000)), title('Portion of Original Waveform');
subplot(2, 1, 2)
plot(HalfCompression(100000: 120000)), title('Portion of Compression Factor 2') ;

%% Save
audiowrite('CompressionFactor2.m4a', HalfCompression,Frequency);

%% Play 
%playing files
disp('Original');
sound(Voice, Frequency);
FirstSize = dir('Sample.m4a');         
display(FirstSize.bytes); 
pause(20);
disp('Compression Factor 2');
sound(HalfCompression, Frequency);
FirstSize = dir('CompressionFactor2.m4a');         
display(FirstSize.bytes); 

end
