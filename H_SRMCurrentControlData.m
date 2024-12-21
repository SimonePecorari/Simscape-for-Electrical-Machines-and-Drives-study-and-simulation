%% Parameters for Switched Reluctance Machine Current Control Example

% This example shows how to control the current amplitude in a switched 
% reluctance machine (SRM) based electrical drive. A DC voltage source 
% feeds the SRM through a controlled three-arm bridge. An ideal angular 
% velocity source provides the load. The converter turn-on and turn-off 
% angles are maintained constant. A PI-based current controller regulates 
% the current amplitude.

% Copyright 2017-2023 The MathWorks, Inc.

%% System Parameters
imax = 180;   % Maximum phase current       [A]
Rs   = 3;     % Stator resistance per phase [Ohm]
p    = 4;     % Number of rotor poles
Vdc  = 400;   % DC voltage                  [V] 

load SRMFluxCharacteristic;  % load SRM flux characteristic

%% Control Parameters
Ts  = 5e-6;  % Fundamental sample time [s]
Tsc = 10*Ts; % Control sample time     [s]

Kp  = 0.001; % Current controller proportional gain
Ki  = 0.05;  % Current controller integrator gain
Kaw = 1000;  % Current controller anti-windup gain
