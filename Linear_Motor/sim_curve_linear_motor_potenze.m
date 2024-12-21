%% PLOT: Potenza meccanica ed elettrica in funzione del tempo

%Individuazione del path per la potenza MECCANICA dissipata dal 'Rotational Friction'
power_mech_diss = out.simlog.Rotational_Friction.power_dissipated.series.values('W');

%Individuazione del path per la potenza ELETTRICA dissipata dal 'DC Motor'
power_elec_diss = out.simlog.DC_Motor.power_dissipated.series.values('W'); % Potenza elettrica dissipata (colore: verde)

%Individuazione del TEMPO
time = out.tout; % Tempo

%Individuazione delle velocità: ROTAZIONE e TRASLAZIONE
rotational_velocity = out.rotational_velocity(:,2);
translational_velocity = out.linear_velocity(:,2);


% Creare la figura con 2 sottografici (2x2)
figure('Position', [100, 100, 1400, 600]);



% Sottografico 1: potenza MECCANICA dissipata nel TEMPO
subplot(2, 2, 1);

% Aggiungere etichette e titolo agli assi
xlabel('Tempo (s)', 'FontSize', 10);
ylabel('Potenza dissipata (W)', 'FontSize', 10);
title('Potenza meccanica dissipata in funzione del tempo', 'FontSize', 10);

hold on
% Tracciare la potenza meccanica dissipata in blu
plot(time, power_mech_diss, 'LineWidth', 0.5, 'Color', 'b');



% Sottografico 2: Potenza ELETTRICA dissipata nel TEMPO
subplot(2, 2, 2);

% Aggiungere etichette e titolo agli assi
xlabel('Tempo (s)', 'FontSize', 10);
ylabel('Potenza dissipata (W)', 'FontSize', 10);
title('Potenza elettrica dissipata in funzione del tempo', 'FontSize', 10);

hold on
% Tracciare la potenza elettrica dissipata in verde
plot(time, power_elec_diss, 'LineWidth', 0.5, 'Color', 'b');



% Sottografico 3: Potenza MECCANICA dissipata f(VELOCITA' ROTAZIONE)
subplot(2, 2, 3);

% Aggiungere etichette e titolo agli assi
xlabel('Velocità di rotazione [rad/s]', 'FontSize', 10);
ylabel('Potenza dissipata [W]', 'FontSize', 10);
title('Potenza meccanica dissipata in funzione di v rotazione', 'FontSize', 10, 'Color', 'r');

hold on
% Tracciare la potenza MECCANICA dissipata in relazione alla velocità di ROTAZIONE
plot(rotational_velocity, power_mech_diss, 'LineWidth', 0.5, 'Color', 'b');



% Sottografico 4: Potenza ELETTRICA dissipata f(VELOCITA' ROTAZIONE)
subplot(2, 2, 4);
DC_Motor_rot_velocity = out.simlog.DC_Motor.w.series.values('rad/s');

% Aggiungere etichette e titolo agli assi
xlabel('Potenza dissipata [W]', 'FontSize', 10);
ylabel('DC motor velocity [rad/s]', 'FontSize', 10);
title('V rotazione in funzione di potenza elettrica', 'FontSize', 10, 'Color', 'r');

hold on
% Tracciare la potenza ELETTRICA dissipata in relazione a velocità di TRASLAZIONE
plot(power_elec_diss(88:229),DC_Motor_rot_velocity(88:229), 'LineWidth', 0.5, 'Color', 'b'); %con l'intervallo (88:229) considero dopo un tempo di avviamento pari a 2 sec fino al termine della simulazione