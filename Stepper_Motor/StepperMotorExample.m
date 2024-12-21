%% Stepper Motor Drive  
%
% This example shows a model of a hybrid stepper motor drive.
%
% Hoang Le-Huy, Laval University

% Copyright 1997-2012 Hydro-Quebec, and The MathWorks, Inc.

%%

open_system('StepperMotor')

%% Description
%
% This example presents a stepper motor drive using the Hybrid Two-Phase model selected among the options on the dialog window. 
% The motors parameters are those of a small stepper motor (size 23). The motor phases are fed by two H-bridge MOSFET PWM converters. 
% The DC bus is represent by a 28-V DC voltage source. The motor currents are independently regulated by two hysteresis-based controllers
% that generate the MOSFETs drive signals by comparing the measured currents with their references. The ripple in the current waveforms 
% is controlled by the hysteresis band of the comparators. The switching frequency is variable and dependent on the motor parameters.
%
% In this example, single-phase-on excitation scheme is used because of its simplicity. Square-wave current references are
% generated using the current amplitude and the step frequency parameters specified in the dialog window.
% The movement of the stepper drive is controlled by the STEP and DIR signals received from Signal Builder block.
%

%% Simulation
%
% The current amplitude and the stepping rate are selected in the dialog mask to be 2A and 500 step/s, respectively. 
% The STEP signal from the Signal Builder block controls the movement of the stepper drive. A positive value (1.0) will make the
% motor rotating and a zero value will stop the rotation. The DIR signal controls the rotation direction. A positive value (1.0) will
% impose the positive direction while a zero value will impose the reverse direction.
% The stepper motor drive operation is illustrated by the main waveforms (voltages, currents, torque, speed and position)
% displayed on the Scope block.
% The simulation is done using a fixed-step solver with a sampling time of 1 us, providing acceptable accuracy for the PWM.
% If a high PWM accuracy is required, a smaller time step can be used but the simulation will be slower. 
%

%%

