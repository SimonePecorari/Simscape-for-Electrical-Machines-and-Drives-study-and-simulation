% Code to regenerate the stepper motor pull-in torque characteristics
% shipped with example StepperMotor_pulin_characteristics

%% Description:
%
% This script shows how to generate a pull-in torque curve starting with
% information extracted from a manufacturer datasheet. Often the datasheet
% will also contain a pull-in plot, and this, along with this script, can
% be used to help validate the parameterization of the library stepper
% motor block. Having validated your parameterization, this script can then
% be used to generate a pull-in curve for your application by replacing
% the load torque with the inertial and damping properties for your system.

% Copyright 2019-2023 The MathWorks, Inc.

%% Load the tabulated datasheet information and load the test harness
StepperMotorPullInData;

nF = length(stepRateVector); % Number of step rate values for which pull-in
% torque is generated.

%% Use the test harness to generate pull-in data
% To find the load value at which the motor will slip requires the load
% value to be iterated on, simulating each time to see if slip occurs. This
% is implemented using the while loop below.
%
% To provide a plot of maximum load torque as a function of step rate, the
% load which just causes slip must be searched for over a range of initial
% step rates. This is implemented using the for loop below.

% Loop initialization
torque = zeros(nF,1);
stepRateVectorSimulated = stepRateVector;

loadTorqueLow=0.1*holdingTorque;
loadTorqueHigh=1.2*holdingTorque;

loadTorqueLowInitial=loadTorqueLow;
loadTorqueHighInitial=loadTorqueHigh;


for i=1:nF % Loop over step rates
    
    f = stepRateVector(i)/4;
    timeSimulation=numStep/(4*numMicroStep*f); % Simulation time for numStep steps
    stepRateVectorSimulated(i)=4*f;
    fprintf('** Finding maximum pull-in torque for step rate= %3.2f steps/sec ** \n',4*f);
    
    % While loop to find critical load torque
    loadTorqueLow=0.1*holdingTorque;  % Minimum load torque to try
    loadTorqueHigh=1.2*holdingTorque; % Maximum load torque to try
    notFinished = 1; % Flag that becomes zero when converged
    while notFinished
        slipped = false;
        loadTorque = (loadTorqueHigh+loadTorqueLow)/2; % Next load torque to try
        
        % Simulate the model
        try
            sim(modelFileName);
        catch % The model generates a warning if slip occurs
            slipped = true;
            disp('Initiating next iteration with different load torque');
        end
        
        % Narrow the search range
        if slipped
            loadTorqueHigh = loadTorque; % New upper limit
        else
            loadTorqueLow = loadTorque;  % New lower limit
        end
        
        % Detect torque convergence
        if abs(loadTorqueHigh-loadTorqueLow)<torqueTolerance
            notFinished = 0;
        end
    end
    
    if loadTorque > loadTorqueLowInitial + torqueTolerance && loadTorque < loadTorqueHighInitial-torqueTolerance
        torque(i) = loadTorque;
    else
        torque(i) = NaN; % Failed to find a solution
    end
    fprintf('** Pull-in torque at step rate= %3.2f steps/s= %3.2f mNm ** \n',4*f,loadTorque);
end


%% Plot results
% Reuse figure if it exists, else create new figure
if ~exist('figHandleMotorStepper', 'var') || ~isgraphics(figHandleMotorStepper, 'figure')
    figHandleMotorStepper=figure('Name','Stepper motor pull-in characteristics');
end
figure(figHandleMotorStepper);
clf(figHandleMotorStepper);
figAxes=axes;
% Plot pull-in characteristics
switch plotXAxis
    case 1
        plot(figAxes,stepRateVectorSimulated/4,torque,'LineWidth',2);
        xlabel('Drive current frequency (Hz)','FontSize',13);
    case 2
        plot(figAxes,stepRateVectorSimulated,torque,'LineWidth',2);
        xlabel('Step rate (steps/s)','FontSize',13);
    case 3
        plot(figAxes,stepRateVectorSimulated*fullStepSize,torque,'LineWidth',2);
        xlabel('Angular speed (deg/s)','FontSize',13);
    case 4
        plot(figAxes,stepRateVectorSimulated*fullStepSize*60/360,torque,'LineWidth',2);
        xlabel('Angular speed (rpm)','FontSize',13);
    otherwise
        plot(figAxes,stepRateVectorSimulated,torque,'LineWidth',2);
        xlabel('Step rate (steps/s)','FontSize',13);
end

ylabel('Load torque (mNm)','FontSize',13);
title('Pull-in Characteristic of a Two-Phase Stepper Motor');
set(figAxes,'FontSize',12);
grid on
box on
clear figAxes;
