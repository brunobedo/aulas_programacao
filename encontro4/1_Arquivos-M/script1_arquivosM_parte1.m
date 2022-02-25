%  Encontro 4 
%  Script 1 - Carregando arquivos .m - Parte 1
close all; clear all; clc 

% Nome da tentativa
Imput = inputdlg({'Códico do participante','Tentativa'},'Escolha a tentativa');
Tentativa = ['Resultados_',Imput{1},'_',Imput{2}];

Name = [Imput{1},'_',Imput{2}]; 

% Carretando arquivos
load(Tentativa)

dado = results{6};

FMax = str2double(results{7});

FMax_PC = str2double(results{8});

FPRS = str2double(results{9});

FPRS_PC = str2double(results{10});












