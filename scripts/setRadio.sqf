
private _preset = "";

if (!isDedicated) then {

    if (isNull player) then {
        waitUntil {!isNull player};
    };
    if (side player == WEST) then {
        _preset = "default";
    } else {
        _preset = "default2";
    };

    ["ACRE_PRC148", _preset] call acre_api_fnc_setPreset;
    ["ACRE_PRC117F", _preset] call acre_api_fnc_setPreset;
    ["ACRE_PRC343", _preset] call acre_api_fnc_setPreset;
};
