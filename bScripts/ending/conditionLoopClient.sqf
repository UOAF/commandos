//End conditions loop

if (debugenabled) exitWith{
    "Condition loop client disabled" call fnc_debugPrint;
};

waituntil {

    if (BLUFOR_CC) then
    {
        ["sandi_endMission", ["CC"]] call CBA_fnc_globalEvent;
    };

    if (bluforWin) then
    {
        ["sandi_endMission", ["bluforWin"]] call CBA_fnc_globalEvent;
    };
    
    //timer in init.sqf
    
    sleep 10;
    false
};