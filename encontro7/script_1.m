% Encontro 7 
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Controle postural
% Objetivo do meu script:
%     1. Carregar arquivo
%     2. Calcular o COP | Filtrar o dados 
%     3. Calcular o deslocamento total (DOT) do centro de pressão (COP)
%     4. Calcular o desvio padrão do deslocamento do COP
%     5. Calcular o RMS (‘Root Mean Square’) do COP
%     6. Calcular o Amplitude de deslocamento do COP (AP E ML)
%     7. Velocidade média (VM) do COP 
%     8. Velocidade média total (VM) do COP 
%     9. Área 
%     10. Salvar resultados

warning off
%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Sujeitos: 
sbj = linspace(1,3,3);

% Frequencia de aquisição
freq = 5000; 

for num_sbj = 1:size(sbj,2)
%   Nome do arquivo
    file = ['data_',num2str(num_sbj),'.mat'];
    disp(['Carregando dados do participante: ',file])
        
%   Carregando arquivo
    load(['data/',file]);
    forcdata = results{7}; 
    frames_tempo = 2 * freq; 
    forcdata = forcdata(frames_tempo:end-frames_tempo,:);

%   Dados 
    DatFx = forcdata(:,2);
    DatFy = forcdata(:,3);
    DatFz = forcdata(:,4);
    DatMx = forcdata(:,5);
    DatMy = forcdata(:,6);
    DatMz = forcdata(:,7);
    
%   Calculando o centro de pressão
    h = -0.005; % Distância entre o sensor e a plataforma (mm)
    DatCOP = zeros(size(forcdata,1),2);
    for j = 1:size(forcdata,1)
        DatCOP(j,1) = ((h*DatFx(j))-DatMy(j))/DatFz(j);
        DatCOP(j,2) = ((h*DatFy(j))+DatMx(j))/DatFz(j);
    end  
    
%   Detrending COP data
    DatCOPx_d = detrend(DatCOP(:,1)); 
    DatCOPy_d = detrend(DatCOP(:,2));
    DatCOP_d = [DatCOPx_d DatCOPy_d];

%   Filtrando os dados
    n = 4; 
    Wn=5/(freq/2); %cut-off = 5 Hz
    [b,a]=butter(n,Wn);			    
    dataF = filtfilt(b,a,DatCOP_d);
    
%   Convertendo para mm
    
    DatCOPx_f = dataF(:,1).*1000;
    DatCOPy_f = dataF(:,2).*1000;
    
%   Criando figura com frames do eixo X    
    figure(1);clf
    plot(DatCOPx_f,'r'); 
    hold on 
    plot(DatCOPy_f,'k'); 
    legend('Eixo X','Eixo Y')
    title('Centro de Pressão anteroposterior (AP) e mediolateral (ML)')
    hold off
    
% --- COP variables - Duarte & Freitas 2010 ---%
%   Deslocamneto do COP (DCOP)
    DCOP = sum(sqrt(DatCOPy_f.^2+DatCOPx_f.^2));  
    
%   Desvio padrão (SPCOP)
    SDCOPap = std(DatCOPy_f);
	SDCOPml = std(DatCOPx_f);    
    
%   Root Mean Square (RMS)
    RMSCOPap = sqrt(sum(DatCOPy_f.^2)/length(DatCOPy_f));
    RMSCOPml = sqrt(sum(DatCOPx_f.^2)/length(DatCOPx_f));   

%   Amplitude de deslocamento do COP
    ADCOPap = max(DatCOPy_f) - min(DatCOPy_f);
    ADCOPml = max(DatCOPx_f) - min(DatCOPx_f);
    
%   Velocidade média (VMCOP)
    VMCOPap = sum(abs(diff(DatCOPy_f)))*freq/length(DatCOPy_f);
    VMCOPml = sum(abs(diff(DatCOPx_f)))*freq/length(DatCOPx_f);
    
%   Área total (ATCOP)
    [~,val] = eig(cov(DatCOPy_f,DatCOPx_f)); 
    ATCOP = pi*prod(2.4478*sqrt(svd(val)));

%   Velocidade média total (VMTCOP)
    VMTCOP = sum(sqrt(diff(DatCOPy_f).^2+diff(DatCOPx_f).^2))*freq/length(DatCOPy_f);

%   Calculando Area
    f2 = figure(2);clf
    [area,axes,angles,ellip] = ellipse(DatCOPx_f,DatCOPy_f, 'show'); %colocar 'show' para apresentar.
    saveas(f2,['results/Figure',file(1:end-4),'.png'])
   
%   Organizar os resultados para serem salvos
    Res_COP(num_sbj,:) = [DCOP SDCOPap SDCOPml RMSCOPap RMSCOPml ADCOPap ADCOPml VMCOPap VMCOPml ATCOP VMTCOP];
end

disp('Salvando resultados') 

% Salvando resultados em excel. 
restitle = ['results/AnalisePostural.xlsx'];

subj = {'Subj1','Subj2','Subj3'}'; 

vars = {'Deslocamneto do COP (mm)', 'Desvio padrão_AP(mm)', 'Desvio padrão_ML(mm)', 'RMS_AP(mm)', 'RMS_ML(mm)', ...
        'Amplitude_AP(mm)', 'Amplitude_ML(mm)', 'Velocidade_AP(mm/s)', 'Velocidade_ML(mm/s)', ...
        'Area (mm^2)', 'Velocidade Media Total (mm/s)'};
xlswrite(restitle,subj,1,'A2')
xlswrite(restitle,vars,1,'B1')
xlswrite(restitle,Res_COP,1,'B2')

close all 
clear all 
disp('Done :)')
disp('----------------------')


















