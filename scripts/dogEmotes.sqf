private ["_emoteType"]; 

_emoteType = _this select 3; 


if (_emoteType == "bark") then { 
[player, "dogbark1"] call CBA_fnc_globalSay3d;
}; 

if (_emoteType == "bark2") then { 
[player, "dogbark2"] call CBA_fnc_globalSay3d;

}; 

if (_emoteType == "growl") then { 
[player, "doggrowl"] call CBA_fnc_globalSay3d;

}; 

if (_emoteType == "whine") then { 
[player, "dogwhine"] call CBA_fnc_globalSay3d;

}; 

if (_emoteType == "pant") then { 
[player, "dogpant"] call CBA_fnc_globalSay3d;

}; 