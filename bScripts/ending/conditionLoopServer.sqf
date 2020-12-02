//Written by Sandiford
//End conditions loop


sleep 5;  //wait for things to settle
	if (isMultiplayer) then { // uses playableUnits which only works in MP
		[] spawn {
			waitUntil {
				sleep 5;

				_isUncon = {
					_man = _this select 0;
					_uncon = [_man] call ace_sys_wounds_isUncon;
					if (isNil "_uncon") then { _uncon = false; };
					_uncon
				};

				_countAllWest = { (_x getVariable ["playerSide", side player] == west) && (isPlayer _x) } count playableUnits;
				_countAllEast = { (_x getVariable ["playerSide", side player] == east) && (isPlayer _x) } count playableUnits;

				_countWest = { (_x getVariable ["playerSide", side player] == west) && (alive _x) && ( (_x distance specPen) > 200) && (isPlayer _x) } count allUnits;
				if (_countWest < 1 ) then {
					sleep 1; // allow final death to sync
					BLUFOR_CC = true;
					publicVariable "BLUFOR_CC";
				};

				_countEast = { (_x getVariable ["playerSide", side player] == east) && (alive _x) && ( (_x distance specPen) > 200) && (isPlayer _x) && !([_x] call _isUncon) } count playableUnits;
				if (_countEast < (_countAllEast / 4) ) then {
					sleep 1; // allow final death to sync
					BLUFOR_CC = true;
					publicVariable "BLUFOR_CC";
				};

			false };
		};
	};
	


