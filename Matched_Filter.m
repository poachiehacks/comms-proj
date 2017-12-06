function [HS_MF_Out SRRC_MF_Out] = Matched_Filter(Noisy_HS, Noisy_SRRC, SRRCPulse, T)

%Function creates a Matched Filter for each input in the form of the pulse
%shaping functions created in the modulation functions.  The Matched filter
%will input the noisy signals and convolve them with the original pulse
%shaping modulator. This function also plots the step and frequency
%responses of the filters

tg = 0:1:T-1;                           %Create new time vector

%Create G(s) Filters
G_HS_Pulse = sin(pi*tg/T);             %Matched filter for HS Mod signal
G_SRRC_Pulse = SRRCPulse;               %Matched filter for SRRC Pulse
%Plot impulse responses of Matched Filters
figure(110); stem(G_HS_Pulse); suptitle('Impulse Response Half-Sine Matched Filter')
figure(111); stem(G_SRRC_Pulse); suptitle('Impulse Response SRRC Matched Filter')
%Plot frequency responses of Matche Filters
figure(112); freqz(G_HS_Pulse); suptitle('Frequency Response of Half-Sine Matched Filter')
figure(113); freqz(G_SRRC_Pulse); suptitle('Frequency Response of SRRC Matched Filter')


%Outputs of Matched Filter created by Convolution
HS_MF_Out = conv(Noisy_HS, G_HS_Pulse);
SRRC_MF_Out = conv(Noisy_SRRC, G_SRRC_Pulse);

