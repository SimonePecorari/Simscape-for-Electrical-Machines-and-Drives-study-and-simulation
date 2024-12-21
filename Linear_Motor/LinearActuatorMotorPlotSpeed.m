% Code to plot simulation results from LinearActuatorMotor
%% Plot Description:
%
% The plot below shows the performance of the motor compared to values
% found on the datasheet for a linear actuator. The test includes no load,
% rated load, and max load. The motor speed and currents match the
% specification closely, indicating that we have assigned parameter values
% that match the datasheet.

% Copyright 2016-2023 The MathWorks, Inc.

% Generate new simulation results if they don't exist or if they need to be updated
if ~exist('simlog_LinearActuatorMotor', 'var') || ...
        simlogNeedsUpdate(simlog_LinearActuatorMotor, 'LinearActuatorMotor') 
    sim('LinearActuatorMotor')
    % Model StopFcn callback adds a timestamp to the Simscape simulation data log
end


% Reuse figure if it exists, else create new figure
if ~exist('h1_LinearActuatorMotor', 'var') || ...
        ~isgraphics(h1_LinearActuatorMotor, 'figure')
    h1_LinearActuatorMotor = figure('Name', 'LinearActuatorMotor');
end
figure(h1_LinearActuatorMotor)
clf(h1_LinearActuatorMotor)

% Get simulation results
simlog_t = simlog_LinearActuatorMotor.Load_Force.f.series.time;
simlog_fLoad = simlog_LinearActuatorMotor.Load_Force.f.series.values('N');
simlog_vScrew = simlog_LinearActuatorMotor.Lead_Screw.P.v.series.values('mm/s');
simlog_wMotor = simlog_LinearActuatorMotor.DC_Motor.R.w.series.values('rpm');
simlog_iMotor = simlog_LinearActuatorMotor.DC_Motor.i.series.values('A');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, -simlog_fLoad, 'LineWidth', 1)
hold on
plot([4 6.5],[1 1]*1000,'k--','LineWidth',1);
text(6.5,1000,'Rated Load 1000 N')
hold off
grid on
title('Load Force')
ylabel('Force (N)')

simlog_handles(2) = subplot(2, 1, 2);
yyaxis right
plot(simlog_t, simlog_wMotor, 'LineWidth', 1);
hold on
plot([0 2.5],[1 1]*3250,'k--','LineWidth',1);
text(0.13,2700,sprintf('%s\n%s','No Load Spd','3250 RPM'))
plot([4 6.5],[1 1]*2375,'k--','LineWidth',1);
text(6.5,2375,'Rated Spd 2375 RPM')
hold off
ylabel('Speed (RPM)');
yyaxis left
plot(simlog_t, simlog_iMotor, 'LineWidth', 1);
hold on
plot([0 2.5],[0.35 0.35],'k--','LineWidth',1);
text(2.5,0.4,'No Load Current 0.35 A')
plot([5.5 10],[5 5],'k--','LineWidth',1);
text(5.5,5,'Max Current 5 A','HorizontalAlignment','right')
hold off
ylabel('Current (A)')
grid on
title('Motor Measurements')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_wMotor simlog_fLoad simlog_iMotor
clear simlog_vScrew
