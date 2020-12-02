if (isServer) then {
  _truck = _this select 0;
  _position = _this select 1;
  _time = _this select 2;
  _type = _this select 3;
  while {true} do {
    waitUntil {!alive _truck};
    sleep _time;
    _truck = createVehicle [_type, _position, [], 0, "none"];
    
    _truck addAction ['Change Tires', 'scripts\repairTires.sqf', [this], -25, true, true, '', '(damage _target > 0) && (damage _target < 1) && !(player in _target)'];  
  };
};