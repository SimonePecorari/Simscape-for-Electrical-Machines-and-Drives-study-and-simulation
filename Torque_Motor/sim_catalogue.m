torque_fem = out.simlog.Sensing_Mech_FEM.Torque_Sensor.T.series.values('N*m');
speed_fem_deg_per_sec = out.simlog.Sensing_Mech_FEM.Torque_Sensor.C.w.series.values('deg/s');
speed_fem = speed_fem_deg_per_sec*(pi/180);

figure("Position",[100, 100, 1400, 600])
subplot(2,2,1);
plot(speed_fem, torque_fem,"LineWidth",0.5);
xlabel('speed [rad/s]','FontSize',10);
ylabel('torque [Nm]','FontSize',10);

title("Coppia velocità", 'FontSize', 10, 'Color', 'r');

