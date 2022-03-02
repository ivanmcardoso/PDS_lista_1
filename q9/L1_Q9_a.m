% DTFT
close all
clear

%---------------------------------------
% Sinais de entrada
beta = 0.707
alpha = (0.15-0.707)/(2*cos(0.1*pi));

h_entrada = [alpha beta alpha];

%---------------------------------------
% Valores auxiliares
tamanho_de_h_entrada = length(h_entrada);
intervalo_horizontal =[0:tamanho_de_h_entrada-1];

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

figure
subplot(1,2,1);
plot((w/pi),magH_entrada);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part H'); 
ylabel('Magnitude');
subplot(1,2,2);
stem(intervalo_horizontal,h_entrada);
title('Discrete Time Signal h');

