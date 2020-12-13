sleep 0.1; 
player setVariable["acre_sys_core_isDisabled", true, true];

    waitUntil {player==player};
    //systemchat "inside playerIsDog.sqf";
    _oldPlayerObject = vehicle player;
    _newDogName = (vehiclevarname player) + "_created";
    //systemchat format ["playerobject: %1", _newDogName];

    "krauseDog" createUnit [getpos player,group player, format ["%1 = this", _newDogName]];
    //systemchat format ["createdDog: %1", _unit];
    selectplayer (call compile _newDogName);
    waituntil {player == (call compile _newDogName)};
    deletevehicle _oldPlayerObject;
    player setVariable ["dogID", _newDogName];
    sleep 1;
    player setVariable ["dogInCar", 0];
    player setVariable ["dogStamina", true];
    player enableFatigue false;
    player setCustomAimCoef 0.0;
    player setUnitRecoilCoefficient 0;
    nolandDamage =
    {
        _damage = 0;

        // if this damage has no projectile string, then it's fall damage. if its not fall damage (but getting shot damage) then set the _damage variable to hold the actual damage amount and return that
        if((_this select 4) != "") then
        {
        _damage = _this select 2;
        };

        // return the damage dealt to this unit
        _damage
    };
    // make player unit nolanddamage function when damaged by something:
    []spawn {waituntil{player setAnimSpeedCoef 1.5; sleep 0.1;false}};
    //systemchat "inside dog loop";
    //systemchat format["player is %1",player];
    dogBark2 = player addAction ["Emote: Single Bark", "scripts\dogEmotes.sqf","bark2",-1,false,true,"",""];
    dogBark = player addAction ["Emote: Aggressive Bark", "scripts\dogEmotes.sqf","bark",-1,false,true,"",""];
    dogGrowl = player addAction ["Emote: Growl", "scripts\dogEmotes.sqf","growl",-1,false,true,"",""];
    dogWhine = player addAction ["Emote: Whine", "scripts\dogEmotes.sqf","whine",-1,false,true,"",""];
    dogpant = player addAction ["Emote: Pant/Excited", "scripts\dogEmotes.sqf","pant",-1,false,true,"",""];
    // to allow action menu to appear, reveal all nearby vehicles and ammo crates within 100m/50m radius

    if (player getVariable ["dogID", "ass"] == "dog1_created") then {
        smellHandler = player addAction ["Sense Handler", "scripts\senseHandler.sqf",[handler1],-1,false,true,"",""];
    };
    if (player getVariable ["dogID", "ass"] == "dog2_created") then {
        smellHandler = player addAction ["Sense Handler", "scripts\senseHandler.sqf",[handler2],-1,false,true,"",""];
    };
    dogLeap = [(actionKeys "ReloadMagazine") select 0, [false, false, false], { []execVM "scripts\dogLeap.sqf";  }, "keydown", "leap1"] call CBA_fnc_addKeyHandler;
    dogLeapWall = [(actionKeys "ReloadMagazine") select 0, [true, false, false], { []execVM "scripts\dogLeapWall.sqf";  }, "keydown", "leap2"] call CBA_fnc_addKeyHandler;


//doggy night vision

_dogVision = ppEffectCreate ["colorCorrections", 1501];
_dogVision ppEffectEnable true;
_dogVision ppEffectAdjust[ 0.6, 0.26, 0, [0.32, 5, 5, 0],[5, 5, 5, 0.83],[5, 5, 5, 5]];
_dogVision ppEffectCommit 0;

//bite motherfuckers

[] spawn {
    waitUntil { !isNull (findDisplay 46) };
    _bitingbitches = (finddisplay 46) displayaddeventhandler ["MouseButtonDown", "

    private ['_nearestunits', '_nearestunitofside', '_cooldown', '_rand'];

    if (((_this select 1) == 0) ) then {

    _nearestunits = nearestObjects [player,['Man'],2];

    _nearestunitofside = [];

    if(west countSide _nearestunits > 0) then {
        {
        _unit = _x;
        if(side _unit == west) then{_nearestunitofside = _nearestunitofside + [_unit]};
        } foreach _nearestunits;


_lastbite = ((_nearestunitofside select 0) getVariable ['canBeBit', -999]);

        if(time - _lastbite > 4) then {
        (_nearestunitofside select 0) setVariable ['canBeBit', time, true];
        [(_nearestunitofside select 0), 'bitbyDog'] call CBA_fnc_globalSay3d;
        [player, 'dogbark1'] call CBA_fnc_globalSay3d;
        (_nearestunitofside select 0) setdammage ((getDammage (_nearestunitofside select 0)) + 0.35);

                [-1, {
                private ['_objPosition', '_objposition', '_obj', '_pos', '_velocity', '_color', '_alpha', '_ps11'];
            _objPosition = getPos (_this select 0);
_objposition = (_objposition select 2);

            _obj = vehicle (_this select 0);
            _pos = position _obj;
            _velocity = [0,0,.1];
            _color = [.5, 0, 0];
            _alpha = .7;
            _ps11 = '#particlesource' createVehicleLocal _pos;
                        _ps11 attachTo [(_this select 0)];

            _ps11 setParticleParams [['\Ca\Data\ParticleEffects\Universal\Universal', 16, 7, 48], '', 'Billboard', 1, 6, [0, 0, 0.5], [0, 0, 0], 0, 10, 1, 0, [1,5],[[1,0,0,0.8],[1,0,0,0]], [0.5,0.5,0], 1, 1, '', '', ''];
            _ps11 setParticleRandom [.1, [0, 0, 0], [1, 2, 2], 1, 0, [0, 0, .2, 1.1], 0, 0];
            _ps11 setParticleCircle [0, [0, 0, 0]];
            _ps11 setDropInterval 0.01;
            sleep .4;
deletevehicle _ps11;

    }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

_rand = random 1;
if (_rand > 0.25) then {
        [-2, {
        (_this select 0) switchMove 'ActsPercMrunSlowWrflDf_TumbleOver';
    }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;
        };
        };
    };
    };
"];
};

//stamina cooldown for leaping
[] spawn
{

    private ["_stamina"];

    while {true} do {

        _stamina = player getVariable "dogStamina";

        if !(_stamina) then {
            player setVariable ["dogStamina", true];
        };

        sleep 3;

    };

};

[] spawn
{
    private ["_nearestunits", "_nearestunitofside", "_capitalistrange", "_dirToCapitalist"];

    while {true} do { //superior nose

        _nearestunits = nearestObjects [player,["Man"],500];

        _nearestunitofside = [];

        if(west countSide _nearestunits > 0) then{
            {
                _unit = _x;
                if(side _unit == west) then{_nearestunitofside = _nearestunitofside + [_unit]};
            } foreach _nearestunits;
        };


        if (count _nearestunitofside > 0) then {
            _capitalistrange = [Player, (_nearestunitofside select 0)] call CBA_fnc_getDistance;


            switch (true) do {
            case (_capitalistrange > 400): {

                    _capitalistrange = "very far";
                };

            case ((_capitalistrange > 300) && (_capitalistrange < 400)): {

                    _capitalistrange = "far";
                };

            case ((_capitalistrange > 200) && (_capitalistrange < 300)): {

                    _capitalistrange = "medium";
                };

            case ((_capitalistrange > 100) && (_capitalistrange < 200)): {

                    _capitalistrange = "close";
                };

            case ((_capitalistrange > 0) && (_capitalistrange < 100)): {

                    _capitalistrange = "VERY CLOSE!";
                };
            };

            _dirToCapitalist = [player, (_nearestunitofside select 0)] call CBA_fnc_headDir;
            _dirToCapitalist = _dirToCapitalist select 1;

            switch (true) do {

            case ((_dirToCapitalist > 0) && (_dirToCapitalist < 31)): {
                    _dirToCapitalist = "12 o'clock";

                };

            case ((_dirToCapitalist > 30) && (_dirToCapitalist < 61)): {
                    _dirToCapitalist = "1 o'clock";

                };

            case ((_dirToCapitalist > 60) && (_dirToCapitalist < 91)): {
                    _dirToCapitalist = "2 o'clock";

                };

            case ((_dirToCapitalist > 90) && (_dirToCapitalist < 121)): {
                    _dirToCapitalist = "3 o'clock";

                };

            case ((_dirToCapitalist > 120) && (_dirToCapitalist < 151)): {
                    _dirToCapitalist = "4 o'clock";

                };

            case ((_dirToCapitalist > 150) && (_dirToCapitalist < 181)): {
                    _dirToCapitalist = "5 o'clock";

                };

            case ((_dirToCapitalist > -181) && (_dirToCapitalist < -150)): {

                    _dirToCapitalist = "6 o'clock";
                };

            case ((_dirToCapitalist > -151) && (_dirToCapitalist < -120)): {

                    _dirToCapitalist = "7 o'clock";
                };

            case ((_dirToCapitalist > -121) && (_dirToCapitalist < -90)): {

                    _dirToCapitalist = "8 o'clock";
                };

            case ((_dirToCapitalist > -91) && (_dirToCapitalist < -60)): {

                    _dirToCapitalist = "9 o'clock";
                };

            case ((_dirToCapitalist > -61) && (_dirToCapitalist < -30)): {

                    _dirToCapitalist = "10 o'clock";
                };

            case ((_dirToCapitalist > -31) && (_dirToCapitalist < -0.0000001)): {

                    _dirToCapitalist = "11 o'clock";
                };

            };

            hintsilent format ["You smell a capitalist pig at %1 range, at %2", _capitalistrange, _dirToCapitalist];

        };






        sleep 10;
    };
};