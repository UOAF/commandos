sleep 0.1; 

while {true} do { 

	if (player getVariable ["playerSide", side player] == west) then { 

		{
			if (player hasWeapon _x) then { 

				player removeweapon _x; 
			};
		} forEach bannedWeaponsBluFor;

	}; 

	if (player getVariable ["playerSide", side player] == east) then { 

		{
			if (player hasWeapon _x) then { 

				player removeweapon _x;
			};
		} forEach bannedWeaponsOpFor;

	}; 

	sleep 1; 

};