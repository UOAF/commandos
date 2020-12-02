private ["_defector", "_capturer"];

_defector = _this select 0; 
_capturer = _this select 1; 

[_defector] join (group _capturer);
 
_defector removeaction defect; 