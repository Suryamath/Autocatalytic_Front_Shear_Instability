%-----------------------------------------------------------------------
% Dispersion curves for different Da
%-------------------------------------------------------------------------
close all;
clear all;
clc;

par=5;

load("sigma_difDa.mat");
load("wavenumber.mat");

rv=[0.1 1 2 5 10];

figure;
for j=par:-1:1
 plot1(j)= plot(alpha_vec,sigma_vec(j,:),'Linestyle','-','Linewidth',1,'MarkerIndices',1:4:length(alpha_vec));
 set(plot1(j),'DisplayName',sprintf('$Da=%.1f$',rv(j)))
 hold on
end

legend('Interpreter','Latex','Location','best','FontSize',18,'AutoUpdate','off')

plot(alpha_vec,zeros(1,length(alpha_vec)),'Linestyle',':','Linewidth',1,'Color',[0 0 1]);
set(plot1(1),'MarkerSize',5,'Marker','*',...
    'Color',[1 0.933333333333333 0]);
set(plot1(2),'LineStyle','--','Color',[0.8 0.8 0]);
set(plot1(3),...
    'Color',[0.831372549019608 0.831372549019608 0.0745098039215686]);
set(plot1(4),'Marker','o','LineStyle','--',...
    'Color',[0.509803921568627 0.509803921568627 0.0470588235294118]);
set(plot1(5),'MarkerFaceColor',[0 0 1],...
    'LineStyle','-.',...
    'Color',[0.23921568627451 0.23921568627451 0.0196078431372549]);
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
   'Position',[0.627580392017675 0.633658424731864 0.230214414536949 0.28839183825108],...
    'Interpreter','latex',...
    'FontSize',13,...
    'EdgeColor','none','Color','none');

% set x axis limits
xlim([0 20])

set(gcf,'GraphicsSmoothing','on')
exportgraphics(gcf,'fig12a.jpg','Resolution',600)