%-----------------------------------------------------------------------
% To plot function g that is inversely propertional to the 
% width of the front as a function of Da and Pe
%-------------------------------------------------------------------------

% Define grid and function s
da = linspace(0.1, 100, 500);
pe = linspace(1000,25000,500);

[x, y] = meshgrid(da, pe);

g = sqrt((x.*y )./ 2 );
% Create the surface plot
surf(x,y,g,'EdgeColor','none');

% Adjust colormap and color range
colormap('jet'); % Or any other colormap you prefer

view(2)

% Add labels and title
zlabel('g');

% Create zlabel
zlabel('g','FontWeight','bold');

grid(gca,'on');
hold(gca,'on');

% Set the remaining axes properties
set(gca,'FontSize',12,'FontWeight','bold');

% Create ylabel
ylabel('$Pe$','FontWeight','bold','FontSize',24,'Interpreter','latex');
ylim([1000 20000]);

% Create xlabel
xlabel('$Da$','FontWeight','bold','FontSize',24,'Interpreter','latex');

% Add color bar
c=colorbar;
set(c,fontsize=10);
exportgraphics(gcf,'fig2a.jpg','Resolution',600)