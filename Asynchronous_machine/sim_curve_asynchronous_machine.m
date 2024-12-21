%% COPPIA-VELOCITA' TIME_DISCRETE
%Calcolo curve coppia-velocità
% torque = torque_Nm(45936:114847,2);
% speed = speed_rpm(45936:114847,2);

torque = torque_Nm(:,2);
speed = speed_rpm(:,2);

figure ("Position", [100, 100, 1400, 600]);

xlabel('speed [rpm]', 'FontSize', 10);
ylabel('torque [N*m]', 'FontSize',10);

hold on

plot(speed, torque,"LineWidth", 0.5);

title("Curva coppia -  velocità", 'FontSize', 10, 'Color', 'r');

%% COPPIA VELOCITA' LAPLACE
%Calcolo curve di coppia - velocità
torque_asincrono_Laplace_rad_per_sec = out.simlog.Induction_Machine_Squirrel_Cage.angular_torque.series.values('rad/s');
torque_asincrono_Laplace_rpm = torque_asincrono_Laplace_rad_per_sec*(30/pi);
speed_asincrono_Laplace = out.simlog.Induction_Machine_Squirrel_Cage.angular_velocity.series.values('N*m');

figure ("Position", [100 100 1400 600]);
xlabel('speed [rpm]', 'FontSize', 10);
ylabel('torque [N*m]', 'FontSize',10);

hold on

plot(speed_asincrono_Laplace, torque_asincrono_Laplace, "LineWidth", 0.5);

title("Curva coppia - velocità (Laplace)", 'Fontsize', 10,'Color', 'r');


%% COPPIA-VELOCITA' LAPLACE_1
torque = out.simlog.Inertia.t.series.values('N*m');
speed = out.simlog.Inertia.w.series.values ('rad/s');
speed = out.speed_rot (:,2);

figure("Position",[100, 100, 1400, 600]);
xlabel('speed [rpm]','FontSize',10);
ylabel('torque [N*m]','FontSize',10);

hold on

plot(speed,torque, "LineWidth", 0.5);

title("Curve coppia velocità",'FontSize', 10, 'Color', 'r');

%% POTENZA DISSIPATA LAPLACE
power_elec_diss = out.simlog.Induction_Machine_Squirrel_Cage.power_dissipated.series.values("W");
torque_power_diss = out.simlog.Inertia.t.series.values('N*m');
speed_rot_power_diss = out.simlog.Inertia.w.series.values('rad/s');

dim_torque = size(torque_power_diss);
dim_speed = size(speed_rot_power_diss);

if (isequal(dim_torque,dim_speed))
    power_mech_diss = zeros(dim_torque);
    efficiency = zeros(dim_torque);

    for i = 1: dim_torque
       power_mech_diss = torque_power_diss.*speed_rot_power_diss;
       efficiency = abs(power_mech_diss./power_elec_diss);
   
    end
end

figure("Position",[100 100 1400 600]);
xlabel('time [s]', 'FontSize', 10);
ylabel('efficiency', 'FontSize', 10);

hold on

plot(out.tout, efficiency, 'LineWidth',0.5, 'Color', 'b');

title('Efficiency and velocity', 'FontSize', 10, 'Color', 'r');

%% PLOT: POTENZA MECCANICA E VELOCITA' ROTAZIONE
torque_power_diss = out.simlog.Inertia.t.series.values('N*m');
speed_rot_power_diss = out.simlog.Inertia.w.series.values('rad/s');

dim_torque = size(torque_power_diss);
dim_speed = size(speed_rot_power_diss);

if (isequal(dim_torque,dim_speed))
    power_mech_diss = zeros(dim_torque);
    
    for i = 1: dim_torque
       power_mech_diss = torque_power_diss.*speed_rot_power_diss;
 
    end
end

figure("Position", [100 100 1400 600]);
xlabel('speed [rad/s]', 'FontSize', 10);
ylabel('power [W]', 'FontSize', 10);

hold on

plot(speed_rot_power_diss, power_mech_diss, 'LineWidth', 0.5, 'Color', 'b');

title("Curva velocità rotazione e potenza meccanica", 'FontSize', 10, 'Color', 'r');

%% PLOT: TIME DISCRETE
speed_50 = speed_50Hz(:,2);
torque_50 = torque_50Hz(:,2);

speed_voltage = speed_f_voltage(:,2);
torque_voltage = torque_f_voltage(:,2);


figure("Position", [100 100 1400 600]);
xlabel('speed [rad/s]', 'FontSize', 10);
xlim([0 1550]);
ylabel('torque [N*m]', 'FontSize', 10);
ylim([0 100]);

hold on
plot(speed_50,torque_50,'LineWidth',0.5,'Color', 'b');

hold on
plot(speed_voltage, torque_voltage, 'LineWidth', 0.5, 'Color', 'r');

title("Curve coppia velocità macchina asincrona",'FontSize',10,'Color', 'r');



















