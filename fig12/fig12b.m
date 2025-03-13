%-----------------------------------------------------------------------
% Dispersion curves for different Pe
%-------------------------------------------------------------------------

close all;
clear all;
clc;

par=5;

load("sigma_difPe.mat");
load("wavenumber.mat");

rv=[1000 2000 5000 10000 15000];

figure;

for j=par:-1:1
 plot1(j)= plot(alpha_vec,sigma_vec(j,:),'Linestyle','-','Linewidth',1,'MarkerIndices',1:4:length(alpha_vec));
 set(plot1(j),'DisplayName',sprintf('$Pe=%d$',rv(j)))
 hold on
end

legend('Interpreter','Latex','Location','best','FontSize',18,'AutoUpdate','off')
plot(alpha_vec,zeros(1,length(alpha_vec)),'Linestyle',':','Linewidth',1,'Color',[0 0 1]);
set(plot1(1),'Marker','*',...
    'Color',[0.96078431372549 0.443137254901961 0.384313725490196]);
set(plot1(2),'LineStyle','--',...
    'Color',[0.96078431372549 0.113725490196078 0.0196078431372549]);
set(plot1(3),...
    'Color',[0.709803921568627 0.0784313725490196 0.00784313725490196]);
set(plot1(4),'Marker','o','LineStyle','--',...
    'Color',[0.501960784313725 0.0588235294117647 0.0117647058823529]);
set(plot1(5),'MarkerFaceColor',[0 0 1],...
    'LineStyle','-.',...
    'Color',[0.270588235294118 0.0313725490196078 0.00392156862745098]);
set(gca,'FontSize',14);

% Create ylabel
ylabel({'$\sigma$',''},'FontSize',24,'Interpreter','latex','Rotation',0)

% Create xlabel
xlabel('$\alpha$','FontSize',24,'Interpreter','latex');
set(gca, 'Position', get(gca, 'Position') + [0, 0, -0.05, 0]);

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

% set x and y axes limits
xlim([0 20])
ylim([-0.4 0.6])
set(gcf,'GraphicsSmoothing','on')

exportgraphics(gcf,'fig12b.jpg','Resolution',600)