%Calcolo delle curve coppia velocità tenendo conto della tipologie FEM e
%SIMPLE rappresentate nello schema Simscape.

%Individuazione path coppia (FEM e SIMPLE)
torque_fem = out.torque_fem(:,2); %coppia: FEM
torque_simple = out.torque_simple(:,2); %coppia: SIMPLE

%Individuazione path velocità di rotazione (FEM e SIMPLE)
v_rotazione_fem = out.rotational_velocity_fem(:,2); %velocità rotazione: FEM
v_rotazione_simple = out.rotational_velocity_simple (:,2); %velocità di rotazione: SIMPLE


%Individuazione path angolo (FEM e SIMPLE)
theta_fem = out.theta_fem(:,2);
theta_simple = out.theta_simple(:,2);

figure("Position",[100, 100, 1400, 600])

%Subgrafico 1: coppia velocità (FEM)
subplot(2,2,1);
xlabel('omega [rad/s]','FontSize',10);
ylabel('torque [N*m]','FontSize',10);

hold on
plot(v_rotazione_fem, torque_fem,"LineWidth",0.5);

title("Curva: coppia velocità (FEM)", 'FontSize', 10, 'Color', 'r');


%Subgrafico 2: coppia velocità (SIMPLE)
subplot(2,2,2);
xlabel('omega [rad/s]','FontSize',10);
ylabel('torque [N*m]','FontSize',10);

hold on
plot(v_rotazione_simple, torque_simple,"LineWidth",0.5);

title("Curva: coppia velocità (SIMPLE)", 'FontSize', 10, 'Color', 'r');



%Subgrafico 3: coppia angolo (FEM)
subplot(2,2,3);
xlabel('Angle [rad]','FontSize',10);
ylabel('Torque [N*m]','FontSize',10);

hold on
plot(theta_fem, torque_fem,"LineWidth",0.5);

title("Curva: coppia angolo (FEM)", 'FontSize', 10, 'Color', 'r');



%Subgrafico 4: coppia angolo (SIMPLE)
subplot(2,2,4);
xlabel('Angle [rad]','FontSize',10);
ylabel('Torque [N*m]','FontSize',10);

hold on
plot(theta_simple, torque_simple,"LineWidth",0.5);

title("Curva: coppia angolo (SIMPLE)", 'FontSize', 10, 'Color', 'r');

