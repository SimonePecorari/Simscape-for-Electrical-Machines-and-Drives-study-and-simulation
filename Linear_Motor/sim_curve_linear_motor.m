% %Individuazione dei parametri per la realizzazione dei plot 
% %force = out.force(:,2);
% force_lead_screw = out.simlog.Lead_screw.f.series.values('N'); % misurata in [N]
% linear_velocity = out.linear_velocity(:,2); % misurata im [mm/s]
% %rotational_velocity = out.rotational_velocity(:,2);
% distance = out.distance(:,2);
% 
% % PLOT: velocità lineare - distanza
% figure("Position",[100, 100, 1400, 600]);
% 
% %Sottografico 1
% subplot(2,2,1);
% plot(distance, linear_velocity,"LineWidth",0.5,'Color','b');
% xlabel('Distance [m]','FontSize',10);
% ylabel('Linear velocity [mm/s]','FontSize',10);
% 
% title("Diagramma distanza [m] velocità lineare [mm/s]", 'FontSize', 10, 'Color', 'r');
% 
% 
% % PLOT: velocità lineare forza
% 
% %Sottografico 2
% subplot(2,2,2);
% plot(force_lead_screw, linear_velocity, "LineWidth", 0.5, 'Color','b');
% xlabel('Force [N]','FontSize',10);
% ylabel('Velocity [mm/s]','FontSize',10);
% 
% title ("Diagramma forza [N] velocità [mm/s]", 'FontSize', 10,'color', 'r');


force = out.simlog.Ideal_Force_Source.f.series.values('N');
linear_speed_m_per_s = out.simlog.Ideal_Translational_Motion_Sensor.V.series.values('m/s');
linear_speed = linear_speed_m_per_s*1000;

% PLOT: velocità lineare forza

% %Sottografico 2
% subplot(2,2,2);
plot(linear_speed, force,  "LineWidth", 0.5, 'Color','b');
xlabel('Velocity [m/s]','FontSize',10);
ylabel('Force [N] ','FontSize',10);

title ("Diagramma velocità [m/s] forza [N] ", 'FontSize', 10,'color', 'r');
