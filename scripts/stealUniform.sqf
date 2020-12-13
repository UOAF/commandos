private["_oldUnit","_orginalDir","_orginalPosition","_orginalView","_playerSide","_playerName","_newUnitModel","_initialBody","_dummyGroup","_newUnit", "_GuyGettingSnuffed", "_newjack", "_weaponsSnuffed", "_magazinesSnuffed"];

_GuyGettingSnuffed = _this select 3 select 0;

_GuyGettingSnuffed removeAction stealUniform;

_playerUniform = uniform player;
_badGuyUniform = uniform _GuyGettingSnuffed;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 4;
//create the player's uniform as a weapon holder on the ground and add his uniform items to it
_holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_playerUniform, 1];
_droppedContainer = (((everyContainer _holder) select 0) select 1);

{
	_droppedContainer addItemCargoGlobal [_x, 1];
} forEach (uniformItems player);

removeUniform player;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 4;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 4;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 4;
player playMove "AinvPknlMstpSlayWrflDnon_medic";

player forceAddUniform _badGuyUniform;

{
	//add all the uniform items from the dead guy's kit to the uniform on the player now
	player addItemToUniform _x;
} forEach (uniformItems _GuyGettingSnuffed);
removeUniform _GuyGettingSnuffed;