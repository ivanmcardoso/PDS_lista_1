% DTFT
close all
clear

%---------------------------------------
% Sinais de entrada

x_entrada = [0 0.707 1 0.707 0 -0.707 -1 -0.707];
x_entrada_multiplicada_por_constante = 2*x_entrada;

%---------------------------------------
% Valores auxiliares
tamanho_de_x_entrada = size(x_entrada, 2);
tamanho_maximo_matriz = tamanho_de_x_entrada-1;
intervalo_horizontal =[0:tamanho_de_x_entrada-1];
%------------------------------------------------------------
% Exibe os sinais de entrada
figure

subplot(1,2,1);
stem(intervalo_horizontal,x_entrada);
title('Discrete Time Signal x_entrada'); 
subplot(1,2,2);
stem(intervalo_horizontal,x_entrada_multiplicada_por_constante);
title('Discrete Time Signal x_entrada multiplied by 2');

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
[X_entrada, w] = dtft(x_entrada,Freq);

magX_entrada = abs(X_entrada); % Resposta em amplitude de X_entrada
magX_entrada_multiplicada_por_constante = 2*abs(X_entrada); % Resposta em amplitude de X_entrada multiplicado por 2

figure
subplot(1,2,1);
plot((w/pi),magX_entrada);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part X_entrada'); 
ylabel('Magnitude');
subplot(1,2,2);
plot((w/pi),magX_entrada_multiplicada_por_constante);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part X_entrada multiplied by 2'); 
ylabel('Magnitude');


