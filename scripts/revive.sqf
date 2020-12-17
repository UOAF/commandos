[-2, {
    (_this select 0) removeaction revive; 
    [(_this select 0), false, 0, true] call ace_medical_fnc_setUnconscious;
}, [(_this select 0)]] call CBA_fnc_globalExecute;

(_this select 0) setVariable ["buttStroked", false, true]; 
