pkg load io
databaseimc = xlsread('database_imc.xlsx'); 

% Rodando sujeito por sujeito
[nlinhas, ncolunas] = size(databaseimc);

for i = 1:nlinhas
    
    
    % ID
    id = databaseimc(i,1); 
    
    % Idade
    idade = databaseimc(i,2); 
    
    % Estatura (cm)
    estatura_cm = databaseimc(i,3); 
    
    % Estatura (m)
    estatura_m = databaseimc(i,4); 

    % Massa 
    massa = databaseimc(i,5); 
   
    % Calculando IMC
    [imc,class] = funcao_imc(massa,estatura_m);
    
    disp('---------')
    disp(['Participante: ',num2str(id)])
    disp(['O participante, id: ', num2str(id),' possui massa e estatura de ', num2str(massa) 'kg e ',...
        num2str(estatura_m),'m, respectivamente.'])  
    disp(['O imc do participante é de ',num2str(imc),' e a sua atual classificação é ',class])
    disp(' ')
    
    databaseimc(i,7) = imc;
    %databaseimc(i,8) = table({class});
    
end

##databaseimc.Properties.VariableNames([7]) = {'IMC'};
##databaseimc.Properties.VariableNames([8]) = {'Classificacao'};