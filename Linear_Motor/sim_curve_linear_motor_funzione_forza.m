%Analisi da effettuare tenendo conto della forza applicata alla slitta
%durante la movimentazione del motore lineare

%Analisi della corsa effettuata in funzione della forza della slitta
distance = out.simlog.Ideal_Translational_Motion_Sensor.x.series.values('m');
slide_force = abs(out.simlog.Lead_screw.f.series.values('N'));
slide_velocity_metri = out.simlog.Ideal_Translational_Motion_Sensor.V.series.values('m/s');
slide_velocity_millimetri = slide_velocity_metri*1000;

% Creare la figura con 2 sottografici (2x2)
figure('Position', [100, 100, 1400, 600]);

% Sottografico 1
subplot(2, 2, 1);

% Aggiungere etichette e titolo agli assi
xlabel('Corsa [m]', 'FontSize', 10);
ylabel('Forza [N]', 'FontSize', 10);
title('Curva forza corsa', 'FontSize', 10, 'Color', 'r');
hold on
plot(distance, slide_force, "Color", 'b');


% Sottografico 2
subplot(2, 2, 2);

% Aggiungere etichette e titolo agli assi
xlabel('Forza [N]', 'FontSize', 10);
ylabel('Velocità slider [mm/s]', 'FontSize', 10);

title('Curva forza velocità', 'FontSize', 10, 'Color', 'r');
hold on
plot(slide_force, slide_velocity_millimetri, "Color", 'b');


