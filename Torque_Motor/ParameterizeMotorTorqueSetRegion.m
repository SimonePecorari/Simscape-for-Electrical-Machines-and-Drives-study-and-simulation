function ParameterizeMotorTorqueSetRegion(modelname,region)
% ParameterizeMotorTorqueSetRegion This function is a helper function
% for the example ParameterizeMotorTorque.

% Copyright 2016-2023 The MathWorks, Inc.

if strcmp(region,'Full')
    x0 =    '0';
    xmin =  '0';
    xmax = '90';
    v0 =   '13.5';
elseif strcmp(region,'Linear')
    x0 =   '20';
    xmin = '20';
    xmax = '70';
    v0 =   '3.5';
end

% Set hard stop parameters to limit motor rotation
evalin('base',['x0 = ' x0 ';']);
evalin('base',['xmin = ' xmin ';']);
evalin('base',['xmax = ' xmax ';']);

set_param([modelname '/Vsrc1'],'v0',v0);
set_param([modelname '/Vsrc2'],'v0',v0);
end
