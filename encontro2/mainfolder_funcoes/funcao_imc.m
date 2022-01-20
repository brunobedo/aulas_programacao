function [imc_participante] = funcao_imc(massa,estatura)
%Essa função calcula o IMC 
%   Author: Bruno Bedo
    imc_participante = massa/(estatura^2);
end

