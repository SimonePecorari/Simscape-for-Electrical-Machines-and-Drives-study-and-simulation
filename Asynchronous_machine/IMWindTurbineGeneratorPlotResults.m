% Code to plot simulation results from IMWindTurbineGenerator
%% Plot Description:
%
% The plot below shows the input wind speed and output power of the Simple turbine block. 

% Copyright 2018-2023 The MathWorks, Inc.

% Generate new simulation results if they don't exist or if they need to be updated
if ~exist('simlog_IMWindTurbineGenerator', 'var') || ...
        simlogNeedsUpdate(simlog_IMWindTurbineGenerator, 'IMWindTurbineGenerator') 
    sim('IMWindTurbineGenerator')
    % Model StopFcn callback adds a timestamp to the Simscape simulation data log
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_IMWindTurbineGenerator', 'var') || ...
        ~isgraphics(h1_IMWindTurbineGenerator, 'figure')
    h1_IMWindTurbineGenerator = figure('Name', 'IMWindTurbineGenerator');
end
figure(h1_IMWindTurbineGenerator)
clf(h1_IMWindTurbineGenerator)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_IMWindTurbineGenerator.ASM_measurement.pu_input.series.time;
simlog_power = logsout_IMWindTurbineGenerator.get('power');
simlog_wind = logsout_IMWindTurbineGenerator.get('wind_speed');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_power.Values.Time, simlog_power.Values.Data/1e3, 'LineWidth', 1)
hold off
grid on
title('Output power of Simple turbine')
ylabel('Power output (kW)')
xlim([0, simlog_t(end,1)]);

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_wind.Values.Time, simlog_wind.Values.Data, 'LineWidth', 1)
grid on
title('Wind speed profile')
ylabel('Wind speed (m/s)')
xlabel('Time (s)')
xlim([0, simlog_t(end,1)]);

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_power simlog_wind
