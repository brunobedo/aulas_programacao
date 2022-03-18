% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Plots dinâmicos

%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('data2d-Exemplo.mat');


% Criando figura 
f1 = figure(1);
campo_grande
hold on

% Número de linhas
num_linhas = size(data_x,1);

% Exemplo 1
for i = 1:num_linhas
    dx_lin = data_x(i,:); 
    dy_lin = data_y(i,:);
    
    mean_x = mean(dx_lin);
    mean_y = mean(dy_lin);
    
    p1f1 = plot(dx_lin,dy_lin,'bo','LineWidth',2,'MarkerSize',6);
    p2f1 = plot(mean_x,mean_y,'ro','LineWidth',2,'MarkerSize',6);
    title('Deslocamento dos atletas')
    
    legend([p2f1],'Posição média da equipe')
    
    pause(0.0000001)
    delete(p1f1)
    delete(p2f1)
end




% Exemplo 2
for i = 1:num_linhas
    dx_lin = data_x(i,:); 
    dy_lin = data_y(i,:);
    
    mean_x = mean(dx_lin);
    mean_y = mean(dy_lin);
    
%   Mostrar frames anteriores
    frames_anteriores = 60;

    p1f1 = plot(dx_lin,dy_lin,'bo','LineWidth',2,'MarkerSize',6);
    p2f1 = plot(mean_x,mean_y,'ro','LineWidth',2,'MarkerSize',6);
    title('Deslocamento dos atletas')

    if  i > frames_anteriores
        dx_ant = data_x(i-frames_anteriores:i,:); 
        dy_lin = data_y(i-frames_anteriores:i,:);
        p3f1 = plot(dx_ant,dy_lin,'k.','MarkerSize',0.2);

    end
    
    legend([p2f1],'Posição média da equipe')
    
    pause(0.000000000001)
    delete(p1f1)
    delete(p2f1)
    if  i > frames_anteriores
        delete(p2f1)
        delete(p1f1)
    else 
        delete(p1f1)
        delete(p2f1)
    end
end
