//nou helped with some maths below

private ["_vector", "_AOA", "_stamina"];

_stamina = player getVariable "dogStamina";


if (_stamina) then { 


	if (speed player < 1) then { 

		_totalVelocity = 7.5;
		
		_AOA = 70; 
			
		
		_vector = [_totalVelocity, (getdir player), _AOA] call cba_fnc_polar2vect;

		player setVelocity _vector; 
	player setVariable ["dogStamina", false];

	}; 
	

	
}else { 

	hint "You are too exhausted to leap again! Rest some.";
};	