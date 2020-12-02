//Written by beta
//Le Mired


private ["_veh", "_mireRate", "_unmireNum", "_ran"];

[] spawn
{
	mired = false;
	
	while {true} do
	{
		if (vehicle player != player) then
		{
			_veh = vehicle player;
			
			_mireRate = 0.0;
			_speedMired = 0;
			switch (true) do
			{
				case (_veh isKindOf "SkodaBase"): { _mireRate = 0.80; _speedMired = 5; };
				case (_veh isKindOf "Truck"): { _mireRate = 0.50; _speedMired = 10; };
				case (_veh isKindOf "Wheeled_APC"): { _mireRate = 0.96; _speedMired = 30; };
				case (_veh isKindOf "Tank"): { _mireRate = 0.99; _speedMired = 35; };
			};
			
			
			
			if (count (_veh nearRoads 15) < 1) then
			{
				if (!mired && (speed _veh > _speedMired)) then
				{
					_ran = random (1);
					
					if (_ran > _mireRate) then
					{
						mired = true;
					};
				};
			};
		};
		
		sleep 5;
	};
};

[] spawn
{
	_unmireNum = 0.0;
	
	while {true} do
	{
		if (mired) then
		{
			if (_unmireNum == 0) then
			{
				[] spawn
				{
					player globalChat "YOU ARE LE MIRED!";
					
					_veh = vehicle player;
					
					while {mired} do
					{
						_vel = velocity _veh;
						_veh setVelocity [(_vel select 0)*-1,(_vel select 1)*-1,(_vel select 2)];
						
						sleep 0.1;
					};
				};
				_unmireNum = _unmireNum + 0.1;
			};
			
			_vel = velocity (vehicle player);
			
			if (((_vel select 0) != 0) && ((_vel select 1) != 0)) then
			{
				_unmireNum = _unmireNum + (random .25);
			};
			
			if (_unmireNum > 1) then
			{
				mired = false;
				_unmireNum = 0.0;
			};
		};
		
		sleep 5;
	};
};
