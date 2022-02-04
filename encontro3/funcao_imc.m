function [imc_participante,classificacao] = funcao_imc(massa,estatura)
%Essa função calcula o IMC 
% Refências
% WORLD HEALTH ORGANIZATION. Obesity: preventing and managing the global epidemic. Report of a World Health Organization Consultation. Geneva: World Health Organization, 2000. 253 p. (WHO Obesity Technical Report Series, n. 894).
% Disponível em: http://www.who.int/nutrition/publications/obesity/WHO_TRS_894/en/ Acesso em 2014
% 
% LIPSCHITZ, D.A. Screening for Nutritional Status in the Elderly. Primary Care, [S. l.], v. 21, n. 1, p. 55-67, mar.1994. (Indexed for MEDLINE)
% Disponível em: http://www.ncbi.nlm.nih.gov/pubmed/8197257 Acesso em 2014
% Essa função calcula o IMC 
% Author: Bruno Bedo


imc_participante = massa/(estatura^2);

%% Opção 1
% if imc_participante <= 14
%     classificacao = '< 14 - Muito abaixo do peso';
% end
% 
% if imc_participante > 14 
%     if imc_participante <18.99
%         classificacao = '14.01 - 18.99 - Abaixo do peso';
%     end 
% end
% 
% if imc_participante > 18.99
%    if imc_participante < 24.99
%         classificacao = '18.99 - 24.99 Peso normal';
%    end
% end
% 
% if imc_participante > 25
%     if imc_participante < 29.99
%         classificacao = '25 - 29.99  Acima do peso';
%     end
% end
% 
% if imc_participante > 30
%     if imc_participante < 34.99
%         classificacao = '30 - 34.99  Acima do peso';
% %         disp (['Classificação = ',classificacao])    
%     end
% end
% 
% if imc_participante > 35
%     if imc_participante < 39.99
%         classificacao = '35 - 39.99  Acima do peso';
%         disp (['Classificação = ',classificacao])    
%     end
% end
% 
% if imc_participante > 40
%        classificacao = '>40  Muito acima do peso';
% end
% 
% disp(classificacao)
 

%% Opção 2 (prefiro)
if imc_participante <= 14
    classificacao = '< 14 - Muito abaixo do peso';
    
    elseif imc_participante > 14 && imc_participante < 18.99
            classificacao = '14.01 - 18.99 - Abaixo do peso';

    elseif imc_participante > 18.99 && imc_participante < 24.99
            classificacao = '18.99 - 24.99 Peso normal';

    elseif imc_participante > 25 && imc_participante < 29.99
            classificacao = '25 - 29.99  Acima do peso';

    elseif imc_participante > 30 && imc_participante < 34.99
            classificacao = '30 - 34.99  Acima do peso';

    elseif imc_participante > 35 && imc_participante < 39.99
            classificacao = '35 - 39.99  Acima do peso';

    elseif imc_participante >= 40
           classificacao = '>40  Muito acima do peso';
end
    
end


% && - "E"
% || - "Ou"

