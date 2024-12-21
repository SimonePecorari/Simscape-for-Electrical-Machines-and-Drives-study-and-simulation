% Code to plot simulation results from ParameterizeMotorTorque
%% Plot Description:
%
% The plot below shows the behavior of the FEM-Parameterized Rotary
% Actuator and simplified model built from Simscape Foundation Library
% elements.  

% Copyright 2016-2023 The MathWorks, Inc.

% Generate new simulation results if they don't exist or if they need to be updated
if ~exist('simlog_ParameterizeMotorTorque', 'var') || ...
        simlogNeedsUpdate(simlog_ParameterizeMotorTorque, 'ParameterizeMotorTorque') 
    sim('ParameterizeMotorTorque')
    % Model StopFcn callback adds a timestamp to the Simscape simulation data log
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_ParameterizeMotorTorque', 'var') || ...
        ~isgraphics(h1_ParameterizeMotorTorque, 'figure')
    h1_ParameterizeMotorTorque = figure('Name', 'ParameterizeMotorTorque');
end
figure(h1_ParameterizeMotorTorque)
clf(h1_ParameterizeMotorTorque)

% Get simulation results
simlog_t = simlog_ParameterizeMotorTorque.Rotary_Actuator_FEM_Parameterized.x.series.time;
simlog_aFEM = simlog_ParameterizeMotorTorque.Rotary_Actuator_FEM_Parameterized.x.series.values('deg');
simlog_aSim = simlog_ParameterizeMotorTorque.Rotary_Actuator_Simplified.Hard_Stop.phi.series.values('deg');
simlog_trqFEM = simlog_ParameterizeMotorTorque.Load_Damper_FEM.t.series.values('N*m');
simlog_trqSim = simlog_ParameterizeMotorTorque.Load_Damper_Simplified.t.series.values('N*m');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_aFEM, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_aSim, 'LineWidth', 1)
hold off
grid on
title('Shaft Angle')
ylabel('Angle (deg)')
legend({'FEM','Simplified'},'Location','Best');

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_trqFEM, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_trqSim, 'LineWidth', 1)
grid on
title('Motor Torque')
ylabel('Torque (N*m)')
xlabel('Time (s)')
legend({'FEM','Simplified'},'Location','Best');

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_aFEM simlog_aSim simlog_trqFEM simlog_trqSim
