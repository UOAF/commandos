_light = "#lightpoint" createVehicleLocal position arsenal_light_01;
_light setLightBrightness 0.05; 
_light setLightAmbient [1.0, 1.0, 0.8]; 
_light setLightColor [1.0, 1.0, 0.8];

_light = "#lightpoint" createVehicleLocal position arsenal_light_02;
_light setLightBrightness 0.05; 
_light setLightAmbient [1.0, 1.0, 0.8]; 
_light setLightColor [1.0, 1.0, 0.8];


_light = "#lightpoint" createVehicleLocal position arsenal_light_03;
_light setLightBrightness 0.05; 
_light setLightAmbient [1.0, 1.0, 0.8]; 
_light setLightColor [1.0, 1.0, 0.8];

// all these actions are global; don't want this stuff to happen when a random player connects.
if (!isServer) exitWith {};
canunlockweapon = false; 
publicvariable "canunlockweapon";

commandos_lock_door_handler = {
    params ["_target", "_caller", "_id", "_args"];
    _args params ["_building", "_door_num", "_inventory_item_key"];
    _door_var_name = format ["bis_disabled_Door_%1", _door_num];
    _action_door_name = format ["Door_%1", _door_num];
    _condition = format ["('%1' in items player) && (%2 animationPhase 'door_%3_rot' == 0)", 
                         _inventory_item_key, _target, _door_num];
    _building addAction ["Unlock door", commandos_unlock_door_handler, [_building, _door_num, _inventory_item_key], 
                         -1, true, true, "", _condition, 3, false, _action_door_name];
    _building removeAction _id;
    diag_log format ["locking: setting %1 to %2", _door_var_name, 1];
    _building setVariable [_door_var_name, 1, true];
    playSound "click";
    hint "Door is now locked.";
};

commandos_unlock_door_handler = {
    params ["_target", "_caller", "_id", "_args"];
    _args params ["_building", "_door_num", "_inventory_item_key"];
    _door_var_name = format ["bis_disabled_Door_%1", _door_num];
    _action_door_name = format ["Door_%1", _door_num];
    _condition = format ["('%1' in items player) && (%2 animationPhase 'door_%3_rot' == 0)", 
                         _inventory_item_key, _target, _door_num];
    _building addAction ["Lock door", commandos_lock_door_handler, [_building, _door_num, _inventory_item_key], 
                         -1, true, true, "", _condition, 3, false, _action_door_name];
    _building removeAction _id;
    diag_log format ["unlocking: %1 to %2", _door_var_name, 0];
    _building setVariable [_door_var_name, 0, false];
    playSound "click";
    hint "Door is now unlocked.";
};  

private _lock_door = {
    params ["_building", "_door_num", "_inventory_item_key"];
    _door_var_name = format ["bis_disabled_Door_%1", _door_num];
    _action_door_name = format ["Door_%1", _door_num];
    _condition = format ["canunlockweapon && ('%1' in items player)", _inventory_item_key];
    _building addAction ["Unlock door", commandos_unlock_door_handler, [_building, _door_num, _inventory_item_key], 
                         -1, true, true, "", _condition, 3, false, _action_door_name];
    diag_log format ["locking: setting %1 to %2", _door_var_name, 1];
    _building setVariable [_door_var_name, 1, true];
};

[arsenal_building, 1, "ACE_DefusalKit"] call _lock_door;

private _weaponscrate_items_to_add = [
    ["rhs_weap_rpg7", 2],
    ["rhs_weap_rpg26", 10],
    ["rhs_weap_pkm", 2],
    ["rhs_weap_igla", 2],
    ["rhs_weap_ak74m_fullplum_gp25", 6],
    ["rhs_1PN138", 2]
];

private _ammobox_items_to_add = [
    ["rhs_rpg7_OG7V_mag", 4],
    ["rhs_rpg7_PG7V_mag", 12],
    ["rhs_rpg7_TBG7V_mag", 6],
    ["rhs_100Rnd_762x54mmR_green", 10],
    ["rhs_100Rnd_762x54mmR_7N26", 10],
    ["rhs_mag_9k38_rocket", 6],
    ["rhs_30Rnd_545x39_7N10_AK", 100],
    ["rhs_VOG25", 48],
    ["rhs_VG40OP_green", 12],
    ["rhs_VG40OP_red", 12],
    ["rhs_VG40OP_white", 12],
    ["rhs_GRD40_White", 12],
    ["rhs_mag_rgd5", 50],
    ["APERSTripMine_Wire_Mag", 10],
    ["rhssaf_mine_mrud_b_mag", 5],
    ["rhs_mine_msk40p_white_mag", 16]
];

{
    ammobox addItemCargoGlobal _x;
} forEach _ammobox_items_to_add;

{
    weaponscrate addItemCargoGlobal _x;
} forEach _weaponscrate_items_to_add;
