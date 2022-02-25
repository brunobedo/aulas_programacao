%  Encontro 4 
%  Script 1 - Carregando arquivos .m - Parte 2

%% Como carregar todos arquivos de uma vez só? 

name = 'LYA'; 

% Tentativas
trials = {'007';'008';'009';'010'}; 


for i = 1:size(trials)
    trial = trials{i};
    name_trial = ['Resultados_',name,'_',trial];
    
    % Carregando arquivos
    load(name_trial)
    
    % Separando dados de interesse
    dado = results{6};
    
    % Organizando de acordo com a variável
    fx(:,i) = dado(:,2);
    fy(:,i) = dado(:,3);
    fz(:,i) = dado(:,4); 
    mx(:,i) = dado(:,5); 
    my(:,i) = dado(:,6); 
    mz(:,i) = dado(:,7); 
    
end
