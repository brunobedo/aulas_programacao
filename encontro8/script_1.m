% Encontro 8
% Professor: Bruno Bedo, PhD
% Objetivo da aula: Cinemática tridimensional
% Objetivo do meu script:
%     1. 3D kinematics 
%%%%%%%%%%%%%%%%%%%% Início %%%%%%%%%%%%%%%%%%%%
% Comandos de limpeza:
clc 
close all 
clear all 

% Sujeitos: 
sbj = linspace(1,3,3); 

% Resultados.
if ~exist('results', 'dir')
       mkdir('results')
end

for subj = 1:size(sbj,2)
%   File name
    file = ['data/trial_0',num2str(subj),'.xls'];

%   Raw data
    T = readtable(file); 
    raw_data = table2array(T);
    raw_data = str2double(raw_data(2:end,:));
    
%   Time normalize
    dataNorm = timenormalize(raw_data,1,size(raw_data,1),100);
    
%   Criando uma estrutura
%   Left side
    data.left.ankle.x(:,subj) = dataNorm(:,2); 
    data.left.ankle.y(:,subj) = dataNorm(:,3);
    data.left.ankle.z(:,subj) = dataNorm(:,4);
    
    data.right.ankle.x(:,subj) = dataNorm(:,5); 
    data.right.ankle.y(:,subj) = dataNorm(:,6);
    data.right.ankle.z(:,subj) = dataNorm(:,7);
    
%   knee
    data.left.knee.x(:,subj) = dataNorm(:,8); 
    data.left.knee.y(:,subj) = dataNorm(:,9);
    data.left.knee.z(:,subj) = dataNorm(:,10);
    
    data.rightknee.x(:,subj) = dataNorm(:,11); 
    data.rightknee.y(:,subj) = dataNorm(:,12);
    data.rightknee.z(:,subj) = dataNorm(:,13);    
    
%   Hip
    data.left.hip.x(:,subj) = dataNorm(:,14); 
    data.left.hip.y(:,subj) = dataNorm(:,15);
    data.left.hip.z(:,subj) = dataNorm(:,16);
    
    data.right.hip.x(:,subj) = dataNorm(:,17); 
    data.right.hip.y(:,subj) = dataNorm(:,18);
    data.right.hip.z(:,subj) = dataNorm(:,19);    
    
end

% Left Side
f1 = figure(1); set(f1, 'units','normalized','outerposition',[0 0 1 1]); 
f1sb1 = subplot(3,3,1);  plot(data.left.ankle.x); title('Left Ankle'); ylabel('Angle (º) - Sagittal')
f1sb2 = subplot(3,3,2);  plot(data.left.knee.x); title('Left Knee')
f1sb3 = subplot(3,3,3);  plot(data.left.hip.x); title('Left Hip'); legend('Trial 1', 'Trial 2', 'Trial 3')

f1sb4 = subplot(3,3,4);  plot(data.left.ankle.y); ylabel('Angle (º) - Frontal')
f1sb5 = subplot(3,3,5);  plot(data.left.knee.y)
f1sb6 = subplot(3,3,6);  plot(data.left.hip.y)

f1sb7 = subplot(3,3,7);  plot(data.left.ankle.z); xlabel('Cycle (0-100%)'); ylabel('Angle (º) - Transversal')
f1sb8 = subplot(3,3,8);  plot(data.left.knee.z); xlabel('Cycle (0-100%)')
f1sb9 = subplot(3,3,9);  plot(data.left.hip.z); xlabel('Cycle (0-100%)')


% Right side
f2 = figure(2); set(f2, 'units','normalized','outerposition',[0 0 1 1]); 
f2sb1 = subplot(3,3,1);  plot(data.left.ankle.x); title('Right Ankle'); ylabel('Angle (º) - Sagittal')
f2sb2 = subplot(3,3,2);  plot(data.left.knee.x); title('Right Knee')
f2sb3 = subplot(3,3,3);  plot(data.left.hip.x); title('Right Hip'); legend('Trial 1', 'Trial 2', 'Trial 3')
f2sb4 = subplot(3,3,4);  plot(data.left.ankle.y); ylabel('Angle (º) - Frontal')
f2sb5 = subplot(3,3,5);  plot(data.left.knee.y)
f2sb6 = subplot(3,3,6);  plot(data.left.hip.y)

f2sb7 = subplot(3,3,7);  plot(data.left.ankle.z); xlabel('Cycle (0-100%)'); ylabel('Angle (º) - Transversal')
f2sb8 = subplot(3,3,8);  plot(data.left.knee.z); xlabel('Cycle (0-100%)')
f2sb9 = subplot(3,3,9);  plot(data.left.hip.z); xlabel('Cycle (0-100%)')


saveas( f1 , 'results/LeftAngleResults.jpg' )
saveas( f2 , 'results/RightAngleResults.jpg' )

close all
clear all 
clc

disp('All figures have been saved')
disp('Thanks :)')




