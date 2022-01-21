% Script 1 - Aula 1 

% Objetivo
% Apresentar o nome do participante na janela 

% % % % %  Inicio 
clear all; close all; clc

nome = input('Digite o nome do participante?: ');


idade = input('Qual a idade?: '); 

massa = input('Qual a  massa do participante?: '); 
disp(' ')

disp(['O nome do participante é ', nome, ...
      ' ele(a) tem ',num2str(idade), ' anos e pesa ', num2str(massa),...
      ' kg'])
disp(' ')

% % % % %  Fim 
