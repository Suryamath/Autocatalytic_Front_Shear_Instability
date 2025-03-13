%-----------------------------------------------------------------------
% grid size vs error plot
%-------------------------------------------------------------------------

close all;
clear all;
clc;

Ns_vec=[101 201 301 401];
E=[9e-06 9e-06 6e-06 5e-06;1.5e-05 1.5e-05 1.3e-05 6e-06;
    1.1e-05 4e-06 4e-06 3e-06;1.1e-05 4e-06 5e-06 2e-06; 
    4e-06 3e-06 3e-06 3e-06];


figure;


% Create axes
axes1 = axes;
hold(axes1,'on');

for i=1:5
    plot1(i)=plot(Ns_vec,E(i,:),'LineWidth',2);
    hold on
end


set(plot1(1),'DisplayName','$h=0.1$','Marker','*','LineStyle','-.',...
    'Color',[0.0745098039215686 0.623529411764706 1]);
set(plot1(2),'DisplayName','$h=0.2$',...
    'Color',[0.00784313725490196 0.207843137254902 0.341176470588235]);
set(plot1(3),'DisplayName','$h=0.3$','Marker','o',...
    'Color',[0.988235294117647 0.435294117647059 0.196078431372549]);
set(plot1(4),'DisplayName','$h=0.4$','LineStyle','--',...
    'Color',[0.670588235294118 0.149019607843137 0.149019607843137]);
set(plot1(5),'DisplayName','$h=0.5$',...
    'Color',[0.470588235294118 0.811764705882353 0.0235294117647059]);

% Create ylabel
ylabel('$E$','FontWeight','bold','FontSize',28,'Interpreter','latex');

% Create xlabel
xlabel('$N_s$','FontWeight','bold','FontSize',28,'Interpreter','latex');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

% Set the remaining axes properties
set(axes1,'FontSize',15,'FontWeight','bold','TitleFontWeight','normal');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.669937454357898 0.588630898885201 0.223674194619619 0.332594227632239],...
    'Interpreter','latex',...
    'FontSize',18,...
    'EdgeColor','none',...
    'Color','none');

exportgraphics(gcf,'fig4.jpg','Resolution',600)