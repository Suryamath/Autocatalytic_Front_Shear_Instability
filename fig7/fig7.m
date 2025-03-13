%-----------------------------------------------------------------------
% interfacial length for different h
%-------------------------------------------------------------------------

close all;
clear all;
clc;

load("Interfacial_length.mat"); %load interfacial length
load("t.mat");                  %load time vector

hv=[0.1 0.2 0.3 0.4 0.5];

for i=1:size(hv,2)
labels{i}={sprintf('$h=%1.1f$', hv(1,i))};
end

figure(1)
for j=1:5                     
plot1(j)= plot(time,IC{j}(:),'LineWidth',2,'Marker','none','MarkerIndices',1:20:length(IC{j}(:)));         
hold all
end

set(plot1(1),'DisplayName','$h=0.1$','Marker','*','LineStyle','-.',...
    'Color',[0.0745098039215686 0.623529411764706 1]);
set(plot1(2),'DisplayName','$h=0.2$',...
    'Color',[0.00784313725490196 0.207843137254902 0.341176470588235]);
set(plot1(3),'DisplayName','$h=0.3$','Marker','o',...
    'Color',[0.988235294117647 0.435294117647059 0.196078431372549]);
set(plot1(4),'DisplayName','$h=0.4$','LineStyle','--',...
    'Color',[0.670588235294118 0.149019607843137 0.149019607843137]);
set(plot1(5),...
    'MarkerSize',6,...
    'DisplayName','$h=0.5$','LineWidth',2,...
    'Color',[0.470588235294118 0.811764705882353 0.0235294117647059]);
box(gca,'on');
grid(gca,'on');
hold(gca,'on');

% Set the remaining axes properties
set(gca,'FontSize',15,'FontWeight','bold','TitleFontWeight','normal');
ylabel('$I(t)$','FontWeight','bold','FontSize',28,'Interpreter','latex');
xlabel('$t$','FontWeight','bold','FontSize',28,'Interpreter','latex');

% Create legend
legend1 = legend(string(labels));
set(legend1,...
    'Position',[0.653654649048793 0.575881880155411 0.227668376666398 0.327510909742664],...
    'Interpreter','latex',...
    'FontSize',22);
set(gcf,'GraphicsSmoothing','on')
set(gcf,'Units','centimeters')
pos=get(gcf,'Position');
npos = pos +[0 0 0 1];
set(gcf,'Position',npos);

exportgraphics(gcf,'fig7.jpg','Resolution',600);