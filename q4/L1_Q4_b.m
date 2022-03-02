% DTFT
close all
clear

%---------------------------------------
% Sinais de entrada
beta = 0.6035;
alpha1 = -0.05175;
alpha2 = 0.25;

h = [alpha1 alpha2 beta alpha2 alpha1];

fin1 = 200;
fin2 = 500;
fin3 = 1000;
fin4 = 2000;

%---------------------------
% função resposta ao filtro

function [X,Y, n] = resposta_ao_filtro(fin, h_n)
  fs = 8000;
  TEMPO = 0.01;
  NS = fs * TEMPO;
  n=[0:NS-1];
  
  omega = (2*pi*fin)/fs;
  omega = (2*pi*fin)/fs;
  X = cos(omega*n);
  Y = conv(h_n,X);
  Y = Y(1:(length(Y)-length(h_n)+1));
endfunction

%------------------------------------
%---- Respostas do filtro ----------------
[x1,y1, n] = resposta_ao_filtro(fin1,h);
[x2,y2] = resposta_ao_filtro(fin2,h);
[x3,y3] = resposta_ao_filtro(fin3,h);
[x4,y4] = resposta_ao_filtro(fin4,h);

%-------------------------------------------
% Plot da resposta
figure
subplot(2,2,1);
plot(n,x1,'b-', n, y1,'r--');
axis ([1 50 -1.1 1.1]);
ylabel ('Amplitude');
xlabel ('Indice Tempo (n)');
title('FIN = 200hz'); 
legend ('x1[n]','y1[n]');

subplot(2,2,2);
plot(n,x2,'b-', n, y2,'r--');
axis ([1 50 -1.1 1.1]);
ylabel ('Amplitude');
xlabel ('Indice Tempo (n)');
title('FIN = 500hz');  
legend ('x2[n]','y2[n]');

subplot(2,2,3);
plot(n,x3,'b-', n, y3,'r--');
axis ([1 25 -1.1 1.1]);
ylabel ('Amplitude');
xlabel ('Indice Tempo (n)');
title('FIN = 1000hz'); 
legend ('x3[n]','y3[n]');

subplot(2,2,4);
plot(n,x4,'b-', n, y4,'r--');
axis ([1 25 -1.1 1.1]);
ylabel ('Amplitude');
xlabel ('Indice Tempo (n)');
title('FIN = 2000hz'); 
legend ('x4[n]','y4[n]');