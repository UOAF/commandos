//Written by beta
//Modified from Bert
//Init bScripts functions


if (isServer) then
{
    [] execVM "bScripts\ending\setupEndingServer.sqf";
};

if (!(isNull player) || (!isServer && isNull player)) then
{
    while {isNull player} do {sleep 1;};

    [] execVM "bScripts\ending\setupEnding.sqf";

};
