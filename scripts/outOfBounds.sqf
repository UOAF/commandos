//Written by beta
//Kills a player if they move out of the AO


while {true} do
{
    if (!(player inArea "aom") && (player distance specPen > 100) && !("camman" == vehicleVarName player)) then
    {
        hint "You have left the Area of Operations. TURN BACK NOW.";
        sleep 20; 
        if (!(player inArea "aom") && (player distance specPen > 100) && !("camman" == vehicleVarName player)) then
        {
            hint "Should have paid attention to the briefing and/or watched your map.";
            player say ["retardalert",5];
            sleep 10;
            player setDamage 1;
        };
    };
    
    if ((player inArea "retardlake") && !("camman" == vehicleVarName player)) then
    {
            player say ["retardalert",5];
            sleep 10;
            player setDamage 1;

    };
    
    sleep 5;
};
