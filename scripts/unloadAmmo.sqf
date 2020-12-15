private "_box";
_box = _this select 0; 

if (_box distance experimentalgun < 4) then {
	if ("rhs_mag_3of56_10" in magazines experimentalgun) exitwith{
		systemChat "Gun is already full!";
	};
	_box removeAction 0;
	systemChat "Unloading ammo box";
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 4;
	experimentalgun addMagazineGlobal "rhs_mag_3of56_10";
	systemChat "Reload complete!";
};