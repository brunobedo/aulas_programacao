% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Plotar o deslocamento dos atletas no campo de modo automático

%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('data2d-Exemplo.mat');

% Frequencia de aquisição
freq = 30; 

% Plotando todos os atletas
for i = 1:size(data_x,2)
%   Criando figura 
    f = figure(i);
    
%   Dados
    xdata = data_x(:,i);
    ydata = data_y(:,i);
    
%   Criando vetor tempo
    vtemp = ((0:size(xdata,1)-1)/freq)./60';
    
    
%   Plot
    campo_grande()
    hold on
    p = plot(xdata,ydata,'k','LineStyle',':','LineWidth',2); 
    xlabel('Time (min)')
    xlabel('Comprimento')
    ylabel('Largura')
    title(['Deslocamento do atleta ',num2str(i)])
    legend(p,'Deslocamento do atletas no campo')
end