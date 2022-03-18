% Encontro 5 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Criação de gráficos
% Objetivo do meu script:
%     1. Carregar o meu banco de dados 
%     2. Elaborar gráficos de linhas e suas configurações

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

% Criando uma figura
f1 = figure(1);

% Plot dados do participante 1
% Eixo X
p1 = plot(x_p1); 
get(p1);
set(p1, 'marker', 'p')
set(p1, 'LineStyle', 'none')
set(p1, 'Color', 'r')

% O que é hold on?
hold on

% Eixo Y
p2 = plot(y_p1,'b','LineStyle','--');







