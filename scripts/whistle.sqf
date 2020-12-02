private ["_cooldown"];

_cooldown = time - (player getVariable "b_lastWhistle");

if(_cooldown < 10.0) then {
	hintSilent "Try to catch your breath first...";
} else {
	player setVariable ["b_lastWhistle", time, true];
	[player, "whistle"] call CBA_fnc_globalSay3d;

};
