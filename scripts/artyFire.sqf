//make markers on the map showing impacts from the experimental cannon
private ["_shell","_markerName","_shellPos","_ass","_time"];

_shell = _this select 6;

if (isNil "markeriter") then {markeriter = 0;};
_markerName = "marker" + str markeriter;
markeriter = markeriter +1;
_shellPos = getpos _shell;

//because apparently killed and hit EHs don't work on shells :( 
waitUntil {
	_ass  = getpos _shell;	
	if (_ass distance [0,0,0] > 1) then {
		_shellPos = _ass;
	};
	sleep 0.1;
	_shellPos call fnc_debugPrint;
	;!alive _shell
};

_time = [daytime, "HH:MM:SS"] call BIS_fnc_timeToString;
_artyMarker = createMarkerLocal[_markerName + _time ,_shellPos];
_artyMarker setMarkerShapeLocal "ICON";
_artyMarker setMarkerTypeLocal "mil_triangle";
_artyMarker setMarkerTextLocal _time;
_artyMarker setMarkerAlphaLocal 0.5;