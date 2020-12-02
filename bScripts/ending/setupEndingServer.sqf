//Written by beta
//Init file server


sleep 1;  //wait until mission starts

[] execVM "bScripts\ending\conditionLoopServer.sqf";

sandi_func_endMissionHandler = compile preprocessFileLineNumbers "scripts\sandi\func_endMissionHandler.sqf";
["sandi_endMission", sandi_func_endMissionHandler] call CBA_fnc_addEventHandler;