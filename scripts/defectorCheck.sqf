
sleep 5;

if ("obj11" in objectives) then {
    if (vehiclevarname player == "dr1") then {
        player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then { ["liquidation", player] call CBA_fnc_globalEvent;}; }];

        []spawn{
            sleep 1;
            hint "You are a defector! READ THE BRIEFING.";
            waitUntil {sleep 1; dr1defected};
            hintsilent "You have escaped to the west!";
            [-2, {if (side player == west) then { hintsilent "Dr. Hudsonski has escaped the island and is in CIA custody!";  };}] call CBA_fnc_globalExecute;
            sleep 5;
            player setPos (getpos specpen);
            player addEventHandler ["HandleDamage", {false}];
            player setVariable ["ace_w_allow_dam", false];
            player setVariable ["ace_w_eh",0];
            {player removeMagazine _x} forEach magazines player;
            removeAllWeapons player;
            removeAllItems player;
            [] execVM "scripts\gdtmod_spectator.sqf"; _has_spec = true;
        };
    };
};

if ("obj12" in objectives) then {
    if (vehiclevarname player == "dr2") then {
        player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then { ["liquidation", player] call CBA_fnc_globalEvent;}; }];

        []spawn{
            sleep 1;
            hint "You are a defector! READ THE BRIEFING.";
            waitUntil {sleep 1; dr2defected};
            hintsilent "You have escaped to the west!";
            [-2, {if (side player == west) then { hintsilent "Dr. Zedic has escaped the island and is in CIA custody!";  };}] call CBA_fnc_globalExecute;
            sleep 5;
            player setPos (getpos specpen);
            player addEventHandler ["HandleDamage", {false}];
            player setVariable ["ace_w_allow_dam", false];
            player setVariable ["ace_w_eh",0];
            {player removeMagazine _x} forEach magazines player;
            removeAllWeapons player;
            removeAllItems player;
            [] execVM "scripts\gdtmod_spectator.sqf"; _has_spec = true;
        };
    };
};

if ("obj13" in objectives) then {
    if (vehiclevarname player == "rusCommander") then {
        player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then { ["liquidation", player] call CBA_fnc_globalEvent;}; }];

        []spawn{
            sleep 1;
            hint "You are a defector! READ THE BRIEFING.";
            waitUntil {sleep 1; commanderDefected};
            hintsilent "You have escaped to the west!";
            [-2, {if (side player == west) then { hintsilent "The Russian commander has escaped the island and is in CIA custody!";  };}] call CBA_fnc_globalExecute;
            sleep 5;
            player setPos (getpos specpen);
            player addEventHandler ["HandleDamage", {false}];
            player setVariable ["ace_w_allow_dam", false];
            player setVariable ["ace_w_eh",0];
            {player removeMagazine _x} forEach magazines player;
            removeAllWeapons player;
            removeAllItems player;
            [] execVM "scripts\gdtmod_spectator.sqf"; _has_spec = true;
        };
    };
};
