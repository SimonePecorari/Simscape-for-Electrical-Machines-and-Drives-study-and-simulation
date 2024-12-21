rotational_vel = out.rotational_velocity_fem(:,2);
torque_fem = out.torque_fem(:,2);

figure("Position",[100, 100, 1400, 600])

%Subgrafico 1: coppia velocità damper_1 (FEM)
subplot(2,2,1);
xlabel('rot vel  [rpm]','FontSize',10);
ylabel('torque   [N*m]','FontSize',10);

hold on
plot(rotational_vel, torque_fem ,"LineWidth",0.5);

title("Curva: coppia velocità (FEM)", 'FontSize', 10, 'Color', 'r');