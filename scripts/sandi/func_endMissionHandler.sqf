if (isServer) then {
  if (!sandi_assessment_ending) then { // only end if not ending already
		sandi_assessment_ending = true;

  _reason = _this select 0;

  _blu_deaths       = sandi_blu_deaths;    _blu_deaths_multiplier = 10;
  _blu_VEHdeaths    = sandi_blu_VEHdeaths; _blu_VEHdeaths_multiplier = 5;
  _blu_IFVdeaths    = sandi_blu_IFVdeaths; _blu_IFVdeaths_multiplier = 10;
  _blu_AFVdeaths    = sandi_blu_AFVdeaths; _blu_AFVdeaths_multiplier = 20;
  _red_deaths       = sandi_red_deaths;    _red_deaths_multiplier = 2;
  _red_VEHdeaths    = sandi_red_VEHdeaths; _red_VEHdeaths_multiplier = 5;
  _red_IFVdeaths    = sandi_red_IFVdeaths; _red_IFVdeaths_multiplier = 10;
  _red_AFVdeaths    = sandi_red_AFVdeaths; _red_AFVdeaths_multiplier = 20;

		_infilpoints = 0; 

  		if (bluforWin) then //if blufor blows shit up
		{
			_infilpoints = 60; 
		}		
		else {
			_infilpoints = 0; 
		}; 
		
				
  
		_red = ( (_red_deaths * _red_deaths_multiplier) + (_red_VEHdeaths * _red_VEHdeaths_multiplier) + (_red_IFVdeaths * _red_IFVdeaths_multiplier) + (_red_AFVdeaths * _red_AFVdeaths_multiplier) + (_infilpoints) );
                _blu = ( (_blu_deaths * _blu_deaths_multiplier) + (_blu_VEHdeaths * _blu_VEHdeaths_multiplier) + (_blu_IFVdeaths * _blu_IFVdeaths_multiplier) + (_blu_AFVdeaths * _blu_AFVdeaths_multiplier) + sciencepoints + liquidationPoints);

                _victoryPoints = 1;
		if (_blu == 0) then {
		  if (_red == 0) then {
			  _victoryPoints = 1;
			} else {
			  _victoryPoints = 999;
			};
		} else {
			_victoryPoints = _red / _blu;
		};	 
				 
								   
  ["sandi_assessment", [_reason, _victoryPoints, _blu_deaths, _red_deaths, _time, _flagsCaptured, _blu_VEHdeaths, _blu_IFVdeaths, _blu_AFVdeaths, _red_VEHdeaths, _red_IFVdeaths, _red_AFVdeaths, _blu_obj1_multiplier, _blu_obj2_multiplier, _blu_obj3_multiplier]] call CBA_fnc_globalEvent;
	};
  };