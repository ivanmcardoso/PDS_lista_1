% DTFT
close all
clear

%---------------------------------------
% Sinais de entrada

x_entrada = [0 0.707 1 0.707 0 -0.707 -1 -0.707];
h_entrada = [1 2 1];
convolucao_de_x_e_h = conv(x_entrada,h_entrada);

%---------------------------------------
% Valores auxiliares
tamanho_de_x_entrada = size(x_entrada, 2);
intervalo_horizontal_x =[0:tamanho_de_x_entrada-1];
tamanho_de_h_entrada = size(h_entrada, 2);
intervalo_horizontal_h =[0:tamanho_de_h_entrada-1];

%------------------------------------------------------------
% Exibe os sinais de entrada
figure

subplot(1,2,1);
stem(intervalo_horizontal_x,x_entrada);
title('Discrete Time Signal x_entrada'); 
subplot(1,2,2);
stem(intervalo_horizontal_h,h_entrada);
title('Discrete Time Signal h_entrada');

%---------------------------------------
% Valores auxiliares conv
tamanho_de_convolucao_de_x_e_h = size(convolucao_de_x_e_h, 2);
intervalo_horizontal =[0:tamanho_de_convolucao_de_x_e_h-1];


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
 
%-----------------------------------------------------
% Obtenção da transformada de fourier de tempo
% discreto para cada um dos sinais de entrada

Freq = 8000; % Frequência de amostragem igual a 8 kHz
[X_entrada, w] = dtft(x_entrada,Freq);
H_entrada = dtft(h_entrada,Freq);
CONV_h_e_x = dtft(convolucao_de_x_e_h,Freq);
PROD_H_e_X = X_entrada .* H_entrada;% Produto de X*H

magX_entrada = abs(X_entrada);
magH_entrada = abs(H_entrada);
magCONV_h_e_x = abs(CONV_h_e_x);

magPROD_H_e_X = abs(PROD_H_e_X);

figure
subplot(1,2,1);
plot((w/pi),magX_entrada);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part X_entrada'); 
ylabel('Magnitude');
subplot(1,2,2);
plot((w/pi),magH_entrada);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part H_entrada'); 
ylabel('Magnitude');

figure
subplot(1,2,1);
plot((w/pi),magCONV_h_e_x);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part Convolution of x and h'); 
ylabel('Magnitude');
subplot(1,2,2);
plot((w/pi),magPROD_H_e_X);
grid
xlabel('frequency in pi units'); 
title('Magnitude Part product of X and H'); 
ylabel('Magnitude');