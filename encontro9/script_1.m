% Encontro 9
% Professor: Bruno Bedo, PhD
% Objetivo do meu script:
%     1. Create message dialog box 
%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Example 1 
% f1 = msgbox('Todos os dados foram processados com sucesso!','Carregando arquivo');


% Example  2
% f = msgbox("Erro ao processar os dados, tente novamente.","Error","error");



% Example 3 
sbj = linspace(1,3,3); 

for subj = 1:size(sbj,2)
%   File name
    file = ['data/trial_0',num2str(subj),'.xls'];

%   Raw data
    T = readtable(file); 
    raw_data = table2array(T);
    raw_data = str2double(raw_data(2:end,:));
    
%   Time normalize
    dataNorm = timenormalize(raw_data,1,size(raw_data,1),100);
    
%   Criando uma estrutura
%   Ankle
    data.right.ankle.x(:,subj) = dataNorm(:,5); 
    data.right.ankle.y(:,subj) = dataNorm(:,6);
    data.right.ankle.z(:,subj) = dataNorm(:,7);
    
%   knee
    data.right.knee.x(:,subj) = dataNorm(:,11); 
    data.right.knee.y(:,subj) = dataNorm(:,12);
    data.right.knee.z(:,subj) = dataNorm(:,13);    
    
%   Hip   
    data.right.hip.x(:,subj) = dataNorm(:,17); 
    data.right.hip.y(:,subj) = dataNorm(:,18);
    data.right.hip.z(:,subj) = dataNorm(:,19);    
    
end
f1 = msgbox('Todos os dados foram carregados com sucesso!','Carregando arquivo');
