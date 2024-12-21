%% PLOT: "Angle" (funzione tempo-angolo)
%Rappresentazione del diagramma della variazione di angolo nel tempo da
%confrontare con il diagramma teorico.
time_theta = theta(:,1);
theta = theta(:,2);

figure("Position",[100, 100, 1400, 600])
subplot(2,2,1);
plot(time_theta, theta,"LineWidth",0.5);
xlabel('Tempo (s)','FontSize',10);
ylabel('Angolo (rad)','FontSize',10);

title("Andamento: step", 'FontSize', 10);


%% PLOT: "Speed" (funzione tempo-velocità)
%Calcoli effetuati tramite analisi confronto con i diagrammi ottenuti dagli
%scope di 'Simscape' del modello.

time_speed_18 = speed_in_18(:,1); 
speed_18 = speed_in_18(:,2);

figure("Position",[100, 100, 1400, 600])
subplot(2,2,1);
plot(time_speed_18, speed_18,"LineWidth",0.5);
xlabel('time','FontSize',10);
ylabel('speed','FontSize',10);

title("Speed", 'FontSize', 10, 'Color', 'g');


%% PLOT: "Torque" (funzione tempo-coppia)
%Calcoli effetuati tramite analisi confronto con i diagrammi ottenuti dagli
%scope di 'Simscape' del modello.

time_torque = torque_in_18(:,1);
torque = torque_in_18 (:,2);

figure("Position",[100, 100, 1400, 600])
subplot(2,2,1);
plot(time_torque, torque,"LineWidth",0.5);
xlabel('time','FontSize',10);
ylabel('torque','FontSize',10);

title("Torque", 'FontSize', 10, 'Color', 'b');


%% PLOT: "Pull_in Pull_out" (funzione velocità-coppia) 

%Valori ottenuti effettuando la relativa simulazione tramite 'Simscape' del
%modello "StepperMotor_time_solver_curve_caratteristiche".


%Il pull-out è stato ottenuto considerando il diagramma coppia-velocità
%teorico e variando la velocità fino a valori doppi rispetto a quelli
%calcolati per il pull-in.

figure("Position",[100, 100, 1400, 600])
% subplot(2,2,1);

xlabel('Velocità (step/s)','FontSize',10);
xlim([0 20]);

ylabel('Coppia (Nm)','FontSize',10);
ylim([0 0.1]);

title("Curve: Pull-in Pull-out", 'FontSize', 10);

grid on
hold on


%Pull_in_1.8: 
speed_pullin_18 = speed_in_18(249933 : 250001, 2); %in_18: pull-in con step 1.8°
torque_pullin_18 = torque_in_18(249933 : 250001, 2);

plot(speed_pullin_18, torque_pullin_18,"LineWidth",0.5, 'Color','b');


%Pull_out_1.8: 
speed_pullout_18 = speed_out_18(249933 : 250001, 2); %out_18: pull-out con step 1.8°
torque_pullout_18 = torque_out_18(249933 : 250001, 2);

plot(speed_pullout_18, torque_pullout_18,"LineWidth",0.5, 'Color','b');



% %PLOT: curve Pull-in Pull-out (step 3.6°)
% figure("Position",[100, 100, 1400, 600])
% % subplot(2,2,1);
% 
% xlabel('Velocità (step/s)','FontSize',10);
% xlim([0 20]);
% 
% ylabel('Coppia (Nm)','FontSize',10);
% ylim([0 0.1]);
% 
% title("Curve: Pull-in Pull-out", 'FontSize', 10);
% 
% grid on
% hold on

%Pull_in_3.6
speed_pullin_36 = speed_in_36(249933 : 250001, 2); %in_36: pull-in con step 3.6°

torque_pullin_36 = torque_in_36(249933 : 250001, 2);

plot(speed_pullin_36, torque_pullin_36,"LineWidth",0.5, 'Color','g');



%Pull_out_3.6
speed_pullout_36 = speed_out_36(249933 : 250001, 2); %out_36: pull-out con step 3.6°
torque_pullout_36 = torque_out_36(249933 : 250001, 2);

plot(speed_pullout_36, torque_pullout_36,"LineWidth",0.5, 'Color','g');




% %PLOT: curve Pull_in Pull_out (step 7.2°) 
% figure("Position",[100, 100, 1400, 600])
% % subplot(2,2,1);
% 
% xlabel('Velocità (step/s)','FontSize',10);
% xlim([0 20]);
% 
% ylabel('Coppia (Nm)','FontSize',10);
% ylim([0 0.1]);
% 
% title("Curve: Pull-in Pull-out", 'FontSize', 10);

grid on
hold on

%Pull_in_7.2
speed_pullin_72 = speed_in_72(249933 : 250001, 2); %in_72: pull-in con step 7.2°
torque_pullin_72 = torque_in_72(249933 : 250001, 2);

plot(speed_pullin_72, torque_pullin_72,"LineWidth",0.5, 'Color','r');


%Pull_out_7.2
speed_pullout_72 = speed_out_72(249933 : 250001, 2);
torque_pullout_72 = torque_out_72(249933 : 250001, 2);

plot(speed_pullout_72, torque_pullout_72,"LineWidth",0.5, 'Color','r'); %out_72: pull-out con step 7.2°







