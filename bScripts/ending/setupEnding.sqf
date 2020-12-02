//Written by beta
//Init file


sleep 1;  //wait until mission starts

[] execVM "bScripts\ending\conditionLoopClient.sqf";

sandi_func_assessmentHandler = compile preprocessFileLineNumbers "scripts\sandi\func_assessmentHandler.sqf";
["sandi_assessment", sandi_func_assessmentHandler] call CBA_fnc_addEventHandler;