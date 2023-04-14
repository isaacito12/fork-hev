classdef PowerSplitHEV_DirectInput_UnitTest < matlab.unittest.TestCase
% Class implementation of unit test

% Copyright 2021-2023 The MathWorks, Inc.

properties (Constant)
  modelName = "PowerSplitHEV_system_model";
end

methods (TestClassSetup)
%% Functions to be executed when this unit test class is instanciated.

function setReferencedSubsystems(testCase)
%% Set referenced subsystems for this unit test.
% Note that other referenced subsystems may also be used in some tests.

  disp("Running a function from TestClassSetup...")

  % Teardown sets a function to be executed when the class object is destroyed.
  % In this case, recover the "global default" referenced subsystems.
  addTeardown(testCase, @PowerSplitHEV_resetReferencedSubsystems, testCase.modelName)

  defineBus_HighVoltage
  defineBus_Rotational

  mdl = testCase.modelName;
  load_system(mdl)

  set_param( mdl + "/Controller & Environment", ...
    ReferencedSubsystem = "PowerSplitHEV_DirectInput_refsub");

  set_param( mdl + "/High Voltage Battery", ...
    ReferencedSubsystem = "BatteryHV_refsub_Basic");

  set_param( mdl + "/DC-DC Converter", ...
    ReferencedSubsystem = "DcDcConverterElec_refsub");

  set_param( mdl + "/Power Split Drive Unit", ...
    ReferencedSubsystem = "PowerSplitDriveUnit_refsub_Basic");

  set_param( mdl + "/Longitudinal Vehicle", ...
    ReferencedSubsystem = "Vehicle1D_refsub_Basic");

  save_system(mdl)

end  % function

end  % methods (TestClassSetup)

methods (Test)
%% Test for Models

function openAndRun_1(~)
  close all
  bdclose all
  mdl = "PowerSplitHEV_system_model";

  defineBus_HighVoltage
  defineBus_Rotational

  evalin("base", "PowerSplitHEV_params")
  load_system(mdl)
  simIn = Simulink.SimulationInput(mdl);
  simIn = setModelParameter(simIn, StopTime ="10");
  sim(simIn);
  close all
  bdclose all
end  % function

function openAndRun_2_1(testCase)
%% Check that the model runs without any warnings or errors.
% Test referenced subsystems that are different from this unit test's default.

  close all
  bdclose all

  mdl = testCase.modelName;

  t_end = 10;  % Simulation stop time in seconds

  defineBus_HighVoltage
  defineBus_Rotational

  load_system(mdl)

  evalin("base", "BatteryHV_refsub_System_params")
  set_param(mdl+"/High Voltage Battery", ...
    ReferencedSubsystem = "BatteryHV_refsub_System")

  set_param(mdl+"/DC-DC Converter", ...
    ReferencedSubsystem = "DcDcConverterBasic_refsub")

  simIn = Simulink.SimulationInput(mdl);
  simIn = setModelParameter(simIn, "StopTime",num2str(t_end));
  sim(simIn);

  close all
  bdclose all
end  % function

function openAndRun_2_2(testCase)
%% Check that the model runs without any warnings or errors.
% Test referenced subsystems that are different from this unit test's default.

  close all
  bdclose all

  mdl = testCase.modelName;

  t_end = 10;  % Simulation stop time in seconds

  defineBus_HighVoltage
  defineBus_Rotational

  load_system(mdl)

  evalin("base", "BatteryHV_refsub_SystemSimple_params")
  set_param(mdl+"/High Voltage Battery", ...
    ReferencedSubsystem = "BatteryHV_refsub_SystemSimple")

  set_param(mdl+"/DC-DC Converter", ...
    ReferencedSubsystem = "DcDcConverterElec_refsub")

  simIn = Simulink.SimulationInput(mdl);
  simIn = setModelParameter(simIn, "StopTime",num2str(t_end));
  sim(simIn);

  close all
  bdclose all
end  % function

%% Test for Scripts
% Check that scripts run without any warnings or errors.

function runLiveScript_DirectInput_Constant(~)
  close all
  bdclose all

  % The "Constant" simulation is the most basic simulation
  % where nothing interesting happens,
  % but this ensures that everything in the script works fine.
  PowerSplitHEV_DI_testcase_Constant

  close all
  bdclose all
end

function runLiveScript_DirectInput_Downhill(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_Downhill
  close all
  bdclose all
end

function runLiveScript_DirectInput_Downhill_2(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_Downhill_2
  close all
  bdclose all
end

function runLiveScript_DirectInput_EngineDrive(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_EngineDrive
  close all
  bdclose all
end

function runLiveScript_DirectInput_MG1Drive(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_MG1Drive
  close all
  bdclose all
end

function runLiveScript_DirectInput_MG2Drive(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_MG2Drive
  close all
  bdclose all
end

function runLiveScript_DirectInput_MG2Drive_2(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_MG2Drive_2
  close all
  bdclose all
end

function runLiveScript_DirectInput_MG2Drive_StartEng(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_MG2Drive_StartEngine
  close all
  bdclose all
end

function runLiveScript_DirectInput_MG2Drive_StartEng_2(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_MG2Drive_StartEngine_2
  close all
  bdclose all
end

function runLiveScript_DirectInput_Parked_EngChgBatt(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_Parked_EngineChargeBattery
  close all
  bdclose all
end

function runLiveScript_DirectInput_PowerSplitDrive(~)
  close all
  bdclose all
  PowerSplitHEV_DI_testcase_PowerSplitDrive
  close all
  bdclose all
end

function runLiveScript_main_script(~)
  close all
  bdclose all
  PowerSplitHEV_DirectInput_main_script
  close all
  bdclose all
end

end  % methods (Test)
end  % classdef
