private ["_actionToDo", "_pistolType"]; 

_actionToDo = _this select 3 select 0; 
_pistolType = _this select 3 select 1; 


if (_pistolType == "blufor") then { 
_pistolType = "ACE_USPSD"; 
};

if (_pistolType == "opfor") then { 
_pistolType = "Makarov"; 
};

if (_actionToDo == "draw") then { 
player addweapon _pistolType; 
player selectWeapon _pistolType;
player setVariable ["pistolDrawn", 1];
}; 

if (_actionToDo == "holster") then { 
player removeweapon _pistolType; 
player setVariable ["pistolDrawn", 0];

};
