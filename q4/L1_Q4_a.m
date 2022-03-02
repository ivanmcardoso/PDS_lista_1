% DTFT
close all
clear

%---------------------------------------
% Sinais de entrada
beta = 0.6035;
alpha1 = -0.05175;
alpha2 = 0.25;

h_entrada = [alpha1 alpha2 beta alpha2 alpha1];

%------------------------------------------------------------
% implementação de algoritmo para  a DTFT

function [X,W] = dtft(x, fs)
  W = [-fs/2:1:fs/2]*pi*2/(fs); %eixo de freq. em pi
  X=0;
  N=size(x,2)-1;
  for n =0:N
    X += (x(1,n+1)*exp(-j*W*n));
  endfor
 endfunction
 
%------------------------------------------------------------
% Obtenção da transformada de fourier de tempo
% discreto para cada um dos sinais de entrada

Freq = 8000; % Frequência de amostragem igual a 8 kHz
[H_entrada, w] = dtft(h_entrada,Freq);

magH_entrada = abs(H_entrada); % Resposta em amplitude de H_entrada
angH_entrada = angle(H_entrada);

figure
subplot(1,2,1);
plot((w/pi),magH_entrada);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part H'); 
ylabel('Magnitude');
subplot(1,2,2);
plot((w/pi),angH_entrada);
grid
xlabel('frequency in pi units'); 
title('Angle Part'); 
ylabel('Radians');

