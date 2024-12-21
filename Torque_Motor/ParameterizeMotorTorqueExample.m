%% Torque Motor Parameterization
% 
% This example shows how manufacturer data for torque as a function of
% current and angle can be used to model a torque motor. The datasheet
% shows linear characteristics for rotor angles between 20 and 70 degrees
% and for currents where saturation does not occur. Data in this range is
% used to parameterize the simplified model of the torque motor.  Using
% MATLAB(R) to process the data points extracted from the datasheet, we can
% convert manufacturer data into motor parameters that are often obtained
% from finite element software.
%
% The motor models show similar results when tested under conditions where
% the datasheet shows linear behavior.  When tested over the full range,
% the behaviors deviate as specified in the datasheet.
% 
% 

% Copyright 2008-2023 The MathWorks, Inc.



%% Model

open_system('ParameterizeMotorTorque')

set_param(find_system('ParameterizeMotorTorque','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Rotary Actuator Simplified Subsystem

open_system('ParameterizeMotorTorque/Rotary Actuator Simplified ','force')

%% Obtaining Motor Data from Data Sheet
%%
% The plot below shows resampled data obtained from a motor data sheet.  It
% shows torque produced at different rotor angles at different current
% levels.  For some conditions (such as 2 amps, 20 deg to 70 deg), the
% torque is constant, but at other levels it is highly nonlinear.

ParameterizeMotorTorqueParameters;
close(h3_ParameterizeMotorTorque);
close(h4_ParameterizeMotorTorque);
close(h5_ParameterizeMotorTorque);

%%
% To parameterize our motor model, we need to obtain flux partial
% derivative with respect to angle. This script estimates dPhi/dx from
% torque.  First, we mirror the datasheet to obtain data for negative
% currents and plot it as a surface.

ParameterizeMotorTorqueParameters;
close(h2_ParameterizeMotorTorque);
close(h4_ParameterizeMotorTorque);
close(h5_ParameterizeMotorTorque);

%%
% Next, we use MATLAB to fit polynomial curves to the surface along lines
% of constant angle.

ParameterizeMotorTorqueParameters;
close(h2_ParameterizeMotorTorque);
close(h3_ParameterizeMotorTorque);
close(h5_ParameterizeMotorTorque);

%%
% Finally, we use MATLAB to obtain the derivative of the polynomial along
% those curves.  Extracting a lookup table from this surface yields the
% parameters we need for our motor model.

ParameterizeMotorTorqueParameters;
close(h2_ParameterizeMotorTorque);
close(h3_ParameterizeMotorTorque);
close(h4_ParameterizeMotorTorque);

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the behavior of the FEM-Parameterized Rotary
% Actuator and simplified model built from Simscape(TM) Foundation Library
% elements.  This test was performed over the range of travel where the
% finite-element data is linear, so the results are similar.
%

ParameterizeMotorTorqueSetRegion('ParameterizeMotorTorque','Linear');
ParameterizeMotorTorquePlotAngle;

%%
%
% Performing the test over wider range over the range of travel where the
% finite-element data is nonlinear shows the effect of our parameterization
% as two motors behave very differently.
%

ParameterizeMotorTorqueSetRegion('ParameterizeMotorTorque','Full');
sim('ParameterizeMotorTorque');
ParameterizeMotorTorquePlotAngle;

%% Results from Real-Time Simulation
%%
%
% This example has been tested on a Speedgoat Performance real-time target 
% machine with an Intel(R) 3.5 GHz i7 multi-core CPU. This model can run 
% in real time with a step size of 50 microseconds.

%%

