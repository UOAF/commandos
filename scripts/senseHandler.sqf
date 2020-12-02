private ["_handler", "_handlerRange", "_dirToHandler"]; 

_handler = _this select 3 select 0; 

if (player distance _handler < 500) then { 

			_handlerRange = [Player, _handler] call CBA_fnc_getDistance;


			switch (true) do {
			case (_handlerRange > 400): {

					_handlerRange = "very far";
				};
				
			case ((_handlerRange > 300) && (_handlerRange < 400)): {

					_handlerRange = "far";
				};
				
			case ((_handlerRange > 200) && (_handlerRange < 300)): {

					_handlerRange = "medium";
				};
				
			case ((_handlerRange > 100) && (_handlerRange < 200)): {

					_handlerRange = "close";
				};
				
			case ((_handlerRange > 0) && (_handlerRange < 100)): {

					_handlerRange = "VERY CLOSE!";
				};
			};		

			_dirToHandler = [player, _handler] call CBA_fnc_headDir;
			_dirToHandler = _dirToHandler select 1; 

			switch (true) do {

			case ((_dirToHandler > 0) && (_dirToHandler < 31)): {
					_dirToHandler = "12 o'clock";

				};
				
			case ((_dirToHandler > 30) && (_dirToHandler < 61)): {
					_dirToHandler = "1 o'clock";

				};
				
			case ((_dirToHandler > 60) && (_dirToHandler < 91)): {
					_dirToHandler = "2 o'clock";

				};
				
			case ((_dirToHandler > 90) && (_dirToHandler < 121)): {
					_dirToHandler = "3 o'clock";

				};
				
			case ((_dirToHandler > 120) && (_dirToHandler < 151)): {
					_dirToHandler = "4 o'clock";

				};
				
			case ((_dirToHandler > 150) && (_dirToHandler < 181)): {
					_dirToHandler = "5 o'clock";

				};
				
			case ((_dirToHandler > -181) && (_dirToHandler < -150)): {

					_dirToHandler = "6 o'clock";
				};
				
			case ((_dirToHandler > -151) && (_dirToHandler < -120)): {

					_dirToHandler = "7 o'clock";
				};

			case ((_dirToHandler > -121) && (_dirToHandler < -90)): {

					_dirToHandler = "8 o'clock";
				};
				
			case ((_dirToHandler > -91) && (_dirToHandler < -60)): {

					_dirToHandler = "9 o'clock";
				};

			case ((_dirToHandler > -61) && (_dirToHandler < -30)): {

					_dirToHandler = "10 o'clock";
				};	

			case ((_dirToHandler > -31) && (_dirToHandler < -0.0000001)): {

					_dirToHandler = "11 o'clock";
				};		
				
			};

hintsilent format ["You smell your handler at %1 range, at %2", _handlerRange, _dirToHandler]; 

}else { 

hintsilent "You don't sense your handler." 
};