	player addAction ["Enter Spectator Mode", "scripts\specAction.sqf", [], 1, false, true, "", ""];
		player setVariable["acre_sys_core_isDisabled", true, true];
		onMapSingleClick "player setpos (_pos); true;";
		
		[]spawn {
			sleep 1; 
			while {true} do { 
				removeallweapons player; 
				
				if (vehicle player != player) then { 
					moveOut player;
					[-1, {hint "Be advised: the Camera Man is entering player vehicles. Ban him or something.";}] call CBA_fnc_globalExecute;				
				}; 
				sleep 1; 
			};	 
		};
