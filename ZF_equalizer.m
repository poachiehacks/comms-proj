function [ZF_Equalizer_Out] = ZF_equalizer(MF_Out)
% function [ZF_Equalizer_Out] = ZF_equalizer(MF_Out)
% Function is a zero-forcing equalizer which undoes the effects of the
% Channel.  The Equalizer compensates for channel distortion by inverting
% the channel response.  This function also plots the impulse and frequency
% response of the equalizer

% Input: Output of the Matched Filter Block in the communication chain
% Output: Received Signal with Channel Effects mitigated using the
% Zero-Forcing method

%% Code Rev 1.2
% channel
h = [1 1/2 3/4 -2/7];
h_up = upsample(h,32); % upsampling h inserts 32-1 zeros between each element in h

% find frequency response of the channel using freqz
% Output only shows the response in the interval [0,pi] radial frequencies
[H,w] = freqz(h);
[H_up,w_up] = freqz(h_up);

figure, freqz(h)
title('Frequency Response of Channel')
figure, freqz(h)
title('Frequency Response of Upsampled Channel')

ZF_Equalizer_Out = filter(1,h,MF_Out);

% % find frequency response of the channel using fft
% % Output is centered around 0Hz
% H = fftshift(fft(h,512)); 
% H_up = fftshift(fft(h_up,512));

%% Code Rev 1.1

% delay = zeros(1,31);                            %Matrix of zeros to delay between pulses
% h = [1 delay 1/2 delay 3/4 delay -2/7];         %Coefficients of the Channel
% 
% ZF_Equalizer_Out_HS = filter(1, h, HS_MF_Out);
% ZF_Equalizer_Out_SRRC = filter(1, h, SRRC_MF_Out);
% 
% figure,plot(ZF_Equalizer_Out_HS);
% title('Impulse Response of the Zero-Forcing Equalizer HS')
% figure, freqz(h)
% title('Frequency Response of the Zero-Forcing Equalizer HS')
% 
% figure,plot(ZF_Equalizer_Out_SRRC);
% title('Impulse Response of the Zero-Forcing Equalizer SRRC')
% figure, freqz(h)
% title('Frequency Response of the Zero-Forcing Equalizer SRRC')

%% Code Rev 1.0

% function [ZF_Equalizer_Out_HS,ZF_Equalizer_Out_SRRC] = ZF_equalizer(HS_MF_Out, SRRC_MF_Out)
% Function is a zero-forcing equalizer which undoes the effects of the
% Channel.  The Equalizer compensates for channel distortion by inverting
% the channel response.  This function also plots the impulse and frequency
% response of the equalizer

% delay = zeros(1,31);                            %Matrix of zeros to delay between pulses
% h = [1 delay 1/2 delay 3/4 delay -2/7];         %Coefficients of the Channel
% 
% L1 = length(HS_MF_Out); P1 = 2^nextpow2(L1);
% L2 = length(SRRC_MF_Out); P2 = 2^nextpow2(L2);
% 
% HS_FFT = fft(HS_MF_Out);                        %FFT of HS signal
% SRRC_FFT = fft(SRRC_MF_Out);                    %FFT of the SRRC signal
% 
% Hf_HS = fft(h);                                 %FFT of Channel for HS signal
% Hf_SRRC = fft(h);                               %FFt of Channel for SRRC signal
% 
% ZFE_HS = 1./Hf_HS;                              %Equalizer for HS signal
% ZFE_SRRC = 1./Hf_SRRC;                          %Equalizer for SRRC signal
% 
% freqz(ZFE_HS);title('Frequency Response of Zero Forcing Equalizer')
% freqz(ZFE_SRRC);title('Frequency Response of Zero Forcing Equalizer')
% 
% ZF_Equalizer_Out_HS = ifft(Hf_HS.*ZFE_HS);
% ZF_Equalizer_Out_SRRC = ifft(Hf_SRRC.*ZFE_SRRC);

return
