%% CALCOLO EFFICIENZA
%Un'analisi da poter effettuare considera l'efficienza come
%efficienza = Potenza_diss_mech / Potenza_diss_elect

power_mech_diss = out.simlog.Rotational_Friction.power_dissipated.series.values('W'); %matrice della potenza meccanica in output
power_elec_diss = out.simlog.DC_Motor.power_dissipated.series.values('W'); %matrice della potenza elettrica in input
rotational_velocity = out.rotational_velocity(:,2); %velocità di rotazione
linear_velocity = out.simlog.Ideal_Translational_Motion_Sensor.V.series.values('m/s');
time = out.linear_velocity(:,1);

efficiency = zeros(229, 1); %calcolo efficienza del motore 

dimensions_matrix = size(power_mech_diss);

for i= 1:dimensions_matrix
    efficiency(i) = power_mech_diss(i)/power_elec_diss(i);
end

%Plot andamento efficienza del motore in funzione della velocità di
%rotazione

figure("Position",[100, 100, 1400, 600]);

% %Sottografico 1: efficienza nel tempo
% subplot(2,2,1);

xlabel('Tempo (s)','FontSize',10);
xlim([0 10]);
ylabel('Efficienza','FontSize',10);
ylim([0 20]); 

title("Efficienza nel tempo", 'FontSize', 10);
hold on
plot(time, efficiency,'LineWidth', 0.5, 'Color', 'b');




