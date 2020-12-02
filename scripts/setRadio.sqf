
if (!isDedicated) then {

  if (isNull player) then {
  	waitUntil {!isNull player};
  };

	#define FREQ_BASE 30
	_freqs = [];
	if (side player == WEST) then {
		for "_i" from 0 to 99 do {
			_freq = FREQ_BASE + (_i * 3) + 0.500;
			_freqs = _freqs + [_freq];
		};
	} else {
		for "_i" from 0 to 99 do {
			_freq = FREQ_BASE + (_i * 3) + 1.250;
			_freqs = _freqs + [_freq];
		};
	};
	["ACRE_PRC148", _freqs] call acre_api_fnc_setDefaultChannels;
	["ACRE_PRC117F", _freqs] call acre_api_fnc_setDefaultChannels;
	["ACRE_PRC119", _freqs] call acre_api_fnc_setDefaultChannels;	


	#define FREQ_BASE 2400
	_freqs = [];
	if (side player == WEST) then {
		for "_i" from 0 to 99 do {
			_freq = FREQ_BASE + _i + 0.200;
			//_freqs = _freqs + [[_freq, 50]];
			_freqs = _freqs + [_freq];
		};
	} else {
		for "_i" from 0 to 99 do {
			_freq = FREQ_BASE + _i + 0.600;
			//_freqs = _freqs + [[_freq, 50]];
			_freqs = _freqs + [_freq];
		};
	};;
	["ACRE_PRC343", _freqs] call acre_api_fnc_setDefaultChannels;
};