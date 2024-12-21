%% Linear Electric Actuator (Motor Model)
% 
% This model shows how to develop a model of an uncontrolled linear
% actuator using datasheet parameter values. The actuator consists of a DC
% motor driving a 6.25:1 worm gear which in turn drives a 3mm lead screw to
% produce linear motion. Manufacturer data for the actuator defines the
% no-load linear speed (26mm/s), rated load (1000N), rated-load linear
% speed (19mm/s), and maximum current (5A). The maximum static force is
% 4000N and the rated voltage is 24V DC.
% 
% If friction and rotor damping are neglected, the DC Motor mask parameters
% can be  calculated as follows. A no-load speed of 26mm/s is equivalent to
% (26/3)*6.25*60=3250rpm. The rated motor speed is (19/3)*6.25*60=2375rpm,
% and the rated power is 1000N*19e-3m/s=19W. To run the model based on
% these parameters, set the DC Motor Model parameterization parameter to By
% rated power, rated speed & no-load speed and comment out the Friction
% block. The results validate the speeds for zero and 1000N load, but
% under-predict the maximum current and maximum static force.
% 
% For a more accurate approximation of the motor, friction effects must be
% included. The no-load and rated-load speed information depends on the
% unknown friction levels, so instead we parameterize the motor in terms of
% the maximum current which occurs when the rotor is locked (i.e. no  back
% emf). Then the winding resistance is given by rated voltage divided by
% maximum current i.e. 24V/5A = 4.8 ohms. The no-load current, measured to
% be 0.35A, indirectly provides information about the friction. Given this
% value, the torque constant is given by maximum static torque divided by
% the net useful current i.e. (4000N*3e-3m/s/(2*pi*6.25))/(5A-0.35A) =
% 0.066Nm/A. To run the model based on these parameters, set the DC Motor
% Model Parameterization parameter to By equivalent circuit parameters and
% reinstate the Friction block. The torsional friction must now be
% determined such that the no-load speed is 26mm/s. A value of 0.022Nm is
% required to achieve this. The model also confirms maximum current is 5A
% and maximum linear force is 4000N.
% 
% Note that a limitation of this model is that the load can back drive the
% motor through the worm gear. A more detailed friction model would be
% required to prevent this.
% 
% 
% 
% 

% Copyright 2008-2023 The MathWorks, Inc.



%% Model

open_system('LinearActuatorMotor')

set_param(find_system('LinearActuatorMotor','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the performance of the motor compared to values
% found on the datasheet for a linear actuator. The test includes no load,
% rated load, and max load. The motor speed and currents match the
% specification closely, indicating that we have assigned parameter values
% that match the datasheet.
%


LinearActuatorMotorPlotSpeed;

%% Results from Real-Time Simulation
%%
%
% This example has been tested on a Speedgoat Performance real-time target 
% machine with an Intel(R) 3.5 GHz i7 multi-core CPU. This model can run 
% in real time with a step size of 30 microseconds.

%%

