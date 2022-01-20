% Encontro 2 
% Professor: Bruno Bedo
% Objetivo da aula: Criar um script
% Objetivo do meu script:
%     1. Carregar o meu banco de dados 
%     2. Utilizar a função do IMC para calcular o IMC dos sujeitos

%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('databaseimc.mat');


% Calculando o IMC
for i = 1:size(databaseimc,1)
    
    % Nome
    nome = char(table2cell(databaseimc(i,1))); 
    
    % ID
    id = table2array(databaseimc(i,2)); 
    
    % Idade
    idade = table2array(databaseimc(i,3)); 
    
    % Estatura (cm)
    estatura_cm = table2array(databaseimc(i,4)); 
    
    % Estatura (m)
    estatura_m = table2array(databaseimc(i,5)); 

    % Massa 
    massa = table2array(databaseimc(i,6)); 
    
    % Calculando IMC
    imc = funcao_imc(massa,estatura_m);
    
    disp('---------')
    disp(['Participante: ',nome])
    disp(['O participante ', nome,' possui massa e estatura de ', num2str(massa) 'kg e ',...
        num2str(estatura_m),'m, respectivamente.'])
    disp(['Atualmente, o seu IMC é de ', num2str(imc),'.'])
    disp(' ')
    
    databaseimc(i,7) = table(imc);
end

databaseimc.Properties.VariableNames([7]) = {'IMC'};
%%%%%%%%%%%%%%%%%%%% FIM %%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%% Funcções %%%%%%%%%%%%%%%%%%%%

function [imc_participante] = funcao_imc(massa,estatura)
%Essa função calcula o IMC 
%   Author: Bruno Bedo
    imc_participante = massa/(estatura^2);
end

