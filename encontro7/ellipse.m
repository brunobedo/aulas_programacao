function [area,axes,angles,ellip]=ellipse(x,y,show,p)
% ELLIPSE calculates an ellipse that fits the data using principal component analysis
% [area,axes,angles,ellip]=ellipse(x,y,'show',p)
% X and Y are vectors with same length
% SHOW is an optional parameter to plot the data and the ellipse.
% P is an optional parameter to set the desired confidence area of the
%  ellipse. E.g., for p=.95 (default value), 95% of the data will lie
%  inside the ellipse. Use p=.8535 if you want semi-axes of the ellipse with a
%  length of 1.96 standard deviations (95% confidence interval in each axis).
% The outputs are the area of the ellipse (p*100% of the samples lie inside of
%  the ellipse), the axis lengths (major axis first), the respective angles (in rad),  
%  and the ellipse data.

% Marcos Duarte mduarte@usp.br 1999-2003

if exist('p') & ~isempty(p) & p~=.95
    if exist('raylinv.m')==2
        %The problem here is to find the probability p of having data with the distance
        % given by sqrt(x.^2+y.^2), wich has a Rayleigh distribution, less than a
        % certain value (the boundary of the ellipse).
        invp = raylinv(p,2)/2; %Inverse of the Rayleigh cumulative distribution function.
    else
        warning('Statistics toolbox not available. Using the default value p=.95')
        p = .95; invp = 4.8955/2;
    end
else
    p = .95; invp = 4.8955/2;
    %p = .8535; invp = 1.96 % uncomment this line in case you don't have the stats toolbox and want this axis
end
V = cov(x,y);                           % covariance matrix

% 1st way:
[vec,val] = eig(V);                     % eigenvectors and eigenvalues of the covariance matrix
axes = invp*sqrt(svd(val));             % axes
angles = -atan2( vec(1,:),vec(2,:) );   % angles  
area = pi*prod(axes);                   % area

% 2nd way (in case you don't want to use EIG and SVD):
%axes(1)=(V(1,1)+V(2,2)+sqrt( (V(1,1)-V(2,2))^2+4*V(2,1)^2 ))/2;
%axes(2)=(V(1,1)+V(2,2)-sqrt( (V(1,1)-V(2,2))^2+4*V(2,1)^2 ))/2;
%angles=atan2( V(1,2),axes-V(2,2) );   % angles
%axes=invp*sqrt(axes);                 % axes
%area=pi*prod(axes);                   % area
%vec=[cos(angles(1)) -sin(angles(1)); sin(angles(1)) cos(angles(1))];
%val=([axes(1) 0; 0 axes(2)]/1.96).^2;

% ellipse data:
t = linspace(0,2*pi);
ellip = vec*invp*sqrt(val)*[cos(t); sin(t)] + repmat([mean(x);mean(y)],1,100);
ellip = ellip';
axes  = axes';

% plot:
if exist('show') & ~isempty(show)
   p2=polyfit(x,y,1);
   fit=polyval(p2,[min(x) max(x)]);
  m = [mean(x) mean(x); mean(y) mean(y)];
  ax = [cos(angles); sin(angles)].*[axes; axes] + m;
  set(gca,'box','on')
  plot(x,y,'b-',x(1),y(1),'^k',x(end),y(end),'vm');hold on
  plot(ellip(:,1),ellip(:,2),'r','linewidth',2)
  plot([ax(1,:); 2*m(1,:)-ax(1,:)],[ax(2,:); 2*m(2,:)-ax(2,:)],'r--','linewidth',2)
  %plot([min(x) max(x)],fit,'k','linewidth',2)
  axis image
  axis([min(x) max(x) min(y) max(y)])
  hold off
   %legend('Data','Linear regression','Ellipse & axes',0)
  xlabel('ML Direction (mm)')
  ylabel('AP Direction (mm)')
  title([num2str(p*100) '% CONFIDENCE ELLIPSE (area = ' num2str(area) 'cm^2, angle = ' num2str(round(angles(1)*180/pi*10)/10) '^o)'])
end

