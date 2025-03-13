%-----------------------------------------------------------------------
% To plot base concetration
%-------------------------------------------------------------------------
close all;
clear all;
clc;

figure;

for k=1:6
    load(sprintf('Base_h0.2_Sc1_Re1000_Da50_t_f=%.1f.mat',(k-1)*2500*0.0002));
plot1(k)=plot(Base_data.y,Base_data.c,DisplayName=sprintf('$t_{f}=%.1f$',(k-1)*2500*0.0002), ...
        LineWidth=2);
hold on
end

legend(Interpreter="latex")

set(plot1(1),...
    'Color',[0.745098039215686 0.882352941176471 0.968627450980392]);
set(plot1(2),...
    'Color',[0.00784313725490196 0.607843137254902 0.980392156862745]);
set(plot1(3),...
    'Color',[0 0.431372549019608 0.701960784313725]);
set(plot1(4),...
    'Color',[0.00392156862745098 0.32156862745098 0.52156862745098]);
set(plot1(5),...
    'Color',[0.00392156862745098 0.2 0.32156862745098]);
set(plot1(6),...
    'Color',[0 0.0196078431372549 0.0313725490196078]);


xlim([0 1]);
view(gca,[270 270]);
box(gca,'on');
set(gca,'FontSize',12,'FontWeight','bold','XDir','reverse','YDir','reverse');

% Create ylabel
ylabel({'$\bar{c}$'},'FontWeight','bold','FontSize',24,'Interpreter','latex');

% Create xlabel
xlabel({'$y$'},'FontWeight','bold','FontSize',24,'Interpreter','latex');

%Create legend
legend1 = legend(gca,'show');
set(legend1,...
    'Position',[0.157668226789943 0.765714487053622 0.702981795360142 0.150363192893114],...
    'NumColumns',3,...
    'Interpreter','latex',...
    'FontSize',18,...
    'EdgeColor','none',...
    'Color','none');

exportgraphics(gcf,'fig3a.jpg','Resolution',600)