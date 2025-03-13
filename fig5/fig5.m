%-----------------------------------------------------------------------
% Dispersion curves for different h
%-------------------------------------------------------------------------

close all;
clear all;
clc;

par=5;

load("sigma_difh.mat");
load("wavenumber.mat");

rv=[0.1 0.2 0.3 0.4 0.5];

figure;

for j=1:par
 plot1(j)= plot(alpha_vec,sigma_vec(j,:),'Linestyle','-','Linewidth',2,'MarkerIndices',1:4:length(alpha_vec));
 set(plot1(j),'DisplayName',sprintf('$h=%.1f$',rv(j)))
 hold on
end

legend('Interpreter','Latex','Location','best','FontSize',18,'AutoUpdate','off')
plot(alpha_vec,zeros(1,length(alpha_vec)),'Linestyle',':','Linewidth',1,'Color','r');
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
set(gca,'FontSize',15,'FontWeight','bold','TitleFontWeight','normal');
% Create ylabel
ylabel({'$\sigma$',''},'FontSize',28,'Interpreter','latex','Rotation',0)
% Create xlabel
xlabel('$\alpha$','FontSize',28,'Interpreter','latex');


box(gca,'on');
grid(gca,'off');
hold(gca,'off')

% legend
legend1 = legend(gca,'show');
set(legend1,...
    'Position',[0.662210812957637 0.542341839445255 0.242845803233467 0.39523808388483],...
    'Interpreter','latex',...
    'FontSize',20,...
    'EdgeColor','none','Color','none');

xlim([0 20])
set(gcf,'GraphicsSmoothing','on');
exportgraphics(gcf,'fig5.jpg','Resolution',600)