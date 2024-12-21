%% PLOT: REGIONI DI FUNZIONAMENTO (TIME DISCRETE)
%Calcolo del valore dello slittamento s considerando la formula in funzione
%della velocità del rotore.

%Si considerano i parametri della macchina in esame:
%Frequenza con cui si alimenta la macchina: 50 [Hz]
%Numero di poli: 2
%Costante: 60
%Velocità del rotore da estrapolare dal workspace

time = tout;

%velocità del rotore della macchina asincrona
speed_pos = speed_50Hz(:,2);
speed_neg = speed_50Hz_neg(:,2);

frequency = 50; %frequenza di alimentazione della macchina
p = 4; %polar pairs: 2

n_c = (60*frequency)/p; %calcolo della velocità di sincronismo


%Calcolo dello slittamento in funzione della velocità di sincronismo
%ratio = (speed/n_c);
s_pos = 1 - (speed_pos/n_c); 
s_neg = 1 - (speed_neg/n_c);

%percentage_speed = (speed*100)/n_c;

%Calcolo della coppia della macchina asincrona
torque_pos = torque_50Hz(:,2);
torque_neg = torque_50Hz_neg(:,2);

%Rappresentazione del diagramma velocità del rotore (positiva)
figure("Position", [100 100 1400 600])
xlabel('time [s]', 'FontSize', 10);
ylabel('speed [rpm]', 'FontSize', 10);

hold on
plot(time, speed_pos,'LineWidth', 0.5, 'Color', 'b');
title('Rotor speed positive','FontSize',10,'Color', 'r');


%Rappresentazione del diagramma velocità del rotore (negativa)
figure("Position", [100 100 1400 600])
xlabel('time [s]', 'FontSize', 10);
ylabel('speed [rpm]', 'FontSize', 10);

hold on
plot(time, speed_neg,'LineWidth', 0.5, 'Color', 'b');
title('Rotor speed negative','FontSize',10,'Color', 'r');


%Rappresentazione del diagramma coppia - velocità (regioni macchina asincrona)
figure("Position", [100 100 1400 600])
xlabel('slip', 'FontSize', 10);
ylabel('torque [N*m]', 'FontSize', 10);

hold on
plot(s_pos, torque_pos,'LineWidth', 0.5, 'Color', 'b');

hold on
plot(s_neg, torque_neg,'LineWidth', 0.5, 'Color', 'b');


title('Curve coppia - velocità','FontSize',10,'Color', 'r');
