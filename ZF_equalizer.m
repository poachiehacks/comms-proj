function [ZF_Equalizer_Out_HS,ZF_Equalizer_Out_SRRC] = ZF_equalizer(HS_MF_Out, SRRC_MF_Out)

%Function is a zero-forcing equalizer which undoes the effects of the
%Channel.  The Equalizer compensates for channel distortion by inverting
%the channel response.  This function also plots the impulse and frequency
%response of the equalizer

delay = zeros(1,31);                            %Matrix of zeros to delay between pulses
h = [1 delay 1/2 delay 3/4 delay -2/7];         %Coefficients of the Channel

%L1 = length(HS_MF_Out); P1 = 2^nextpow2(L1);
%L2 = length(SRRC_MF_Out); P2 = 2^nextpow2(L2);

%HS_FFT = fft(HS_MF_Out);                        %FFT of HS signal
%SRRC_FFT = fft(SRRC_MF_Out);                    %FFT of the SRRC signal

%Hf_HS = fft(h);                                 %FFT of Channel for HS signal
%Hf_SRRC = fft(h);                               %FFt of Channel for SRRC signal

%ZFE_HS = 1./Hf_HS;                              %Equalizer for HS signal
%ZFE_SRRC = 1./Hf_SRRC;                          %Equalizer for SRRC signal

%freqz(ZFE_HS);title('Frequency Response of Zero Forcing Equalizer')
%freqz(ZFE_SRRC);title('Frequency Response of Zero Forcing Equalizer')

%ZF_Equalizer_Out_HS = ifft(Hf_HS.*ZFE_HS);
%ZF_Equalizer_Out_SRRC = ifft(Hf_SRRC.*ZFE_SRRC);

ZF_Equalizer_Out_HS = filter(1, h, HS_MF_Out);
ZF_Equalizer_Out_SRRC = filter(1, h, SRRC_MF_Out);

figure(114),stem(ZF_Equalizer_Out_HS);
title('Impulse Response of the Zero-Forcing Equalizer HS')

figure(115),stem(ZF_Equalizer_Out_SRRC);
title('Impulse Response of the Zero-Forcing Equalizer SRRC')








