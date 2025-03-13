%-----------------------------------------------------------------------
% To plot concentration c profile
%-------------------------------------------------------------------------

close all;
clear all;
clc;

% % create meshgrid
n=257;
l=513;
celx=l-1;
cely=n-1;
xl=4;
yl=1;
dx=xl/(celx);
dy=yl/(cely);
x=0+dx/2:dx:xl-dx/2;
y=0+dy/2:dy:yl-dy/2;
[X,Y]=meshgrid(x,y);

% % load data
load("Pe=50000_c.mat"); 

% % set figure and plot
set(gcf,'Units','normalized')
h=figure(1)
pos=get(h,'Position');
npos = pos +[-8 -5 0 0];
set(h,'Position',npos);
tp=[30 40 45 50];


for i=1:4
        time=tp(i); %time for panels
        h1=subplot(4,1,i);
        pos1=get(h1,'Position');
        new_pos1 = pos1 +[0 0 -0.35 0.04];
        set(h1, 'Position',new_pos1);
        imagesc(x,y,conc{i}(:,:));

    annotation('textbox',...
    new_pos1,...
    'Color',[0 0 0],...
    'String',{sprintf('$t=%d$',time)},...
    'Interpreter','latex',...
    'FontSize',15,...
    'EdgeColor','none');

axis xy

set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

end
c=colorbar;
c.Location='east';
c.FontSize=12;
c.Position=[0.564912280701756 0.170316301703163 0.0157894736842097 0.749391727493917];
c.Ticks=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
c.TickLabels={'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'};
c.Limits = [0 1];

colormap("sky");
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperSize',[13 15.6]);
set(gcf,'PaperPosition',[-1.5 -0.6 15 18]);

% % save figure
exportgraphics(h,'fig9c.jpg','Resolution',600);
