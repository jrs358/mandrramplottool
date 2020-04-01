function rram_setlabels(app)

if app.rramTechnology == "ChargeControlled"
    app.xminImg_rram.ImageSource = "qmin.svg";
    app.xmaxImg_rram.ImageSource = "qmax.svg";
    app.nxImg_rram.ImageSource = "nq.svg";
    app.TopLeftAxisPanel_rram.Title = "Charge Axis";
    app.CondResCheckBox_x_rram.Text = "Resistance";
    app.R_GHysCheckBox_rram.Text = "R Hysteresis";
    app.CondResCheckBox_t1_rram.Text = "Resistance";
    app.CondResCheckBox_t2_rram.Text = "Resistance";
    app.ExcitationParametersPanel_2.Title = "Excitation Current Parameters";
    app.TopRightAxisPanel_rram.Title = "Current Axis";
elseif app.rramTechnology == "FluxControlled"
    app.xminImg_rram.ImageSource = "phimin.svg";
    app.xmaxImg_rram.ImageSource = "phimax.svg";
    app.nxImg_rram.ImageSource = "nphi.svg";
    app.TopLeftAxisPanel_rram.Title = "Flux Axis";
    app.CondResCheckBox_x_rram.Text = "Conductance";
    app.R_GHysCheckBox_rram.Text = "G Hysteresis";
    app.CondResCheckBox_t1_rram.Text = "Conductance";
    app.CondResCheckBox_t2_rram.Text = "Conductance";
    app.ExcitationParametersPanel_2.Title = "Excitation Voltage Parameters";
    app.TopRightAxisPanel_rram.Title = "Voltage Axis";
end