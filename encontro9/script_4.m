% Encontro 9
% Professor: Bruno Bedo, PhD
% Objetivo do meu script:
%     1. Create list selection dialog box
%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% % Exemplo 1
% list = {'Red','Yellow','Blue',...                   
% 'Green','Orange','Purple'};
% [indx,tf] = listdlg('ListString',list)


% Example 2 
d = dir('data'); 
file_name = {d.name};
[indx, tf] = listdlg('ListString',file_name(3:end));

