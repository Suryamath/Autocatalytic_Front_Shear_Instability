%-----------------------------------------------------------------------
% to plot I_max as a function of h & Re
%-------------------------------------------------------------------------
close all;
clear all;
clc;

load("Re_vec.mat");
load("I_max_vec.mat");


hv=[0.1 0.2 0.3 0.4 0.5];

for i=1:size(hv,2)
labels{i}={sprintf('$h=%1.1f$', hv(1,i))};
end

for k=1:size(hv,2)
plot1(k)=plot(Rev,imax(k,:),'LineWidth',2,'Marker','none',MarkerIndices=1:6:length(Rev));
hold on
end

set(plot1(5),...
    'DisplayName','$h=0.5$','LineWidth',2,...
    'Color',[0.470588235294118 0.811764705882353 0.0235294117647059]);
set(plot1(1),'DisplayName','$h=0.1$','Marker','*','LineStyle','-.',...
    'Color',[0.0745098039215686 0.623529411764706 1]);
set(plot1(2),'DisplayName','$h=0.2$',...
    'Color',[0.00784313725490196 0.207843137254902 0.341176470588235]);
set(plot1(3),'DisplayName','$h=0.3$','Marker','o',...
    'Color',[0.988235294117647 0.435294117647059 0.196078431372549]);
set(plot1(4),'DisplayName','$h=0.4$','LineStyle','--',...
    'Color',[0.670588235294118 0.149019607843137 0.149019607843137]);
box(gca,'on');
grid(gca,'on');
hold(gca,'on');

% Set the remaining axes properties
set(gca,'FontSize',12,'FontWeight','bold','TitleFontWeight','normal');
ylabel('$I_{max}$','FontWeight','bold','FontSize',24,'Interpreter','latex');
xlabel('$Re$','FontWeight','bold','FontSize',24,'Interpreter','latex');

% legend 
legend1 = legend(string(labels));
set(legend1,...
   'Position',[0.413546476914288 0.573340221210623 0.22367419461962 0.332594227632239],...
    'Interpreter','latex',...
    'FontSize',18);
legend("off")

set(gcf,'GraphicsSmoothing','on')
set(gcf,'Units','centimeters')
pos=get(gcf,'Position');
npos = pos +[0 0 0 1];
set(gcf,'Position',npos);

exportgraphics(gcf,'fig11b.jpg','Resolution',600);