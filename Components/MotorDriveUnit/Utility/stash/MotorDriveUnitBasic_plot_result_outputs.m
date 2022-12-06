function MotorDriveUnitBasic_plot_result_outputs(nvpairs)
% plots the simulation result.

% Copyright 2021 The MathWorks, Inc.

arguments
  nvpairs.SimData timetable
  nvpairs.PlotParent (1,1) matlab.ui.Figure
end

logsout = nvpairs.SimData;
parent = nvpairs.PlotParent;

timeData = simResult.Time;

motorSpeedData = simResult.("Motor Speed");
torqueCommandData = simResult.("Torque Command");
motorTemperatureData = simResult.("Motor Temperature");
axleSpeedData = simResult.("Axle Speed");

batteryPowerData = simResult.("HV Battery Power");
batteryPowerLossData = simResult.("HV Battery Power Loss");

batteryCurrentData = simResult.("HV Battery Current");
batteryVoltageData = simResult.("HV Battery Voltage");

batteryChargeData = simResult.("HV Battery Charge");
batterySOCData = simResult.("HV Battery SOC");

%%
parent.Position(3:4) = [700 500];  % width height

tl = tiledlayout(parent, 2, 2);

ax = nexttile(tl);
vals = logsout.get("Motor Speed").Values;
plot(ax, vals.Time, vals.Data, 'LineWidth',2)
hold on;  grid on
xlabel("Time (s)")
title("Motor Speed (rpm)")
hold off

ax = nexttile(tl);
vals = logsout.get("Motor Torque").Values;
plot(ax, vals.Time, vals.Data, 'LineWidth',2)
hold on;  grid on
xlabel("Time (s)")
title("Motor Torque (N*m)")
hold off


ax = nexttile(tl);
vals = logsout.get("Electrical Loss").Values;
plot(ax, vals.Time, vals.Data/1000, 'LineWidth',2)  % W to kW conversion
hold on;  grid on
xlabel("Time (s)")
xlim([0 inf])
title("Electrical Loss (kW)")
hold off

ax = nexttile(tl);
vals = logsout.get("Mechanical Power").Values;
plot(ax, vals.Time, vals.Data/1000, 'LineWidth',2)  % W to kW conversion
hold on;  grid on
xlabel("Time (s)")
xlim([0 inf])
title("Mechanical Power (kW)")
hold off



end
