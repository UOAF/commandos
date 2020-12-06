//sandiford score assessment inits
    //blufor
    if (isNil "sandi_blu_deaths") then {
        sandi_blu_deaths = 0;
    };
    if (isNil "sandi_blu_AFVdeaths") then {
        sandi_blu_AFVdeaths = 0;
    };
    if (isNil "sandi_blu_IFVdeaths") then {
        sandi_blu_IFVdeaths = 0;
    };
    if (isNil "sandi_blu_VEHdeaths") then {
        sandi_blu_VEHdeaths = 0;
    };

    //opfor
    if (isNil "sandi_red_deaths") then {
        sandi_red_deaths = 0;
    };
    if (isNil "sandi_red_AFVdeaths") then {
        sandi_red_AFVdeaths = 0;
    };
    if (isNil "sandi_red_IFVdeaths") then {
        sandi_red_IFVdeaths = 0;
    };
    if (isNil "sandi_red_VEHdeaths") then {
        sandi_red_VEHdeaths = 0;
    };

    ["sandi_killed", {sandi_blu_deaths = sandi_blu_deaths +1}] call CBA_fnc_addEventHandler;
    ["sandi_killed2", {sandi_red_deaths = sandi_red_deaths +1}] call CBA_fnc_addEventHandler;
    ["sandi_blu_IFV_killed", {sandi_blu_IFVdeaths = sandi_blu_IFVdeaths +1}] call CBA_fnc_addEventHandler;
    ["sandi_blu_VEH_killed", {sandi_blu_VEHdeaths = sandi_blu_VEHdeaths +1}] call CBA_fnc_addEventHandler;
    ["sandi_red_IFV_killed", {sandi_red_IFVdeaths = sandi_red_IFVdeaths +1}] call CBA_fnc_addEventHandler;
    ["liquidation", {liquidationPoints = liquidationPoints +30; publicvariable "liquidationPoints";}] call CBA_fnc_addEventHandler;

    [] spawn {
        sleep (60 *60); // 60 minutes
        ["sandi_endMission", ["time"]] call CBA_fnc_globalEvent;
    };