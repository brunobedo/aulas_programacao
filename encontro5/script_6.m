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

% Criando figura 
f1 = figure(1);

% Número de atletas
num_atletas = size(data_x,2);


for i = 1:num_atletas   
%   Dados
    xdata = data_x(:,i);
    ydata = data_y(:,i);
    
    p = subplot(7,2,i);
    plot(vtemp,xdata,'b')
    title(['Deslocamento do atletas ',num2str(i),' no eixo X'])
    xlabel('Time (min)')
    ylabel('Metros')
    
end

