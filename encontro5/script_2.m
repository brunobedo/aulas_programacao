% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Carregar o meu banco de dados 
%     2. Inserir informações em um gráfico

%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('data2d-Exemplo.mat');

% Participante 1
x_p1 = data_x(:,1); 
y_p1 = data_y(:,1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figura 1
% Criando uma figura
f1 = figure(1);

% Plot dados do participante 1
% Eixo X
p1 = plot(x_p1,'g','LineStyle','-.','LineWidth',2);

hold on

% Eixo Y
p2 = plot(y_p1,'k','LineStyle','--','LineWidth',3);

% Legendas
% Exemplo 1
legend('Eixo X', 'Eixo Y')

% Exemplo 2
legend([p1],'Eixo Y')

% Xlabel
xlabel('Frames')

% Ylabel
ylabel('Distância (m)')

% Title 
title('Eixo X e Y do jogador 1')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figura 2
f2 = figure(2);

freq = 30;

% Criando vetor tempo 
vtemp = ((0:size(x_p1,1)-1)/freq)./60';

p1 = plot(vtemp,x_p1,'r','LineStyle','-','LineWidth',2);
xlabel('Time(min)')
ylabel('Deslocamento (m)')
title('Deslocamento do jogador 1 no eixo X')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figura 3
f3 = figure(3);
p1 = plot(x_p1,y_p1,'r','LineStyle','-','LineWidth',2);
xlabel('Deslocamento no eixo (X)')
ylabel('Deslocamento no eixo (Y)')
title('Deslocamento do atleta no campo')
ylim([0 70])
xlim([0 110])









