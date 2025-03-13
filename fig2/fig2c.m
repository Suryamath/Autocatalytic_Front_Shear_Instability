%-----------------------------------------------------------------------
% To plot exact vs Numerical base state concentration
%-------------------------------------------------------------------------

close all;
clear all;
clc;

load("y.mat")                      % load y vector
load("Numerical_Solution.mat")     % load Numerical Solution

Da=50;
Pe=1000;
tf=1;
h=0.2;
slope = sqrt((Da * Pe) / 2);
speed = sqrt(Da / (2 * Pe));
arg = yreal - h - speed * tf;

c_exact = 0.5 + 0.5*tanh(-0.5 * slope * arg);

figure;

plot1(1)=plot(yreal,c,DisplayName='Numerical', ...
        LineWidth=2);
hold on

plot1(2)= plot(yreal,c_exact,DisplayName='Exact',LineStyle='--',...
        LineWidth=2);


legend(Interpreter="latex");

set(plot1(1),...
    'Color',[0.745098039215686 0.882352941176471 0.968627450980392]);
set(plot1(2),...
    'Color',[0.00784313725490196 0.607843137254902 0.980392156862745]);


xlim([0 1]);
view(gca,[270 270]);
box(gca,'on');
set(gca,'FontSize',12,'FontWeight','bold','XDir','reverse','YDir','reverse');

% Create ylabel
ylabel({'$c_{0}$'},'FontWeight','bold','FontSize',24,'Interpreter','latex');

% Create xlabel
xlabel({'$y$'},'FontWeight','bold','FontSize',24,'Interpreter','latex'); %Create legend
legend1 = legend(gca,'show');
set(legend1,...
    'Position',[0.157668226789943 0.765714487053622 0.702981795360142 0.150363192893114],...
    'NumColumns',3,...
    'Interpreter','latex',...
    'FontSize',18,...
    'EdgeColor','none',...
    'Color','none');

exportgraphics(gcf,'fig2c.jpg',Resolution=600);