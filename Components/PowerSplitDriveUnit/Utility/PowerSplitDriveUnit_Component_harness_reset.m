function PowerSplitDriveUnit_Component_harness_reset()
%% Reset harness model
% This sets simulation stop time and input block parameters to default settings.
% This is called from the Callback Button block in the harness model.

% Copyright 2022 The MathWorks, Inc.

mdl = "PowerSplitDriveUnit_Component_harness_model";

disp("Resetting the model: " + mdl)

if not(bdIsLoaded(mdl))
  load_system(mdl)
end

% Reset block parameters and initial values
PowerSplitDriveUnit_Component_harness_setup

simIn = Simulink.SimulationInput(mdl);

% Simulaton stop time
simIn = setModelParameter(simIn, StopTime = "100");

simIn = setBlockParameter(simIn, mdl+"/Road grade", Before="0");
simIn = setBlockParameter(simIn, mdl+"/Road grade", Time="1");
simIn = setBlockParameter(simIn, mdl+"/Road grade", After="0");

simIn = setBlockParameter(simIn, mdl+"/Brake force", Before="0");
simIn = setBlockParameter(simIn, mdl+"/Brake force", Time="1");
simIn = setBlockParameter(simIn, mdl+"/Brake force", After="0");

simIn = setBlockParameter(simIn, mdl+"/MG2 torque command", Before="50");
simIn = setBlockParameter(simIn, mdl+"/MG2 torque command", Time="20");
simIn = setBlockParameter(simIn, mdl+"/MG2 torque command", After="40");

simIn = setBlockParameter(simIn, mdl+"/MG1 torque command", Before="0");
simIn = setBlockParameter(simIn, mdl+"/MG1 torque command", Time="60");
simIn = setBlockParameter(simIn, mdl+"/MG1 torque command", After="-10");

simIn = setBlockParameter(simIn, mdl+"/Engine torque command", Before="0");
simIn = setBlockParameter(simIn, mdl+"/Engine torque command", Time="40");
simIn = setBlockParameter(simIn, mdl+"/Engine torque command", After="50");

applyToModel(simIn)

end  % function
