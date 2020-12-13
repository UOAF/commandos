//Written by beta, Fer
//Creates a trip flare light source


private ["_light", "_dist", "_ranNum", "_cnt", "_flare", "_smokeFX", "_flarePos", "_localEnemyUnits", "_spottingUnits", "_unitsNear", "_unitsNearer", "_tripper"];

_tripper = _this select 0 select 0;
_flarePos = [(getPos _tripper select 0), (getPos _tripper select 1), 0];
_cnt = 40;
_localEnemyUnits = [];
_spottingUnits = [];
_unitsNear = [];
_unitsNearer = [];

{
    if ((_x distance _flarePos) < 300) then
    {
        _unitsNear = _unitsNear + [_x];

        if ((_x distance _flarePos) < 30) then
        {
            _unitsNearer = _unitsNearer + [_x];
        };
    };
} forEach allUnits;

{
    if (_x isKindOf "CAManBase" || _x isKindOf "LandVehicle") then
    {
        if ((!local _x) || (player == _x)) then
        {
            _localEnemyUnits = _localEnemyUnits - [_x];
        }
        else
        {
            _localEnemyUnits = _localEnemyUnits + [_x];
        };
    };
} forEach _unitsNearer;

{
    if (_x isKindOf "CAManBase" || _x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship") then
    {
        _spottingUnits = _spottingUnits + [_x];
    };
} forEach _unitsNear;

_flare = "Can_small" createVehicleLocal _flarePos;
_flare setPos _flarePos;

_light = "#lightpoint" createVehicleLocal _flarePos;
_light setPos _flarePos;
_light setLightBrightness 0.4;
_light setLightAmbient[0.65, 0.55, 0.25];
_light setLightColor[0.65, 0.55, 0.25];
_light lightAttachObject [_flare, [0,0,0]];

balls = compile preprocessFile "bScripts\ambient\burn.sqf";
_smokeFX = [_flare, 0.8, time, false, false] spawn balls;

sleep 0.25;

private["_seer"];

{
    _seer = _x;
    {
        if ((_seer knowsAbout _x) < 1) then
        {
            _seer reveal _x;

            if ((side _seer) != (side _x)) then
            {
                _seer doTarget _x;
                _seer doFire _x;
            };
        };
    } forEach _localEnemyUnits;
} forEach _spottingUnits;

while {_cnt > 0} do
{
    _ranNum = (10 + (random (20))) / 100;
    _light setLightBrightness _ranNum;
    _cnt = _cnt - 0.1;

    sleep 0.1;
};

for [{_i=_ranNum}, {_i > 0}, {_i=_i-0.01}] do
{
    _light setLightBrightness _i;
    sleep 0.1;
};

deleteVehicle _light;
deletevehicle _flare;
