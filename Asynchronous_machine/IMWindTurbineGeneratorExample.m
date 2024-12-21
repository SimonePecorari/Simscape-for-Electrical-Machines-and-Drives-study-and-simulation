%% Three-Phase Asynchronous Wind Turbine Generator
% 
% This example shows an induction machine used as a wind turbine generator.
% The Simple Turbine block converts wind speed to turbine output power by a
% simple output power versus wind speed characteristic.
% 
% When the wind speed is below the cut-in speed or above the cut-out speed,
% the machine generates zero real power. The machine always consumes
% reactive power. The Reactive Compensation block offsets the machine's
% reactive power requirement.
% 
% The local load consumes 75kW. The infeed from the power grid meets any
% wind turbine generation shortfall. When the generator produces more than
% 75kW, excess power is exported to the grid.
%
% The reactive power compensator is dimensioned to supply 90 kvar when a 440 V
% phase-to-phase voltage is applied across its terminals.
% 

% Copyright 2014-2023 The MathWorks, Inc.


%% Model

open_system('IMWindTurbineGenerator')

set_param(find_system('IMWindTurbineGenerator','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Simulation Results from Simscape Logging
%%
%
% The plot below shows the input wind speed and output power of the Simple turbine block. 
%

IMWindTurbineGeneratorPlotResults;

%% Results from Real-Time Simulation
%%
%
% This example has been tested on a Speedgoat Performance real-time target 
% machine with an Intel(R) 3.5 GHz i7 multi-core CPU. This model can run 
% in real time with a step size of 100 microseconds.

%%

