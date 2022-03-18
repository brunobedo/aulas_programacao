% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Subplot dos atletas

%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('data2d-Exemplo.mat');

% Frequencia de aquisição
freq = 30;

%   Criando vetor tempo
vtemp = ((0:size(data_x,1)-1)/freq)./60';

% Média dos valores de X e Y 
media_x = mean(data_x,2);
media_y = mean(data_y,2);

% Criando figura 
f1 = figure(1);

% Subplot 1 
subplot(2,1,1)
plot(vtemp,media_x,'ro','MarkerSize',2,'LineWidth',2)
title('Deslocamento médio no eixo X')
xlabel('Time (min)')
ylabel('Metros')

% Subplot 2 
subplot(2,1,2)
plot(vtemp,media_y,'ko','MarkerSize',2,'LineWidth',2)
title('Deslocamento médio no eixo Y')
xlabel('Time (min)')
ylabel('Metros')






