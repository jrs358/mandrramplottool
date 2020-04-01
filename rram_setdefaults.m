function rram_setdefaults(app)

if app.rramTechnology == "ChargeControlled"
    app.AmplitudeSlider_rram.Value = 0.5;
    app.AngleSlider_rram.Value = 0.5;
    app.MinAmpField_rram.Value = 0;
    app.MaxAmpField_rram.Value = 4;
    app.MinAngleField_rram.Value = 0;
    app.MaxAngleField_rram.Value = 2;
    app.BreakpointField_rram.Value = 1;
    app.tminField_rram.Value = 0;
    app.tmaxField_rram.Value = 6.28;
    app.ntField_rram.Value = 500;
    app.xminField_rram.Value = -2;
    app.xmaxField_rram.Value = 2;
    app.nxField_rram.Value = 500;
elseif app.rramTechnology == "FluxControlled"
    app.AmplitudeSlider_rram.Value = 0.5;
    app.AngleSlider_rram.Value = 0.5;
    app.MinAmpField_rram.Value = 0;
    app.MaxAmpField_rram.Value = 10;
    app.MinAngleField_rram.Value = 0;
    app.MaxAngleField_rram.Value = 2;
    app.BreakpointField_rram.Value = 2.5;
    app.tminField_rram.Value = 0;
    app.tmaxField_rram.Value = 6.28;
    app.ntField_rram.Value = 500;
    app.xminField_rram.Value = -10;
    app.xmaxField_rram.Value = 10;
    app.nxField_rram.Value = 500;
end