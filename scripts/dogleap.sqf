//nou helped with some maths below

private ["_curVelocity", "_totalVelocity", "_vector", "_AOA", "_stamina"];

_stamina = player getVariable "dogStamina";

//systemchat "trying to leap";

if (_stamina) then { 
//systemchat "Stamina is good";

	if (speed player > 1) then { 
//systemchat "speed is good";
		_curVelocity = velocity player;

		_totalVelocity = (3.6*sqrt((_curVelocity select 0)^2 + (_curVelocity select 1)^2 + (_curVelocity select 2)^2))*0.278;
		_totalVelocity = _totalVelocity + 4;
		
		_AOA = 0; 
		
		if (_totalVelocity > 1 && _totalVelocity < 7) then { 
			_AOA = 30;
		}else{
			if (_totalVelocity > 7) then { 
				_AOA = 25; 
			};
		};
		
		
		_vector = [_totalVelocity, (getdir player), _AOA] call cba_fnc_polar2vect;
//systemchat format ["vector is %1", _vector];
		player setVelocity _vector; 
	player setVariable ["dogStamina", false];

	}; 
	

	
}else { 

	hint "You are too exhausted to leap again! Rest some.";
};	