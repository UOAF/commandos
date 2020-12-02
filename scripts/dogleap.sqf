//nou helped with some maths below

private ["_curVelocity", "_totalVelocity", "_vector", "_AOA", "_stamina"];

_stamina = player getVariable "dogStamina";


if (_stamina) then { 


	if (speed player > 1) then { 

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

		player setVelocity _vector; 
	player setVariable ["dogStamina", false];

	}; 
	

	
}else { 

	hint "You are too exhausted to leap again! Rest some.";
};	