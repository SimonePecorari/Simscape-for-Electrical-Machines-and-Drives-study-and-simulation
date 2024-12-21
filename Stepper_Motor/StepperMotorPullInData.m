% This script assigns datasheet values to MATLAB(R) workspace variables
% for use by the example model StepperMotorPullIn. 
% The model uses the parameters often provided on stepper motor datasheets.

% Copyright 2019-2023 The MathWorks, Inc.

%% Model name 
modelFileName='StepperMotorPullIn'; 

%% Data from stepper motor manufacturer datasheet

%% Electrical parameters
ratedCurrent=1.2; % Rated current (A)
ratedVoltage=5; % Rated voltage (V)

resistance=2.2; % Phase winding resistance (ohms)
inductance=4.6; % Phase winding inductance (mH)

%% Mechanical parameters
fullStepSize=1.8; % Full step size (deg) 

holdingTorque=270; % Holding torque (mNm) 
detentTorque=11; % Detent torque (mNm)

rotorInertia=37e-7;  % Rotor inertia (kg*m^2)

%% Derived stepper motor parameters

kTVal=214; % Motor torque constant (mNm/A) 
% If the torque-speed curve is provided in the datasheet, a good initial assumption for 
% torque constant is the pull-in torque at low speed divided by the rated current.

% If the torque-speed curve is not provided in the datasheet, an alternative initial  
% assumption for torque constant is ((holding torque) - 2*(detent torque))/(rated current))

% kTVal can be used to tune the pull-in characteristics of the motor to
% match the datsheet pull-in performance characteristics.

rotorDamping=0.1e-3;  % Rotor damping (N*m/(rad/s)) 
% If rotor damping coefficients are not given in the datasheet, 
% rotor damping can be varied such that at high step rate torque due to
% rotor damping is equal to value between one to ten percent of the holding torque.
% rotorDamping=holdingTorque*0.01*1e-3/(maximum Step rate in curve*fullStepSize*pi/180); 

% rotorDamping value can be used to tune the pull-in characteristics of the motor to
% match the datasheet pull-in performance characteristics.

%% Initial conditions
initialSpeed=0; % Initial speed (rpm),
initialAngle=0; % Initial angle (deg);

%% Drive model
numMicroStep=24; % Number of microsteps

driveVoltage=24;   % Input voltage to the stepper motor driver (V)

voltageFactor=driveVoltage/ratedVoltage; % Voltage factor is the ratio between 
% drive voltage and rated voltage of the stepper motor. If the stepper motor is driven 
% with higher than the rated voltage than it improves the rate of rise of the stepper motor 
% input current to overcome the effects of motor winding time constant.

driveRampRate=-1/log(1-(1-exp(-1))/voltageFactor); % Equivalent reduction in winding 
% time constant to simulate the higher drive voltage.
% In this example, the stepper motor driver is modeled using the current source with a
% first order filter. Effects of the winding time constant and increased input
% voltage on the current source is modeled using a first order filter with 
% the time constant equal to
% (phase winding inductance)/(driveRampRate*(phase winding resistance)). 

CF=sqrt(2); % Current factor
% In microstep drive, peak of sinusoidal input current=CF*ratedCurrent
% It is to compensate the reduction in torque due to microstepping.
% For fullstep operation CF=1.

%% Load model

% The torque-speed characteristics of a stepper motor depends on the type of load
% connected to the rotor shaft. The load will have its own inertia and damping. 
% In general, for high step rate operation, it is advisable to have a load inertia 
% less than three times that of the rotor inertia. 
% For lower step rates, load inertia must still be less than ten times the rotor inertia.
loadDamping=0; 
loadInertia=6.0*rotorInertia; % kg*m^2

% In this example, a combination of rotational damper and active load
% torque is used to test the stepper motor.

LF=1; % Load factor, it is always less than one. 
% When a manufacturer creates a pull-in curve, typically they either use a dyno setup with 
% active torque control or they use some frictional load. 
% Load factor sets the fraction of total load torque that is active:
%           Active load torque= LF*Load torque, 
%           Rotational frictional load=(1-LF)*Load torque.

%% Test harness parameters
numRotation=1; % Number of stepper motor rotations used to find pull-in characteristics

tolerance=2; % Number of full steps error when detecting slip
torqueTolerance=1; % Torque tolerance (mNm)
% Torque tolerance is always set less than the 5 % of holding torque.

% Step rate for which pull-in torque is estimated
stepRateVector=[200 250 300 350 425 500 575 650 775 850 1000 1500 2000]; % steps/sec

plotXAxis=2; % X-axis parameter against which pull-in torque is plotted
% 1- Electrical frequency of the drive current (Hz)
% 2- Step rate (steps/s)
% 3- Angular speed (deg/s)
% 4- Speed (rpm)

%% Default test case data

stepRate=300; % Step rate (steps/s)
loadTorque=125; % Load torque (mNm)

% Estimate simulation time
loadCycle=floor(numRotation*360/(4*fullStepSize)); % Number of input current cycles required
numStep=4*numMicroStep*loadCycle; % Number of microsteps
timeSimulation=numStep/(numMicroStep*stepRate); % Convert to simulation time (s)
f=stepRate/4; % Input current frequency (Hz) 








