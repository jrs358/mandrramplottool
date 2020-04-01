function writetofile(app)

if app.simulationOption == "mchar"

    x(:,1) = app.vals.mchar.q;
    t(:,1) = app.vals.mchar.t;
    
    constrel(:,1) = app.vals.mchar.phiq;
    Rq_Gphi(:,1) = app.vals.mchar.Rq;
    it(:,1) = app.vals.mchar.it;
    qt(:,1) = app.vals.mchar.qt;
    phit(:,1) = app.vals.mchar.phit;
    vt(:,1) = app.vals.mchar.vt;
    Rt(:,1) = app.vals.mchar.Rt;
    
    tvals = table(t, it, qt, phit, vt, Rt);
    xvals = table(x, constrel, Rq_Gphi);
    
    writetable(xvals, 'mchar_qvals.csv');
    writetable(tvals, 'mchar_tvals.csv');

elseif app.simulationOption == "rram"
    
    x(:,1) = app.vals.rram.x;
    t(:,1) = app.vals.rram.t;
    
    constrel(:,1) = app.vals.rram.constrel;
    Rq_Gphi(:,1) = app.vals.rram.Rq_Gphi;
    Rt_Gt(:,1) = app.vals.rram.Rt_Gt;
    it(:,1) = app.vals.rram.it;
    qt(:,1) = app.vals.rram.qt;
    phit(:,1) = app.vals.mchar.phit;
    vt(:,1) = app.vals.mchar.vt;
    
    tvals = table(t, it, qt, phit, vt, Rt_Gt);
    xvals = table(x, constrel, Rq_Gphi);
    
    writetable(xvals, 'rram_xvals.csv');
    writetable(tvals, 'rram_tvals.csv');

    
end

