% Initialization for the Simscape(TM) Electrical(TM) Torque Motor example
% model ParameterizeMotorTorque.slx. It is assumed that torque data as a function
% of angle and current is available from a supplier datasheet. Datasheet
% information can be digitized using tools available on MATLAB(R) Central:
% https://www.mathworks.com/matlabcentral/
%
% The defining equations for a torque motor are:
%
%     v   = i*R + dPhi/dx * dx/dt + dPhi/di * di/dt
%     trq = Integral[ dPhi/dx * di ]
%
% where:
%
%     Phi is the flux
%     R   is the winding resistance
%     v   is the voltage
%     i   is the current
%     x   is the angular displacement
%     trq is the torque defined as a function of i and x
%
% It is assumed that R and trq are known. This script estimates dPhi/dx from
% trq. Estimation of dPhi/di from torque is numerically difficult, but
% dPhi/di can be approximated as the measured inductance, L.

% Copyright 2010-2023 The MathWorks, Inc.


%% Load data
% Load the data which consists of seven matrices corresponding to currents
% of 0, 1, 2, 3, 4, 5 and 6 amps. The first column of each matrix is the
% vector angles in degrees, and the second column is the corresponding
% torque in Nm.

load ParameterizeMotorTorqueData
data = {trq0A,trq1A,trq2A,trq3A,trq4A,trq5A,trq6A};

%% Define Constants
r2d = 180/pi;
d2r = pi/180;

%% Define angle and current vectors with which to resample the data.
angle = d2r*[0:2:90]; nAngPts = length(angle);   % Angle in radians
current = -6:1:6; nCurrPts = length(current);    % Current vector

%% Plot datasheet-like plot
% Reuse figure if it exists, else create new figure
if ~exist('h2_ParameterizeMotorTorque', 'var') || ...
        ~isgraphics(h2_ParameterizeMotorTorque, 'figure')
    h2_ParameterizeMotorTorque = figure('Name', 'ParameterizeMotorTorque');
end
figure(h2_ParameterizeMotorTorque)
clf(h2_ParameterizeMotorTorque)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Interpolate the torque data over angle and current, and generate estimated
% data for negative currents.
torque = zeros(nCurrPts,nAngPts);

for i=0:6
    v = data{i+1};
    trq = interp1(d2r*v(:,1),v(:,2),angle,'spline');
    hold on
    plot(r2d*x,trq,'Color',temp_colororder(i+1,:));
    
    % Assume symmetry when creating table for negative currents
    torque(i+7,:) = trq;
    if i~=0
        torque(7-i,:) = -trq;
    end
end
for i=0:6
    v = data{i+1};
    trq = interp1(d2r*v(:,1),v(:,2),angle,'spline');
    plot(v(:,1),v(:,2),'o',...
        'MarkerFaceColor',temp_colororder(i+1,:),...
        'MarkerEdgeColor',temp_colororder(i+1,:),...
        'MarkerSize',4)
    hold on
    %plot(r2d*x,trq,'Color',temp_colororder(i+1,:));
end
hold off
box on
axis([0 90 -0.05 0.5]);
title('Motor Torque Obtained from Datasheet')
legend({'0 Amp','1 Amp','2 Amp','3 Amp','4 Amp','5 Amp','6 Amp','Data'})
xlabel('Angle (deg)')
ylabel('Torque (N*m)')

%% Plot Data as 3D surface (angle, current, torque)
% Reuse figure if it exists, else create new figure
if ~exist('h3_ParameterizeMotorTorque', 'var') || ...
        ~isgraphics(h3_ParameterizeMotorTorque, 'figure')
    h3_ParameterizeMotorTorque = figure('Name', 'ParameterizeMotorTorque');
end
figure(h3_ParameterizeMotorTorque)
clf(h3_ParameterizeMotorTorque)

for i=0:6
    v = data{i+1};
    trq = interp1(d2r*v(:,1),v(:,2),angle,'spline');
    plot3(v(:,1),i*ones(size(v(:,1))),v(:,2),'o',...
        'MarkerFaceColor',temp_colororder(i+1,:),...
        'MarkerEdgeColor',temp_colororder(i+1,:),...
        'MarkerSize',4)
    hold on
    plot3(r2d*angle,i*ones(size(trq)),trq,'Color',temp_colororder(i+1,:));
    
    plot3(v(:,1),-i*ones(size(v(:,1))),-v(:,2),'o',...
        'MarkerFaceColor',temp_colororder(i+1,:),...
        'MarkerEdgeColor',temp_colororder(i+1,:),...
        'MarkerSize',4)
    plot3(r2d*angle,-i*ones(size(trq)),-trq,'Color',temp_colororder(i+1,:));
end

% Add 3D surface as a reference
surf(r2d*angle,current,torque,'EdgeColor','none','FaceAlpha',0.4);

hold off
grid on
xlabel('Angle (deg)');
ylabel('Current (A)');
zlabel('Torque (N*m)');
title('Datasheet as Surface (Mirrored for Negative Currents)')
set(gca,'XLim',[0 100])

%% Determine the partial derivative of flux with respect to position,
% dPhi/dx. By definition torque is the integral over current of dPhi/dx,
% and hence dPhi/dx = d/di(torque).

dfluxdx = zeros(nCurrPts,nAngPts);

% Reuse figure if it exists, else create new figure
if ~exist('h4_ParameterizeMotorTorque', 'var') || ...
        ~isgraphics(h4_ParameterizeMotorTorque, 'figure')
    h4_ParameterizeMotorTorque = figure('Name', 'ParameterizeMotorTorque');
end
figure(h4_ParameterizeMotorTorque)
clf(h4_ParameterizeMotorTorque)

% Plot reference surface
surf(r2d*angle,current,torque,'EdgeColor','none','FaceAlpha',0.4);
hold on

% Loop over angle
for i=1:nAngPts
    
    % Fit polynomials along curves of constant angle
    trqData = torque(:,i)';
    p       = polyfit(current,trqData,5);
    trq     = polyval(p,current);
    
    % Plot polynomial curve on surface
    plot3(i*ones(size(current))*2,current,trqData,'-',...
        'MarkerFaceColor',temp_colororder(rem(i,6)+1,:),...
        'MarkerEdgeColor',temp_colororder(rem(i,6)+1,:),...
        'LineWidth',1);
    
    % Obtain derivative of polynomial
    dfluxdx(:,i) = polyval(polyder(p),current)';
end
hold off
title('Polynomial Fit to Torque Data by Angle')
xlabel('Angle (deg)');
ylabel('Current (A)');
zlabel('Torque (N*m)');

%% Plot Partial Derivative of Flux wrt. Angle

% Reuse figure if it exists, else create new figure
if ~exist('h5_ParameterizeMotorTorque', 'var') || ...
        ~isgraphics(h5_ParameterizeMotorTorque, 'figure')
    h5_ParameterizeMotorTorque = figure('Name', 'ParameterizeMotorTorque');
end
figure(h5_ParameterizeMotorTorque)
clf(h5_ParameterizeMotorTorque)

surf(r2d*angle,current,dfluxdx);
xlabel('Angle (deg)');
ylabel('Current (A)');
zlabel('\partial\Phi/\partial\theta (Wb/rad)')
title('Partial Derivative of Flux with Respect to Angle')
