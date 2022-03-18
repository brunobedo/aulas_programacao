% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Criar um gráfico para cada jogador de modo automático
%     2. Inserir informações em um gráfico

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
    p(i) = plot(xdata,ydata,'k','LineStyle',':','LineWidth',2); 
    xlabel('Time (min)')
    xlabel('Deslocamento no eixo (X)')
    ylabel('Deslocamento no eixo (Y)')
    title(['Deslocamento do atleta ',num2str(i),' no campo'])
end