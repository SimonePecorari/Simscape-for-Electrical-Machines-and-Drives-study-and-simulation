% Code to plot pull-in torque characteristics of the stepper motor

%% Plot Description:
%
% This script plots the pre-simulated pull-in torque curves based on
% example datasheet. The plots can be used to show that the stepper motor
% library component has been correctly parameterized using datasheet
% numerical values.

% Copyright 2019-2023 The MathWorks, Inc.

%% Loading the datahseet and simulated data from the model
load 'StepperMotorPullin.mat';

%% Create figure for the results
if ~exist('figHandlePlotMotorStepper', 'var') || ~isgraphics(figHandlePlotMotorStepper, 'figure')
    figHandlePlotMotorStepper=figure('Name','StepperMotorPullIn');
end
figure(figHandlePlotMotorStepper);
clf(figHandlePlotMotorStepper);
figAxes=axes;

%% Plotting pull-in characteristics
switch plotXAxis
    case 1
        plot(figAxes,stepRateVectorDatasheet/4,torqueDatasheet,'LineWidth',2);
        hold all
        plot(figAxes,stepRateVectorSingle/4,torqueSingle,'LineWidth',2);
        xlabel('Drive current frequency (Hz)','FontSize',13);
    case 2
        plot(figAxes,stepRateVectorDatasheet,torqueDatasheet,'LineWidth',2);
        hold all
        plot(figAxes,stepRateVectorSingle,torqueSingle,'LineWidth',2);
        xlabel('Step rate (steps/s)','FontSize',13);
    case 3
        plot(figAxes,stepRateVectorDatasheet*fullStepSize,torqueDatasheet,'LineWidth',2);
        hold all
        plot(figAxes,stepRateVectorSingle*fullStepSize,torqueSingle,'LineWidth',2);
        xlabel('Angular speed (deg/s)','FontSize',13);
    case 4
        plot(figAxes,stepRateVectorDatasheet*fullStepSize*60/360,torqueDatasheet,'LineWidth',2);
        hold all
        plot(figAxes,stepRateVectorSingle*fullStepSize*60/360,torqueSingle,'LineWidth',2);
        xlabel('Angular speed (rpm)','FontSize',13);
    otherwise
        plot(figAxes,stepRateVectorDatasheet,torqueDatasheet,'LineWidth',2);
        hold all
        plot(figAxes,stepRateVectorSingle,torqueSingle,'LineWidth',2);
        xlabel('Step rate (steps/s)','FontSize',13);
end

ylabel('Load torque (mNm)','FontSize',13);
title('Pull-in Characteristics of a Two-Phase Stepper Motor');
set(figAxes,'FontSize',12);
ylim([0 1.1*max(max(torqueSingle),max(torqueDatasheet))]);
xlim([0 1.1*max(max(stepRateVectorDatasheet),max(stepRateVectorSingle))]);
grid on
box on
legend('Datasheet','Simulated');
clear figAxes;
