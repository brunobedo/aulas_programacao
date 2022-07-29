% Encontro 9
% Professor: Bruno Bedo, PhD
% Objetivo do meu script:
%     1. Create question dialog box
%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Example 1 
esporte = questdlg('Qual é seu esporte favorito?','Esporte',...
                   'Futebol','Handebol','Nenhum','Nenhum');
               

% Handle response
switch esporte
    case 'Futebol'
        disp([esporte ,' é a sua modalidade favorita'])
        
    case 'Handebol' 
        disp([esporte ,' é a sua modalidade favorita'])
        
    case 'Nenhum' 
        disp('A pessoa não tem esporte favorito.')   
end