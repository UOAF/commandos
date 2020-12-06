  if (!(typeof player == "RU_Soldier_Pilot") && !(typeof player == "Soldier_TL_PMC")) then {
    private "_vic";
    while {alive player} do {
      waituntil {vehicle player != player};
      _vic = vehicle player;
      if (_vic iskindof "Helicopter" || _vic iskindof "Plane"   && !(_vic iskindof "ParachuteBase")) then {
        if (driver _vic == player) then {
          moveout player; 
          waituntil {vehicle player == player};
          hint "Should have brushed up on your maths in uni. You cant fly this damn thing!";
        };
      };
    sleep 0.5; 
    };
  };