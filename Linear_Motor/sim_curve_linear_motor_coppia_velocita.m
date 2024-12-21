%Partendo dal motore DC vado ad individuare la coppia e la velocità di
%rotazione dello stesso (v_rotazione determinerà una v_traslazione della
%slitta).

%Individuazione path torque e velocity MOTORE DC
DC_Motor_torque = out.simlog.DC_Motor.t.series.values('N*m');
DC_Motor_velocity = out.simlog.DC_Motor.w.series.values('rad/s');

%Individuazione path velocità di rotazione input ed output GEAR WORM
w_in_gear_worm = out.simlog.Gear_worm.S.w.series.values('rad/s'); %considero la velocità input di rotazione del GEAR WORM
w_out_gear_worm = out.simlog.Gear_worm.O.w.series.values('rad/s'); %considero la velocità output di rotazione del GEAR WORM
time = out.tout; %tempo simulazione


%REALIZZAZIONE OUTPUT VISIVO CON 4 DIAGRAMMI
figure('Position', [100, 100, 1400, 600]);



%   1 DIAGRAMMA COPPIA VELOCITA' DEL MOTORE DC
% Sottografico 1
subplot(2, 2, 1);

% Aggiungere etichette e titolo agli assi
xlabel('Velocità rotazione DC Motor [rad/s]', 'FontSize', 10);
ylabel('Coppia [N*m]', 'FontSize', 10);
title('DC MOTOR: Curva coppia velocità', 'FontSize', 10, 'Color', 'r');
hold on
plot(DC_Motor_velocity, DC_Motor_torque, "Color", 'b');



%   2 VERIFICA DEL VALORE DI RATIO INDIVIDUATO A LIVELLO COSTRUTTIVO NEL GEAR WORM
%Analisi GEAR WORM considerando la coppia d'ingresso t_in e la coppia d'uscita t_out in funzione della velocità di rotazione del GEAR:
%individuazione del RATIO

ratio_gear_worm = zeros(229,1);
dimensions_matrix = size(ratio_gear_worm);

for i= 1:dimensions_matrix
   ratio_gear_worm(i) = w_in_gear_worm(i)/w_out_gear_worm(i);
end

% Sottografico 2
subplot(2, 2, 2);

% Aggiungere etichette e titolo agli assi
xlabel('Tempo', 'FontSize', 10);
ylabel('Ratio gear worm', 'FontSize', 10);
title('GEAR WORM: RATIO', 'FontSize', 10, 'Color', 'r');
hold on
plot(time, ratio_gear_worm, "Color", 'b');



%   3 DIAGRAMMA COPPIA-VELOCITA' GEAR WORM IN INGRESSO
%GEAR_WORM: S (input) and t_in
torque_input_S = out.simlog.Gear_worm.t_in.series.values('N*m');

% Sottografico 3
subplot(2, 2, 3);

% Aggiungere etichette e titolo agli assi
xlabel('velocità rotazione input', 'FontSize', 10);
ylabel('Coppia input', 'FontSize', 10);
title('GEAR WORM: Curva coppia velocità rot (input)', 'FontSize', 10, 'Color', 'r');
hold on
plot(w_in_gear_worm, torque_input_S, "Color", 'b');



%   4 DIAGRAMMA COPPIA-VELOCITA' GEAR WORM IN USCITA
%GEAR_WORM: O (output) and t_out
torque_output_O = out.simlog.Gear_worm.t_out.series.values('N*m');

% Sottografico 4
subplot(2, 2, 4);

% Aggiungere etichette e titolo agli assi
xlabel('Velocità rotazione output', 'FontSize', 10);
ylabel('Coppia output', 'FontSize', 10);
title('GEAR WORM: Curva coppia velocità rot (output)', 'FontSize', 10, 'Color', 'r');
hold on
plot(w_out_gear_worm, torque_output_O, "Color", 'b');