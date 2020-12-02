//Written by beta
//Try to prevent seeing through grass and too much viewdistance


if (isClass(configFile/"CfgPatches"/"gdtmod_grass")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using GDT Mod Grass and may have an unfair advantage.';", name player];
	processInitCommands;
};

if (isClass(configFile/"CfgPatches"/"VFFPSS_ControlPanel")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using VFFPSS and may have an unfair advantage.';", name player];
	processInitCommands;
};

if (isClass(configFile/"CfgPatches"/"asr_lowgrass")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using ASR Low Grass and may have an unfair advantage.';", name player];
	processInitCommands;
};

if (isClass(configFile/"CfgPatches"/"Deadclut_Cher")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using FPS Helper and may have an unfair advantage.';", name player];
	processInitCommands;
};

if (isClass(configFile/"CfgPatches"/"Deadclut_misc")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using FPS Helper and may have an unfair advantage.';", name player];
	processInitCommands;
};

if (isClass(configFile/"CfgPatches"/"Deadclut_Utes")) then
{
	ao setVehicleInit format["ao globalChat '%1 is using FPS Helper and may have an unfair advantage.';", name player];
	processInitCommands;
};

while {true} do
{
	setTerrainGrid 12.5;
	
	if (viewDistance > maxViewDist) then
	{
		setViewDistance maxViewDist;
		viewDist = maxViewDist;
	};
	
	sleep 1;
};
