% function rram_setlabels(app)
%
% Assigns the correct values to the labels in the RRAM dashboard for a
% charge or flux controlled memristor.
% 
% This code is part of the Memristor and RRAM Plot Tool Program.
% By John Smith, 2020


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
    app.ExcitationParametersPanel_2.Title = ...
        "Excitation Current Parameters";
    app. ExcitationAmplitudeLabel_rram.Text = ...
        ["Current "; "Amplitude"];
    app.ExcitationFrequencyLabel_rram.Text = ...
        ["Current "; "Angular Frequency"];
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
    app.ExcitationParametersPanel_2.Title = ...
        "Excitation Voltage Parameters";
    app. ExcitationAmplitudeLabel_rram.Text = ...
        ["Voltage "; "Amplitude"];
    app.ExcitationFrequencyLabel_rram.Text = ...
        ["Voltage "; "Angular Frequency"];
    app.TopRightAxisPanel_rram.Title = "Voltage Axis";
end