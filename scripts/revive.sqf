    [-2, {
        (_this select 0) removeaction revive; 
(_this select 0) call ace_sys_wounds_fnc_RemoveBleed;
(_this select 0) call ace_sys_wounds_fnc_RemovePain;
(_this select 0) call ace_sys_wounds_fnc_RemoveUncon;
(_this select 0) setVariable ["ace_w_heal", true];
(_this select 0) setdammage 0;
    }, [(_this select 0)]] call CBA_fnc_globalExecute;

        (_this select 0) setVariable ["buttStroked", false, true]; 
