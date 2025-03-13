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
load("t=20.mat"); %change time here

% % set figure and plot
set(gcf,'Units','normalized')
h=figure(1)
pos=get(h,'Position');
npos = pos +[-8 -5 0 0];
set(h,'Position',npos);
Re=[250 500 1000 2000 2500];

for i=1:5
        Reynolds=Re(i); %panels for Reynolds number
        h1=subplot(5,1,i);
        pos1=get(h1,'Position');
        new_pos1 = pos1 +[0 0 -0.35 0.04];
        set(h1, 'Position',new_pos1);
        imagesc(x,y,conc{i}(:,:));

    annotation('textbox',...
    new_pos1,...
    'Color',[0 0 0],...
    'String',{sprintf('$Re=%d$',Reynolds)},...
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
c.Location='southoutside';
c.Position=[0.164912280701754 0.0674253432503593 0.356140350877193 0.0257142854824899];
c.Limits = [0, 1];
c.FontSize=10;

colormap("sky");
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperSize',[13 15.6]);
set(gcf,'PaperPosition',[-1.5 -0.6 15 18]);

% % save figure
exportgraphics(h,'t=20.jpg','Resolution',600);
