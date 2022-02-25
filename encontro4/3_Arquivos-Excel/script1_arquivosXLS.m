%  Encontro 4 
%  Script 1 - Carregando arquivos .csv - Parte 1
close all; clear all; clc 

%% Código do matlab (Warning)
data_matrix = xlsread('database_imc.xlsx'); 


%% Código 2 do matlab (sugestão) 
data_table = readtable('database_imc.xlsx'); 


%% Código 3 função: 
data_funcao = importfile_imctable('database_imc.xlsx');


%% Código 4 import data
data_import = importdata('database_imc.xlsx');






















