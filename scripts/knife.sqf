

private ["_nearestunits", "_nearestunitofside", "_prevAnim"]; 

_prevAnim = animationState player;

_nearestunits = nearestObjects [player,["Man"],3];

_nearestunitofside = [];

if(east countSide _nearestunits > 0) then {
	{
		_unit = _x;
		if(side _unit == east) then{_nearestunitofside = _nearestunitofside + [_unit]};
	} foreach _nearestunits;

	[-2, {
		(_this select 0) switchMove "AmelPercMstpSnonWnonDnon_amaterUder3";
	}, [player]] call CBA_fnc_globalExecute;
	sleep 1; 
	
	
	[-1, {
		private ["_objPosition", "_objposition", "_obj", "_pos", "_velocity", "_color", "_alpha", "_ps11"];
		_objPosition = getPos (_this select 0);
		_objposition = (_objposition select 2);

		_obj = vehicle (_this select 0);
		_pos = position _obj;
		_velocity = [0,0,.1];
		_color = [.5, 0, 0];
		_alpha = .7;
		_ps11 = "#particlesource" createVehicleLocal _pos;  
		_ps11 attachTo [(_this select 0)]; 

		_ps11 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", "Billboard", 1, 6, [0, 0, 0.5], [0, 0, 0], 0, 10, 1, 0, [1,5],[[1,0,0,0.8],[1,0,0,0]], [0.5,0.5,0], 1, 1, "", "", center];
		_ps11 setParticleRandom [.1, [0, 0, 0], [1, 2, 2], 1, 0, [0, 0, .2, 1.1], 0, 0];
		_ps11 setParticleCircle [0, [0, 0, 0]];
		_ps11 setDropInterval 0.01;
		sleep .4;
		deletevehicle _ps11;
		
	}, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;
	
	
	[player, "stab"] call CBA_fnc_globalSay3d;
	(_nearestunitofside select 0) setdammage 1;
	
	
	sleep 2;
	
	
	[-2, {
		(_this select 0) switchmove (_this select 1);
	}, [player, _prevAnim]] call CBA_fnc_globalExecute;

};