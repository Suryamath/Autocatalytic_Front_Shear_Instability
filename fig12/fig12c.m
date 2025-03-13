%-----------------------------------------------------------------------
% Dispersion curves for different Re
%-------------------------------------------------------------------------
close all;
clear all;
clc;

par=5;

load("sigma_difRe.mat");
load("wavenumber.mat");

rv=[250 500 750 1000 1500];

figure;

for j=par:-1:1
 plot1(j)= plot(alpha_vec,sigma_vec(j,:),'Linestyle','-','Linewidth',1,'MarkerIndices',1:4:length(alpha_vec));
 set(plot1(j),'DisplayName',sprintf('$Re=%d$',rv(j)))
 hold on
end

legend('Interpreter','Latex','Location','best','FontSize',18,'AutoUpdate','off')
plot(alpha_vec,zeros(1,length(alpha_vec)),'Linestyle',':','Linewidth',1,'Color',[0 0 1]);
set(plot1(5),'Marker','*',...
    'Color',[0.576470588235294 1 0.0196078431372549]);
set(plot1(4),'LineStyle','--',...
    'Color',[0.415686274509804 0.729411764705882 0.00784313725490196]);
set(plot1(3),...
    'Color',[0.301960784313725 0.52156862745098 0.0156862745098039]);
set(plot1(2),'Marker','o','LineStyle','--',...
    'Color',[0.270588235294118 0.470588235294118 0.00784313725490196]);
set(plot1(1),'MarkerFaceColor',[0 0 1],...
    'LineStyle','-.',...
    'Color',[0.152941176470588 0.270588235294118 0.00392156862745098]);
set(gca,'FontSize',14);

% Create ylabel
ylabel({'$\sigma$',''},'FontSize',24,'Interpreter','latex','Rotation',0)

% Create xlabel
xlabel('$\alpha$','FontSize',24,'Interpreter','latex');

set(gca, 'Position', get(gca, 'Position') + [0, 0, -0.1, 0]);
box(gca,'on');
grid(gca,'off');
hold(gca,'off');

% legend
legend1 = legend(gca,'show');
set(legend1,...
    'Position',[0.567812369681605 0.631277472350911 0.228321887780518 0.28839183825108],...
    'Interpreter','latex',...
    'FontSize',13,...
    'EdgeColor','none','Color','none');

% set x axis limits 
xlim([0 20])

set(gcf,'GraphicsSmoothing','on')
exportgraphics(gcf,'fig12c.jpg','Resolution',600)