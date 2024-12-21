%Calcolo delle curve coppia-velocità per i due damper: FEM e SIMPLIFIED

%Individuazione path coppia (FEM e SIMPLIFIED)
torque_damper_FEM = out.simlog.Load_damper_1.t.series.values('N*m');
torque_damper_simplified = out.simlog.Load_damper_2.t.series.values('N*m');

%Individuazione path velocità (FEM e SIMPLIFIED)
rotational_velocity_FEM = out.simlog.Load_damper_1.w.series.values('rad/s');
rotational_velocity_simplified = out.simlog.Load_damper_2.w.series.values('rad/s');


figure("Position",[100, 100, 1400, 600])

%Subgrafico 1: coppia velocità damper_1 (FEM)
subplot(2,2,1);
xlabel('omega damper 1 [rad/s]','FontSize',10);
ylabel('torque damper 1 [N*m]','FontSize',10);

hold on
plot(rotational_velocity_FEM, torque_damper_FEM ,"LineWidth",0.5);

title("Curva: coppia velocità damper 1 (FEM)", 'FontSize', 10, 'Color', 'r');


%Subgrafico 2: coppia velocità damper_2 (SIMPLIFIED)
subplot(2,2,2);
xlabel('omega damper 2 [rad/s]','FontSize',10);
ylabel('torque damper 2 [N*m]','FontSize',10);

hold on
plot(rotational_velocity_simplified, torque_damper_simplified ,"LineWidth",0.5);

title("Curva: coppia velocità damper 2 (SIMPLIFIED)", 'FontSize', 10, 'Color', 'r');