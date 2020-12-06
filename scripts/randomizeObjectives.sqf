private ["_numberTasks", "_ranIndex", "_ranObj"];
possibleObjectives = ["obj1", "obj2", "obj3", "obj4", "obj5", "obj6", "obj7", "obj8", "obj9", "obj10", "obj11", "obj12", "obj13", "obj14", "obj15", "obj16", "obj17", "obj18"];
objectives =[];
objectivesText =[];

//(paramsArray select 1) == 1
//_numberTasks = 18;

_numberTasks = 3;


if ((paramsArray select 1) == 0) then { //1 task

    _numberTasks = 2;

};

if ((paramsArray select 1) == 2) then { //4 tasks

    _numberTasks = 4;

};

if ((paramsArray select 1) == 3) then { //5 tasks

    _numberTasks = 5;

};

if ((paramsArray select 1) == 4) then { //6 tasks

    _numberTasks = 6;

};

if ((paramsArray select 1) == 5) then { //7 tasks

    _numberTasks = 7;

};

if ((paramsArray select 1) == 6) then { //8 tasks

    _numberTasks = 8;

};

if ((paramsArray select 1) == 7) then { //9 tasks

    _numberTasks = 9;

};

if ((paramsArray select 1) == 8) then { //10 tasks

    _numberTasks = 10;

};


for "_i" from 1 to _numberTasks do {
    _ranIndex = round (random((count possibleObjectives)-1));

    _ranObj = possibleObjectives select _ranIndex;


    objectives = objectives + [_ranObj];
    possibleObjectives = possibleObjectives - [_ranObj];

};

publicvariable "objectives";

objectivesText = objectives; //for end game reference, to show what objectives opfor had
publicvariable "objectivesText";

objectivesDone = true; //to sync with briefing
publicvariable "objectivesDone";

[]spawn { //sat surveillance of HVTs
    sleep 1;

    while {true} do {

        if (("obj1" in objectives)  || ("obj13" in objectives)) then {
            [-1, {
                if (side player == west) then {

                    hint "Satelite data updated.";

                    deletemarkerlocal "baddudesAO";
                    deletemarkerlocal "baddudessymbol";

                    _marker = createMarkerLocal ["baddudesAO", ([(getpos RusCommander select 0) + (random 200), (getpos RusCommander select 1) + (random 200), (getpos RusCommander select 2)])  ];
                    "baddudesAO" setMarkerSizeLocal [200, 200];
                    "baddudesAO" setMarkerShapeLocal "ELLIPSE";
                    "baddudesAO" setMarkerBrushLocal "BORDER";
                    "baddudesAO" setMarkerColorLocal "ColorRed";

                    _marker = createMarkerLocal ["baddudessymbol", (getmarkerpos "baddudesAO") ];
                    "baddudessymbol" setMarkerTypeLocal "hd_warning";
                    "baddudessymbol" setMarkerColorLocal "ColorRed";
                    "baddudessymbol" setMarkerTextLocal "Enemy Commander";
                };
            }] call CBA_fnc_globalExecute;

        };


        if (("obj2" in objectives) || ("obj11" in objectives)) then {
            [-1, {
                if (side player == west) then {

                    hint "Satelite data updated.";

                    deletemarkerlocal "dr1AO";
                    deletemarkerlocal "dr1symbol";

                    _marker = createMarkerLocal ["dr1AO", ([(getpos dr1 select 0) + (random 200), (getpos dr1 select 1) + (random 200), (getpos dr1 select 2)])  ];
                    "dr1AO" setMarkerSizeLocal [200, 200];
                    "dr1AO" setMarkerShapeLocal "ELLIPSE";
                    "dr1AO" setMarkerBrushLocal "BORDER";
                    "dr1AO" setMarkerColorLocal "ColorGreen";

                    _marker = createMarkerLocal ["dr1symbol", (getmarkerpos "dr1AO") ];
                    "dr1symbol" setMarkerTypeLocal "hd_warning";
                    "dr1symbol" setMarkerColorLocal "ColorGreen";
                    "dr1symbol" setMarkerTextLocal "Dr. Hudsonski";
                };
            }] call CBA_fnc_globalExecute;

        };

        if (("obj3" in objectives)  || ("obj12" in objectives)) then {
            [-1, {
                if (side player == west) then {

                    hint "Satelite data updated.";

                    deletemarkerlocal "dr2AO";
                    deletemarkerlocal "dr2symbol";

                    _marker = createMarkerLocal ["dr2AO", ([(getpos dr2 select 0) + (random 200), (getpos dr2 select 1) + (random 200), (getpos dr2 select 2)])  ];
                    "dr2AO" setMarkerSizeLocal [200, 200];
                    "dr2AO" setMarkerShapeLocal "ELLIPSE";
                    "dr2AO" setMarkerBrushLocal "BORDER";
                    "dr2AO" setMarkerColorLocal "ColorBlue";

                    _marker = createMarkerLocal ["dr2symbol", (getmarkerpos "dr2AO") ];
                    "dr2symbol" setMarkerTypeLocal "hd_warning";
                    "dr2symbol" setMarkerColorLocal "ColorBlue";
                    "dr2symbol" setMarkerTextLocal "Dr. Zedic";
                };
            }] call CBA_fnc_globalExecute;

        };
        sleep 300;
    };
};

while {(count objectives) > 0} do {
    {
        //hint format ["%1", objectives];
        switch (_x) do { //kill base commander
        case "obj1": {
                if (isnil ("rusCommander")) then {
                    objectives = objectives - ["obj1"];
                }else {
                    if (!alive rusCommander) then {
                        objectives = objectives - ["obj1"];
                    };
                };
            };
        case "obj2": { //kill chad hudson
                if (isnil ("dr1")) then {
                    objectives = objectives - ["obj2"];
                }else {
                    if (!alive dr1) then {
                        objectives = objectives - ["obj2"];
                    };
                };
            };
        case "obj3": { //kill zedic
                if (isnil ("dr2")) then {
                    objectives = objectives - ["obj3"];
                }else {
                    if (!alive dr2) then {
                        objectives = objectives - ["obj3"];
                    };
                };
            };
        case "obj4": { //blow up drones
                if (((damage drone1)>0.2) && ((damage drone2)>0.2) && ((damage drone3)>0.2)) then {
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position drone1);
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position drone2);
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position drone3);
                    objectives = objectives - ["obj4"];
                };
            };
        case "obj5": { //blow up t-50
                if ((damage t50)>0.2) then {
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position t50);
                    objectives = objectives - ["obj5"];

                };
            };
        case "obj6": { //blow up apache
                if ((damage apache)>0.05) then {
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position apache);
                    objectives = objectives - ["obj6"];

                };
            };
        case "obj7": { //blow up cargo plane
                if (!canmove cargoplane) then {
                    _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position cargoplane);
                    objectives = objectives - ["obj7"];

                };
            };
        case "obj8": { //blow up fuel dump
                if (fuelDump) then {
                    objectives = objectives - ["obj8"];
                    []spawn {
                        sleep 1;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position fuel1);
                        sleep 2;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position fuel2);
                        sleep 1;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position fuel3);
                        sleep 10;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position fuel4);
                    };
                };
            };
        case "obj9": { //blow up radio tower
                if (radioTowerDestroyed) then {
                    objectives = objectives - ["obj9"];
                    []spawn {
                        sleep 0.25;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position towerloc);
                        sleep 0.25;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position towerloc);
                        sleep 0.25;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position towerloc);
                        sleep 0.25;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position towerloc);
                        sleep 0.25;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position towerloc);
                    };
                };
            };
        case "obj10": { //blow up food
                if (foodStorage) then {
                    objectives = objectives - ["obj10"];
                    [-1, {BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; smokeFX = [foodloc, 10, time, false, false] spawn BIS_Effects_Burn;
                    }] call CBA_fnc_globalExecute;
                };
            };
        case "obj11": { //dr. Hudsonski defects
                if (isnil ("dr1")) then {
                    objectives = objectives - ["obj11"];
                    dr1defected = true;
                    publicvariable "dr1defected";
                } else {
                    if (!alive dr1) then {
                        objectives = objectives - ["obj11"];
                        dr1defected = true;
                        publicvariable "dr1defected";
                    };
                    if ((dr1 distance city1 < 50) || (dr1 distance city2 < 50)) then {
                        objectives = objectives - ["obj11"];
                        dr1defected = true;
                        publicvariable "dr1defected";
                    };
                };
            };
        case "obj12": { //dr. Zedic defects
                if (isnil ("dr2")) then {
                    objectives = objectives - ["obj12"];
                    dr2defected = true;
                    publicvariable "dr2defected";
                } else {
                    if ((dr2 distance city1 < 50) || (dr2 distance city2 < 50)) then {
                        objectives = objectives - ["obj12"];
                        dr2defected = true;
                        publicvariable "dr2defected";
                    };
                    if (!alive dr2) then {
                        objectives = objectives - ["obj12"];
                        dr2defected = true;
                        publicvariable "dr2defected";
                    };
                };
            };
        case "obj13": { //Commander defects
                if (isnil ("rusCommander")) then {
                    objectives = objectives - ["obj13"];
                    commanderDefected = true;
                    publicvariable "commanderDefected";
                } else {
                    if ((rusCommander distance city1 < 50) || (rusCommander distance city2 < 50)) then {
                        objectives = objectives - ["obj13"];
                        commanderDefected = true;
                        publicvariable "commanderDefected";
                    };
                    if (!alive rusCommander) then {
                        objectives = objectives - ["obj13"];
                        commanderDefected = true;
                        publicvariable "commanderDefected";
                    };
                };
            };
        case "obj14": { //General raid
                // if sandi has not yet been initialized, it's possible that 
                // this loop gets here first and causes a script error. Just
                // skip this condition in that case; it will be caught in the
                // next iteration.
                if (!(isNil "sandi_red_deaths")) then {                
                    if (sandi_red_deaths > 9) then {
                        objectives = objectives - ["obj14"];
                    };
                };
            };
        case "obj15": { //steal control tower intel
                if (stealRadarTower) then {
                    objectives = objectives - ["obj15"];
                };
            };

        case "obj16": { //blow up chem plant
                if (blowChemPlant) then {
                    objectives = objectives - ["obj16"];

                    []spawn {
                        sleep 1;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position chemtank1);
                        sleep 2;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position chemtank2);
                        sleep 1;
                        _veh = "ACE_ARTY_R_120mm_HE" createVehicle (position chemtank3);
                        [-1, {BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; smokeFX = [chemfire1, 10, time, false, false] spawn BIS_Effects_Burn;
                            BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; smokeFX = [chemfire2, 10, time, false, false] spawn BIS_Effects_Burn;
                        }] call CBA_fnc_globalExecute;
                    };
                };
            };

        case "obj17": { //steal hudsonski's plans
                if (stealHudsonPlans) then {
                    objectives = objectives - ["obj17"];
                };
            };
        case "obj18": { //photograph experimental canonn
                if (photoCannon) then {
                    objectives = objectives - ["obj18"];
                };
            };
        }
    } forEach objectives;
    sleep 1;

};

bluforWin = true;
publicvariable "bluforWin";