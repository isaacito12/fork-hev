# Change Log

_Copyright 2021-2023 The MathWorks, Inc._

## Version 2.1

Component

- High voltage battery component has been updated to use the one developed
  for [Battery Electric Vehicle model][utl-gh-bev].

MATLAB Release

- All model files have been saved in R2023a.

[url-gh-bev]: https://github.com/mathworks/Simscape-Battery-Electric-Vehicle-Model

## Version 2.0

- The project has been upgraded to MATLAB R2023a.
- A shortcut button to open [MATLAB Test Manager][url-mltestmgr] is added to
  the Project Shortcut tab in the toolstrip.

[url-mltestmgr]: https://www.mathworks.com/help/matlab-test/ref/matlabtestmanager-app.html

## Version 1.6

- Signal Source Block Library (`Utility` > `SignalDesigner` folder)
  is newly introduced to replace Input Signal Builder
  for streamlined workflow to design and use input signals.
  In this update, it is used in the harness model for
  Power Split Drive Unit component.
  It will be deployed to other models in future updates.
- Motor Drive Unit (MDU) component is revamped with
  a new harness model and tests.
- Motor Generator 1 (MG1) and Motor Generator 2 (MG2) components
  are updated to use the new MDU component.
- Engine component is revamped using Generic Engine block in
  Simscape Driveline which now supports torque command input
  for hybrid vehicle applications.
  Tests are updated too.
- Power Split Drive Unit is revamped with the updated motor drive unit
  and engine components as well as the new Signal Source Block Library.
- All test cases of Power-Split HEV system model with direct torque input
  (`HEV` > `PowerSplitHEV_DirectInput`)
  now work properly without any warnings during simulation.

## Version 1.5

- Simulink Connection Bus is used in all high-voltage electrical ports.
- Motor drive unit component uses
  Motor & Drive block from simscape Driveline.
- Motor drive unit component has been updated with
  new harness model and tests.

## Version 1.4

Features

- Simulink Connection Bus for Simscape,
  which was newly introduced in R2021b,
  is used to define high-voltage line connection
  for Simscape Bus block.
  Connection Bus definition makes the use of Simscape Bus more robust.
  See the `interface` folder for the definition.

Models

- High-voltage battery component has two new referenced subsystems,
  and now there are 3 models.
  First one is a simple iosthermal model as included from the first release.
  Second one (new in this version) uses System-Level Battery block
  from Simscape Driveline, and it can simulate battery temeprature.
  Third one (new in this version) uses Battery block
  from Simscape Electrical, and it can simulate more
  battery characteristics such as fade.

## Version 1.3 (April, 2022)

MATLAB Release

- This version requires MATLAB R2022a or newer.

Project

- Files and folders are reorganized.

Models

- Simulink model files are saved in `mdl` format.
  Starting from R2021b, MDL format is based the new text format
  which is feature parity with binary SLX format.
- Longitudinal Vehicle block from Simscape Driveline is
  added as a new (and default) Referenced Subsystem.
  The previous custom block is still included too.

GitHub Repository

- GitHub Pages is enabled:
  https://mathworks.github.io/Simscape-Hybrid-Electric-Vehicle-Model/

## Version 1.2 (April, 2022)

MATLAB Release

- This version requires MATLAB R2021a or newer.

Highlights

- **MATLAB Unit Test** files are added for some models and scripts.
  More will be added in the coming updates.
- **GitHub Actions** continuous integration is used to automatically
  run unit tests when the repository in GitHub gets updated.
  - Set-up file: `.github/workflow/ci.yml`
  - For more general information about using GitHub Actions with MATLAB,
    see [MATLAB Actions](https://github.com/matlab-actions/overview).

Models

- Power-Split HEV system model is refactored to clean up.
  Previously two separate system models existed
  for speed tracking simulation and direct torque input simulation.
  They are now merged into one.
- Battery block from Simscape Electrical is added as
  a new referenced subsystem for High-Voltage Battery component.
  The previous model is included as well.
- DC-DC Converter block from Simscape Electrical is added as
  a new referenced subsystem for DC-DC Converter component.
  The previous model is included as well.
- Custom Engine block is added as a new referenced subsystem
  for Engine component.
  The previous model is included as well.
  The custom block is parameterized with peak torque,
  engine speed at peak torque, and peak power.
  The block parameter window provides a link to
  make the plots of engine torque and power curves.
- MG2, MG1, and Engine components have
  a torsional Spring-Damper block from Simscape Driveline
  or equivalent blocks from Foundation Library.
  This allows the energy to properly dissipate when necessary,
  thereby improving simulation robustness and performance.
- MG1 controller can start the engine.
  This better models the power-split HEV controller.
- Scopes are moved to individual components.
  This cleans up models, streamlines development workflow,
  and makes model navigation easier.

Test

- Project top-level unit test is added.
  See files under `test`.
  - `HEVProject_runtests.m` automatically finds all unit test files
    in the project folder tree and runs them.
    `.github/workflow/ci.yml` for GitHub Actions uses this
    to perform unit test when the repository is pushed to GitHub.
- Power-Split HEV system model has unit test files in
  - `HEV` > `PowerSplitHEV_DirectInput` > `test`
  - `HEV` > `PowerSplitHEV_SpeedTracking` > `test`
  - Unit test files:
    - `PowerSplitHEV_DirectInput_UnitTest.m`
    - `PowerSplitHEV_SpeedTracking_UnitTest.m`
  - Test runners:
    - `PowerSplitHEV_DirectInput_runtests.m`
    - `PowerSplitHEV_SpeedTracking_runtests.m`
    - Running these scripts perform unit test and produce
      MATLAB code coverage report.
- Vehicle1D component has unit test files in
  - `Components` > `Vehicle1D` > `test`
- Power-Split Drive Unit component has unit test files in
  - `Components` > `PowerSplitDriveUnit` > `test`
- Engine component has unit test files in
  - `Components` > `Engine` > `test`
- Drive Pattern component has unit test files in
  - `Components` > `DrivePattern` > `test`

Other updates

- Refactored many folders, models, and scripts.

## Version 1.1 (November, 2021)

MATLAB Release

- MATLAB R2021a or newer release is required.

Highlights

- Parameter Sweep Workflow in Live Script
  - Demonstrates how to investigate the effect of reduction gear ratio,
    high-voltage battery capacity and high-voltage battery weight
    on the electrical efficiency.
    You can optionally use Parallel Computing Toolbox to shorten
    total simulation time.
  - Watch [YouTube video](https://www.youtube.com/watch?v=cbo83A8K_4w)
    showing the workflow as well as real-time application.
    - Real-Time application presented in the video will be added
      to this project in future updates.

## Version 1.0 (May, 2021)

Initial release.
