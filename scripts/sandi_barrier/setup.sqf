_logic =  _this select 0;
_radius = _this select 1;
_time =   _this select 2;
_side =   _this select 3;

_pos = getPos _logic;
_dir = getDir _logic;
_startedVarName = "sandi_setup_done_" + (str _side);

if (isServer) then { // server
  [_time, _side, _startedVarName] spawn {
    _time = _this select 0;
    _side = _this select 1;
    _startedVarName = _this select 2;
    
    sleep _time; // wait for setup to end
    
    missionNamespace setVariable [_startedVarName, true];
    publicVariable _startedVarName;
  };
};

if (!isDedicated) then { // player

  waitUntil {!isNull player};
  if (side player == _side) then {
  
    if (isNil _startedVarName) then { // setup
    
      _name = "setup_" + str _side;
      createMarkerLocal [_name, _pos];
      //_name setMarkerDir _dir;
      _name setMarkerDirLocal _dir;
      _name setMarkerShapeLocal "RECTANGLE"; 
      _name setMarkerSizeLocal [_radius, _radius];
      _name setMarkerBrushLocal "Border";
      if (_side == west) then {
        _name setMarkerColorLocal "ColorBlue";
      };
      if (_side == east) then {
        _name setMarkerColorLocal "ColorRed";
      };

      // make barrier
      _barrierHandle = [_pos, _radius, _radius, _dir, "rectangle", "The setup area ends here"] call compile preprocessFileLineNumbers "scripts\sandi_barrier\register.sqf";
      
      sleep 5;
      hint parsetext ("<t size=3 align=left>You have " + (str _time) + " seconds setup time </t>");
      
      [_startedVarName, _barrierHandle, _name] spawn {
        _startedVarName = _this select 0;
        _barrierHandle = _this select 1;
        _markerName = _this select 2;
        
        waitUntil {!isNil _startedVarName};

        sandi_barrier_barriers set [_barrierHandle, 0];
        deleteMarkerLocal _markerName;
        hint parsetext ("<t size=3 align=left>SETUP COMPLETE!</t>");
      };
    };
  };
};