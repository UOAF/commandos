while {true} do { 

    if ((surfaceIsWater [(getPos player select 0), (getPos player select 1)]) && !(vehicle player != player) && !("camman" == vehicleVarName player) ) then { 
        hint "Get out of the water.";
        sleep 5; 
        if ((surfaceIsWater [(getPos player select 0), (getPos player select 1)]) && !(vehicle player != player) && !("camman" == vehicleVarName player) ) then { 
            player setdammage 1; 
        };
    };

    sleep 1; 
};
