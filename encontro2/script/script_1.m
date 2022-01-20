% Encontro 2 
% Objetivo da aula: Criar um script
% Objetivo do meu script:
%     1. Carregar o meu banco de dados 
%     2. Selecionar apenas adultos
%     3. Calcular o IMC de cada participante
%     4. Criar uma função que calculo o IMC de cada um dos participantes



%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Carregar a minha base de dados 
load('databaseimc.mat');

% A minha base de dados tem: 
    % Col. 1 - ID do participante
    % Col. 2 - Nome do participante (NaN)
    % Col. 3 - Idade do participante 
    % Col. 4 - Estatura em cm do participante
    % Col. 5 - Estatura em m do participante
    % Col. 6 - Massa do participante (Kg)

    
% Selecionar apenas aquilo que realmente me interessa: 
% Col. 1 - Idade do participante 
% Col. 2 - Estatura em cm do participante
% Col. 3 - Estatura em m do participante
% Col. 4 - Massa do participante (Kg)
database = databaseimc(:,2:end);

% Converter a base de dados para uma matriz
mat_interesse = table2array(database);

col_id = mat_interesse(:,1); 
col_idade = mat_interesse(:,2); 
col_estatura_cm = mat_interesse(:,3); 
col_estatura_m = mat_interesse(:,4); 
col_massa = mat_interesse(:,5); 


% Realizar calculo do IMC 
% Jeito 1: 
 mat_interesse(:,6) = col_massa./ (col_estatura_m.*col_estatura_m);
 
% Jeito 2: 
 mat_interesse(:,7) = mat_interesse(:,5)./(mat_interesse(:,4).*mat_interesse(:,4));

% Jeito 3: 
 mat_interesse(:,8) = mat_interesse(:,5)./(mat_interesse(:,4).*mat_interesse(:,4));

% Jeito 4: 
 mat_interesse(:,9) = mat_interesse(:,5)./(mat_interesse(:,4).^2);

 
disp('IMC calculado!')
%%%%%%%%%%%%%%%%%%%%%% Fim %%%%%%%%%%%%%%%%%%%%%%
