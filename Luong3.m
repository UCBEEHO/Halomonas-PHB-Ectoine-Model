global   Mue_max_1  Mue_max_2   vx1x4  k_x1x4  kp_x1x4  vx2x5 k_x2x5  kp_x2x5  vx1x5  k_x1x5  kp_x1x5  vx2x4    k_x2x4  kp_x2x4  Yx4_x1  Yx5_x1  Yx5_x2  k_s2  ym1  a  kI2 n1 n2  k_s1 k_s
a= 3.10344513305970; % is growth related coefficient.
%a_2= 0.5241; % h^-1, is the non-growth related coefficient.
%Y_max= 0.29; % gg^-1, is the stoichiometric yeild of biomass on substrate. 
%m=0.13; % is saturation constant or half-velocity constant. 

%kI =18.4090875266685; 

%k_s1=0.0079; % g/L, is the maximum attainable biomass concentration.
%Mue_max_1 = 2.69764055343749;																				
%Mue_max_2   =  2.32191275550562;

%k_x1 =	0.486417925800486;
%k_x2  = 	1.38874769913768	;												
																											
														
																																																		
Mue_max_1  =0.126449226242786
Mue_max_2 =1.94602742106164

vx1x4 =53.4352480581801
k_x1x4 =0.335439730256776
kp_x1x4 =0.000316127876559547
vx2x5 =0.00500297741916067
k_x2x5= 15.4988155899016
kp_x2x5 =12.0699520585293
vx1x5 =	43.5075202244983
k_x1x5  =13.6452859290007
kp_x1x5 =6.00059796296293e-07										
vx2x4  =0.121776146224040
k_x2x4 =15.7383891890571
kp_x2x4=0.763476865491625					 																	
Yx4_x1 =0.0773555113272151
Yx5_x1 =0.246086112723481							
Yx5_x2 =	20.2006000482836
k_s2 =26.3501781983599
ym1 =99.1305822924546
a  =	6.62455059202808
kI2 =16.3305660622699
n1=0.556813018304447
n2 =1.93757591049501	
k_s1=8.76874809844793	
k_s=	0.613948080091625	

 y0 = [  7.29  2.76  0.02   0.01  0.01    ];
tspan =[0 50];
tdata = [  0, 2 ,4, 6,    22, 24, 26, 28, 30, 46, 48, 50] ; 
%tdata = [2, 4, 6,9,10, 13,25];
opt = odeset('MaxStep', 1e-3);
%opt = odeset('MaxStep', 1e-3);
[tode,Y]=ode45(@luong,tspan,y0,opt);

%plotting

figure
hax1 = axes;
yyaxis right
plot(tode,Y(:,3),tode, Y(:,4))
hold on
plot(tdata, [0.02, 0.06, 0.12, 0.22,   1.57, 2, 2.500, 2.73, 2.62, 2.07, 1.90, 1.84], 'Color', 'r', 'Linestyle', 'none', 'Marker', '+')
hold on
plot(tdata, [0.01, 0.01, 0.01, 0.01, 0.61, 0.66, 0.86, 0.57, 0.47, 0.42, 0.39, 0.32 ],  'Color', 'r', 'Linestyle', 'none', 'Marker', 'o')
yyaxis left
plot(tode,Y(:,1),tode, Y(:,2))
hold on
plot(tdata,[7.29, 7.26, 7.2, 7.01,  0.01 , 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.011], 'Color', 'b', 'Linestyle', 'none', 'Marker', '*')
hold on
plot(tdata,[2.76, 2.63, 2.50, 2.36,   1.51, 1.33 , 1.21, 1.13, 1.11, 1.03, 1.06, 1.06], 'Color', 'b', 'Linestyle', 'none', 'Marker', '^')
hold on
hax2 = axes('position', hax1.Position);
plot(hax2, tode, Y(:,5), 'k')
hold on
plot(tdata,[ 0.01, 0.01, 0.01, 0.01,0.0206 , 0.0226, 0.0242, 0.0249, 0.0259, 0.0249, 0.0239, 0.0238], 'Color', 'k', 'Linestyle', 'none', 'Marker', '^')
hax2.XLim = hax1.XLim; 
hax2.XTick = hax1.XTick; 
hax2.YAxis.TickLabelFormat = "%g       ";  
hax2.Color = 'none'; 
hax2.YLim = [0 60];
hold on




figure
hax1 = axes;

%% Right axis: Biomass and PHB
yyaxis right
h_biomass_model = plot(tode, Y(:,3), 'r-'); hold on
h_phb_model     = plot(tode, Y(:,4), 'm--');

h_biomass_data = plot(tdata, ...
    [0.02, 0.06, 0.12, 0.22,   1.57, 2, 2.500, 2.73, 2.62, 2.07, 1.90, 1.84 ], ...
    'Color', 'r', 'LineStyle', 'none', 'Marker', '+');

h_phb_data = plot(tdata, ...
    [0.01, 0.01, 0.01, 0.01, 0.61, 0.66, 0.86, 0.57, 0.47, 0.42, 0.39, 0.32 ], ...
    'Color', 'm', 'LineStyle', 'none', 'Marker', 'o');

ylabel('Biomass, PHB (gL^{-1})', 'FontSize', 14, 'FontWeight', 'bold')

%% Left axis: Glucose and Nitrogen
yyaxis left
h_glucose_model = plot(tode, Y(:,1), 'b-');
h_nitrogen_model = plot(tode, Y(:,2), 'g--');

h_glucose_data = plot(tdata, ...
    [7.29, 7.26, 7.2, 7.01,  0.01 , 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.011  ], ...
    'Color', 'b', 'LineStyle', 'none', 'Marker', '*');

h_nitrogen_data = plot(tdata, ...
    [2.76, 2.63, 2.50, 2.36,   1.51, 1.33 , 1.21, 1.13, 1.11, 1.03, 1.06, 1.06], ...
    'Color', 'g', 'LineStyle', 'none', 'Marker', '^');

ylabel('Glucose, Nitrogen, Ectoine (gL^{-1})', 'FontSize', 14, 'FontWeight', 'bold')

%% Third axis: Ectoine
hax2 = axes('Position', hax1.Position);
h_ectoine_model = plot(hax2, tode, Y(:,5), 'k-.'); hold on
h_ectoine_data = plot(hax2, tdata, ...
    [0.01, 0.01, 0.01, 0.01,0.0206 , 0.0226, 0.0242, 0.0249, 0.0259, 0.0249, 0.0239, 0.0238 ], ...
    'Color', 'k', 'LineStyle', 'none', 'Marker', '^');

hax2.XLim = hax1.XLim;
hax2.XTick = hax1.XTick;
hax2.YAxis.TickLabelFormat = "%g       ";
hax2.Color = 'none';
hax2.YLim = [0 60];

%% X label
xlabel('Time (h)', 'FontSize', 14, 'FontWeight', 'bold')

%% Legend
lgd = legend(hax1, ...
    [h_glucose_data, h_glucose_model, ...
     h_nitrogen_data, h_nitrogen_model, ...
     h_biomass_data, h_biomass_model, ...
     h_phb_data, h_phb_model, ...
     h_ectoine_data, h_ectoine_model], ...
    {'Glucose (data)', 'Glucose (model)', ...
     'Nitrogen (data)', 'Nitrogen (model)', ...
     'Biomass (data)', 'Biomass (model)', ...
     'PHB (data)', 'PHB (model)', ...
     'Ectoine (data)', 'Ectoine (model)'});

lgd.Location = 'west';
lgd.FontSize = 9;
lgd.FontWeight = 'bold';

% Move legend slightly lower
lgd.Position(2) = lgd.Position(2) - 0.03;

%% Optional axis font formatting
set(hax1, 'FontSize', 14, 'FontWeight', 'bold')
set(hax2, 'FontSize', 14, 'FontWeight', 'bold')







