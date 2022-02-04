% Encontro 3
% Script 1
% Professor: Bruno Bedo
% Objetivo da aula: Controladores de fluxo (Estruturas condicionais)

criador_codigo = 'Bruno';
nome = 'Bruno'; 
idade = 27; 

% Comparar valores integrais (números)
if idade >=18
    disp(' ')
    disp([nome, ' pode comprar uma cerveja.'])
    if idade >=30
        disp(' ')
        disp([nome,' nasceu em 1992 ou antes.'])
    else
        disp([nome,' nasceu depois de 1992.']) 
    end
end



% Comparar strings
% pergunta: O nome do criador do código é o mesmo que o meu?

if strcmp(criador_codigo,nome)
    disp(' ')
    disp('O meu nome é igual ao do criador do código')
else
    disp(' ')
    disp('O nome é diferente')
end

% a = 2; A recebe 2
% a == 2; A é igual a 2. 
% > 
% <
% >=
% <=

















