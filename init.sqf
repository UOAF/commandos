if (isNil "debugenabled") then {debugenabled = false;};
fnc_debugPrint = {
    if (debugenabled) then
    {
        systemChat _this;
        diag_log format ["%1 debug: %2", systemTime, _this];
    };
    debugenabled
};
//objective variables
if (isNil "BLUFOR_timer") then {BLUFOR_timer = false;};
if (isNil "BLUFOR_CC") then {BLUFOR_CC = false;};
if (isNil "setupdone") then {setupdone = false;};
if (isNil "bluforWin") then {bluforWin = false;};
if (isNil "challengePassDone") then {challengePassDone = false;};
if (isNil "tripflares") then {tripflares = 20;};
if (isNil "fuelDump") then {fuelDump = false;};
if (isNil "stealRadarTower") then {stealRadarTower = false;};
if (isNil "blowChemPlant") then {blowChemPlant = false;};
if (isNil "stealHudsonPlans") then {stealHudsonPlans = false;};
if (isNil "photoCannon") then {photoCannon = false;};
if (isNil "radioTowerDestroyed") then {radioTowerDestroyed = false;};
if (isNil "foodStorage") then {foodStorage = false;};
if (isNil "dr1defected") then {dr1defected = false;};
if (isNil "dr2defected") then {dr2defected = false;};
if (isNil "commanderDefected") then {commanderDefected = false;};
if (isNil "stockadeLocked") then {stockadeLocked = true;};
if (isNil "flareFlareMarkerIndex") then {flareFlareMarkerIndex = 0;};
if (isNil "sciencepoints") then {sciencepoints = 0;};
if (isNil "liquidationPoints") then {liquidationPoints = 0;};
if (isNil "sandi_assessment_ending") then {sandi_assessment_ending = false;};
if (isNil "bannedWeaponsBluFor") then {
    bannedWeaponsBluFor = [];
};
if (isNil "bannedWeaponsOpFor") then {
    bannedWeaponsOpFor = ["m16a4", "ACE_M16A4_CCO_GL", "ACE_M4_Aim", "ACE_M240G_M145", "M4A1_Aim", "ACE_M4_AIM_GL", "M249_m145_EP1", "ACE_Mk12mod1", "M240", "Javelin", "ACE_Javelin_CLU"];
};

//global inits
enableEngineArtillery false;  //disable BI arty comp
ace_sys_wounds_no_medical_gear = true;
[] spawn { sleep 3; ace_sys_map_minMapSize = 0 };

if (isServer) then  //server
{
    [] execVM "scripts\randomizeObjectives.sqf";
    [] execVM "scripts\targetRange.sqf";
    [] execVM "scripts\gateCheck.sqf";
    [] execVM "scripts\sandi\sandiInit.sqf";
    [] execVM "scripts\paramSet.sqf";
    [] execVM "scripts\setChallengePass.sqf"; //challenge and pass creation and transmission

    []spawn{
        sleep 1;
        helo lock true;
        sleep 420;
        helo lock false;
        [-1, {if (side player == east) then {hint "Base helicopter has finished being prepped and is ready to take off!"}; }] call CBA_fnc_globalExecute;
    };

    []spawn{
        sleep 1;
        [-1, {waituntil {challengePassDone}; if (side player == east) then {player sidechat format ["The challenge and pass is %1, write it down and remember it!", challengePass];}; }] call CBA_fnc_globalExecute;
    };

};

if (!(isNull player)) then  //non-JIP player
{
    [] execVM "briefing.sqf"; //init briefing
    [] execVM "scripts\commonPlayer.sqf"; //runs on every player
    [] execVM "scripts\outOfBounds.sqf"; //out of bounds check
    [] execVM "scripts\playerDeath.sqf"; //monitors for player death, then puts them into spectator and increments points
    [] execVM "scripts\setRadio.sqf"; //unique frequencies for ACRE
    [] execVM "scripts\weaponCheck.sqf"; //check to see that people aren't taking enemy weapons
    [] execVM "scripts\pilotCheck.sqf"; //check to see if players are qualified to fly
    [] execVM "scripts\defectorCheck.sqf"; //checks to see if the player is a defector, then executes special code
    // [] execVM "scripts\fair.sqf";  //check to see if the player is a cheater

    if (side player == east) then { //runs on all russian players
        [] execVM "scripts\russianInit.sqf";
    };
    if (side player == west) then { //runs on all CIA players
        [] execVM "scripts\CIAinit.sqf";
    };
    if (vehiclevarname player in ["dog1","dog2"]) then {  //runs on all dogs
        [] execVM "scripts\playerIsDog.sqf";
    };
    if ( "camman" == vehicleVarName player ) then { //camera man init functions
        [] execVM "scripts\cameramaninit.sqf";

    };

};

if (!isServer && isNull player) then  //JIP player
{
    waitUntil {!isNull player};

    [] execVM "briefing.sqf"; //init briefing
    [] execVM "scripts\commonPlayer.sqf"; //runs on every player
    [] execVM "scripts\outOfBounds.sqf"; //out of bounds check
    [] execVM "scripts\playerDeath.sqf"; //monitors for player death, then puts them into spectator and increments points
    [] execVM "scripts\setRadio.sqf"; //unique frequencies for ACRE
    [] execVM "scripts\weaponCheck.sqf"; //check to see that people aren't taking enemy weapons
    [] execVM "scripts\pilotCheck.sqf"; //check to see if players are qualified to fly
    [] execVM "scripts\defectorCheck.sqf"; //checks to see if the player is a defector, then executes special code
    [] execVM "scripts\fair.sqf";  //check to see if the player is a cheater

    if (side player == east) then { //runs on all russian players
        [] execVM "scripts\russianInit.sqf";
    };
    if (side player == west) then { //runs on all CIA players
        [] execVM "scripts\CIAinit.sqf";
    };
    if (vehiclevarname player in ["dog1","dog2"]) then {  //runs on all dogs
        [] execVM "scripts\playerIsDog.sqf";
    };
    if ( "camman" == vehicleVarName player ) then { //camera man init functions
        [] execVM "scripts\cameramaninit.sqf";

    };

};

[] execVM "initArsenal.sqf";
[] execVM "scripts\chopperparaflare.sqf";

[] execVM "bScripts\bInit.sqf";  //init bScripts functions
