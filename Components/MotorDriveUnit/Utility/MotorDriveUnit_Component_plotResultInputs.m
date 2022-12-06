function MotorDriveUnit_Component_plotResultInputs(nvpairs)
% plots the simulation result.

% Copyright 2021 The MathWorks, Inc.

arguments
  nvpairs.SimData timetable
  nvpairs.PlotParent (1,1) matlab.ui.Figure
end

if not(isfield(nvpairs, "PlotParent"))
  fig = figure;
else
  fig = nvpairs.PlotParent;
end

simResult = nvpairs.SimData;

timeData = simResult.Time;

clutchData = simResult.("ClutchSw");
axleSpeedInputData = simResult.("AxleSpdIn");
axleTorqueInputData = simResult.("AxleTrqIn");
torqueCommandData = simResult.("TrqCmd");

numPlots = 0;
if numel(clutchData) > 1 && not(isnan(clutchData(2)))
  numPlots = numPlots + 1;
end
if numel(axleSpeedInputData) > 1 && not(isnan(axleSpeedInputData(2)))
  numPlots = numPlots + 1;
end
if numel(axleTorqueInputData) > 1 && not(isnan(axleTorqueInputData(2)))
  numPlots = numPlots + 1;
end
if numel(torqueCommandData) > 1 && not(isnan(torqueCommandData(2)))
  numPlots = numPlots + 1;
end

if numPlots == 0
  disp("All input signals have initial values only. No plot is made.")
  disp("Clutch switch: " + clutchData(1))
  disp("Axle speed input: " + axleSpeedInputData(1))
  disp("Axle torque input: " + axleTorqueInputData(1))
  disp("Motor torque command: " + torqueCommandData(1))
  return
end

%%
fig.Position(3:4) = [700 numPlots*150];  % width height

tl = tiledlayout(fig, numPlots, 1);

if numel(clutchData) > 1 && not(isnan(clutchData(2)))
  ax = nexttile(tl);
  plot(ax, timeData, clutchData, LineWidth=2)
  hold on;  grid on
  xlabel("Time (s)")
  title("Clutch on off")
  hold off
end

if numel(axleSpeedInputData) > 1 && not(isnan(axleSpeedInputData(2)))
  ax = nexttile(tl);
  plot(ax, timeData, axleSpeedInputData, LineWidth=2)
  hold on;  grid on
  xlabel("Time (s)")
  title("Axle speed input")
  hold off
end

if numel(axleTorqueInputData) > 1 && not(isnan(axleTorqueInputData(2)))
  ax = nexttile(tl);
  plot(ax, timeData, axleTorqueInputData, LineWidth=2)
  hold on;  grid on
  xlabel("Time (s)")
  title("Axle torque input")
  hold off
end

if numel(torqueCommandData) > 1 && not(isnan(torqueCommandData(2)))
  ax = nexttile(tl);
  plot(ax, timeData, torqueCommandData, LineWidth=2)
  hold on;  grid on
  xlabel("Time (s)")
  title("Motor torque command input")
  hold off
end

end
