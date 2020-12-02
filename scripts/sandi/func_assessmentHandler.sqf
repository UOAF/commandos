_this spawn {
	_reason        = _this select 0;
	_victoryPoints = _this select 1;
	_blu_deaths    = _this select 2;
	_red_deaths    = _this select 3;
	_time          = _this select 4;
	_flagsCaptured = _this select 5;
	_blu_VEHdeaths    = _this select 6; 
	_blu_IFVdeaths    = _this select 7; 
	_blu_AFVdeaths    = _this select 8;  
	_red_VEHdeaths    = _this select 9; 
	_red_IFVdeaths    = _this select 10; 
	_red_AFVdeaths    = _this select 11;  
	_blu_obj1_multiplier    = _this select 12;  
	_blu_obj2_multiplier    = _this select 13;
	_blu_obj3_multiplier    = _this select 14; 

	_reasonText = "";
	switch (_reason) do {
	case "time": {
			_reasonText = " - Time Limit Reached";
		};
	case "CC": {
			_reasonText = " - A Force Is Combat Ineffective";
		};
	case "bluforWin": {
			_reasonText = " - The Russian Base Has Been Sabotaged!";
		};
		default {
			_reasonText = "";
		};

	};

	_winner = "";
	switch (true) do {
	case (_victoryPoints >= 1.8): {
			_winner = "CIA Decisive Victory";
		};
	case (_victoryPoints < 1.8 && _victoryPoints >= 1.25): {
			_winner = "CIA  Marginal Victory";
		};
	case (_victoryPoints < 1.25 && _victoryPoints > 0.8): {
			_winner = "Draw";
		};
	case (_victoryPoints <= 0.8 && _victoryPoints > 0.55): {
			_winner = "Russian Marginal Victory";
		};
	case (_victoryPoints <= 0.55): {
			_winner = "Russian Decisive Victory";
		};
	};

	_text = "Mission End" + _reasonText + "\n" 
	+ _winner + " (" + format ["%1", round (time / 60)] + " minutes)" + "\n\n" 
	+ "**** CIA ****" + "\n\n"
	+ "Men Killed (10 points each): " + format ["%1", _blu_deaths] + "\n\n"	

	+ "**** Russian Garrison ****" + "\n\n"
	+ "Men Killed (2 points each): " + format ["%1", _red_deaths] + "\n"
	
	+ "Scientific Research Completed (10 points max): " + format ["%1", sciencepoints] + "\n"
	+ "Liquidated Prisoners (30 points each): " + format ["%1", liquidationPoints / 30] + "\n\n" + 
	"CIA objectives to follow..." 
	;	
	_text2 = "**** CIA Objectives (60 points if base sabotaged) ****" + "\n"; 

	{
		switch (_x) do { //kill base commander
		case "obj1": { 
				_text2 = _text2 + "Neutralize the base commander" + "\n"
			};
		case "obj2": { //kill chad hudson
				_text2 = _text2 + "Neutralize Dr. Chadori Hudsonski" + "\n"
				
			};
		case "obj3": { //kill zedic
				_text2 = _text2 + "Neutralize Dr. Gavriil Zedic" + "\n"

			};
		case "obj4": { //blow up drones
				_text2 = _text2 + "Destroy experimental drones" + "\n"
			};
		case "obj5": { //blow up t-50
				_text2 = _text2 + "Destroy the T-50 plane" + "\n"
			};
		case "obj6": { //blow up apache
				_text2 = _text2 + "Destroy captured NATO AH-64" + "\n"

			};
		case "obj7": { //blow up cargo plane
				_text2 = _text2 + "Destroy cargo plane" + "\n"

			};
		case "obj8": { //blow up fuel dump 
				_text2 = _text2 + "Destroy base fuel dump" + "\n"

			};
		case "obj9": { //blow up radio tower
				_text2 = _text2 + "Destroy signal tower" + "\n"

			};
		case "obj10": { //blow up food
				_text2 = _text2 + "Destroy food supply" + "\n"

			};
		case "obj11": { //defect chad
				_text2 = _text2 + "Extract Chadori Hudsonki" + "\n"

			};
		case "obj12": { //defect zed
				_text2 = _text2 + "Extract Gavriil Zedic" + "\n"

			};
		case "obj13": { //defect commander
				_text2 = _text2 + "Extract Base Commander" + "\n"

			};
		case "obj14": { //raid
				_text2 = _text2 + "Conduct a General Raid" + "\n"

			};
		case "obj15": { //raid
				_text2 = _text2 + "Steal Intel from Control Tower" + "\n"

			};
		case "obj16": { //chem plant
				_text2 = _text2 + "Destroy Chemical Plant" + "\n"

			};
		case "obj17": { //hudson's plans
				_text2 = _text2 + "Steal Dr. Hudsonski's Designs" + "\n"

			};
		case "obj18": { //photograph cannon
				_text2 = _text2 + "Photograph Experimental Cannon" + "\n"

			};
		}
	} forEach objectivesText;
	
	removeallweapons player;      
	titleText [_text, "BLACK"];
	sleep 15; 
	titleText [_text2, "BLACK"];
	sleep 20; 
  [0, {
  if (isNil "serverEndTextTMT") then {
  serverEndTextTMT = true; 
  diag_log (_this select 0);
  diag_log (_this select 1);
  };
  
  }, [_text, _text2]] call CBA_fnc_globalExecute;
	endMission "LOSER";
};