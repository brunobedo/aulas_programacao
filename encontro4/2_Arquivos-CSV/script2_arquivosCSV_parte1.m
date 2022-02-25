%  Encontro 4 
%  Script 1 - Carregando arquivos .csv - Parte 1
close all; clear all; clc 


%% Opção 1: Funciona mas não é sugerida.
% - Usar readcsv (muitos erros e bugs): 
%   https://www.mathworks.com/help/matlab/ref/csvread.html#d123e261166


%% Opção 2: use o read matrix
%   https://www.mathworks.com/help/matlab/ref/readmatrix.html

data_cinematica_bruno = readmatrix('CINEMATICA_BRUNO.csv'); 

data_acelVert = readmatrix('acelVert.csv'); 

data_desloVert = readmatrix('desloVert.csv'); 

data_posiVert = readmatrix('posiVert.csv'); 

data_velo = readmatrix('Velo.csv'); 












