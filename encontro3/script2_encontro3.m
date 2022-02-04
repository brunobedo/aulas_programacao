% Encontro 3
% Script 2
% Professor: Bruno Bedo
% Objetivo da aula: Controladores de fluxo (Estruturas condicionais)

% % %  Limpeza 
close all; clear all; clc 

% Carregar base de dados 
load('databaseimc.mat')


% Rodando sujeito por sujeito
[nlinhas, ncolunas] = size(databaseimc);

for i = 1:nlinhas
    
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
    [imc,class] = funcao_imc(massa,estatura_m);
    
    disp('---------')
    disp(['Participante: ',nome])
    disp(['O participante ', nome,' possui massa e estatura de ', num2str(massa) 'kg e ',...
        num2str(estatura_m),'m, respectivamente.'])  
    disp(['O imc do participante é de ',num2str(imc),' e a sua atual classificação é ',class])
    disp(' ')
    
    databaseimc(i,7) = table(imc);
    databaseimc(i,8) = table({class});
    
end

databaseimc.Properties.VariableNames([7]) = {'IMC'};
databaseimc.Properties.VariableNames([8]) = {'Classificacao'};