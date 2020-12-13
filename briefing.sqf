//Written by beta
//Briefing file

waituntil{objectivesDone};
waituntil{challengePassDone};

_notes = player createDiaryRecord ["Diary",["Mission Notes","
GENERAL NOTES
<br/><br/>
A Simple TVT mission by Krause.
<br/><br/>
This mission has random objectives every time it is played.<br/><br/>
The maximum duration is 60 minutes or less.
<br/><br/>
If less than 25% of the Russians or less than 1 CIA are alive the mission will end.
<br/><br/>
You may go into the spectator mode at any time by pressing ctrl-shift-alt-b. This is intended for those who crash and want to come back and watch without respawning or otherwise imbalancing the teams.<br/><br/>
Each side has unique radio frequencies pre-programmed - the only time you should worry about the enemy spying on your coms is if they capture a radio.
<br/><br/>
CREDITS
<br/>
Beta for many of the scripts in the mission
<br/>
Sandiford for the score screen script
<br/>
Nou for help with random objectives
"]];

if (vehiclevarname player == "camman") then {

    _camman = player createDiaryRecord ["Diary",["Camera Man Briefing","
As a Camera Man you have some special powers to do your job:  <br/><br/>
1. You are invisible - you still make footstep sounds though. <br/>
2. You cannot speak but you can hear directional.<br/>
3. You can click on the map anywhere to instantly teleport there. <br/>
4. You cannot be killed by fire, but you can be killed by falls and impacts. If you die you will enter spectator mode. Just reslot if you want to walk around again. <br/>
5. You can enter the spectator script at any time by scrolling on your action menu - but you cannot hear other spectators. <br/>
6. If you try to enter vehicles or pick up weapons you will be smitten. <br/>
        "]];

};



switch (side player) do
{
case WEST:
    {
        _coolstuff = player createDiaryRecord ["Diary",["Game Mechanics","
        Be advised of the following game mechanics:  <br/><br/>
        * Russian vehicles may be broken into and hotwired from an action menu option. <br/>
        * You may initiate a knife attack by pressing stand-c (default: shift-c). Those are hit instantly die. <br/>
        * You may hide in the flat bed of ural trucks through an option on the action menu. <br/>
        * You may steal and don enemy uniforms. Don't wear your NVGs if you want to trick people. <br/>
        * You may add traitors to your group through an action menu item. Use this to get them into vehicles with you. <br/>

        "]];

        _commandsignals = player createDiaryRecord ["Diary",["Command and Signals","
        Each operative has a PRC-148 radio.  <br/><br/>


        "]];

        _service = player createDiaryRecord ["Diary",["Service Support","
        Equipment available: <br/><br/>
        Gear car (white Skoda): x6 Balaklava, 10x MRE, Kestrel4500, spotting scope, MX2A, x2 Binoculars, rangefinder, x2 DAGR, x6 VTAC rush, x1 wirecutter, x2 flare guns, x10 blocks of C4, x4 satchels, x2 IR strobes, x2 MAGlite, x20 bandage, x20 morphine, x12 medkit, x12 epi<br/><br/>
        Weapon car (Red): x1 M249, x2 RPG-27, x2 AKS-74, x1 G3SG1, x3 HK416 (silenced), x2 MP5 (silenced), x1 M32, x1 bizon (silenced), x1 AA-12, x1 UZI (silenced), x1 Mk48, x1 TAC-50 (silenced), x1 M24, x5 incind. grenades, x5 flashbangs, x5 claymores, x5 M34, x5 tripflares, x5 PDM<br/><br/>
        Two uniforms from an intercepted Russian patrol, to the 9 o'clock of the assembly area.
        "]];

        _execution = player createDiaryRecord ["Diary",["Execution","
        Stealthily infiltrate the enemy base facility by using the CRRC boats. Use the cars to move up and down to the coast to various departure points. Avoid detection and accomplish your tasking. Use the wide array of resources at your disposal, reference service support.
        "]];

        {
            switch (_x) do { //kill base commander
            case "obj1": {
                    _mission = player createDiaryRecord ["Diary",["Task: Neutralize Base Commander","
        Neutralize the Russian base commander. He was last seen wearing an officer's cap and a heavy jacket with fur along the collar line.
        "]];
                };
            case "obj2": { //kill chad hudson
                    _mission = player createDiaryRecord ["Diary",["Task: Neutralize Dr. Chadori Hudsonski","
        Neutralize Dr. Chadori Hudsonski, experimental physicist. He was last seen wearing a white lab coat.
        "]];
                };
            case "obj3": { //kill zedic
                    _mission = player createDiaryRecord ["Diary",["Task: Neutralize Dr. Gavriil Zedic","
        Neutralize Dr. Gavriil Zedic, chemical warfare expert. He was last seen wearing a brown three piece suit.
        "]];
                };
            case "obj4": { //blow up drones
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Experimental Drones","
        Destroy enemy experimental drones at grid 097 162.
        "]];
                };
            case "obj5": { //blow up t-50
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy T-50 Aircraft","
        Destroy enemy T-50 plane at grid 084 156.
        "]];
                };
            case "obj6": { //blow up apache
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Captured AH-64","
        Destroy captured NATO AH-64 at grid 081 158.
        "]];
                };
            case "obj7": { //blow up cargo plane
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Cargo Plane","
        Destroy enemy cargo plane at grid 098 165.
        "]];
                };
            case "obj8": { //blow up fuel dump
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Base Fuel Dump","
        Destroy enemy fuel supply at grid 095 163.
        "]];
                };
            case "obj9": { //blow up radio tower
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Base Radio Tower","
        Destroy enemy signal tower at grid 094 163.
        "]];
                };
            case "obj10": { //blow up food
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Food Supply","
        Destroy enemy food supply at grid 083 151.
        "]];
                };
            case "obj11": { //hudson defects
                    _mission = player createDiaryRecord ["Diary",["Task: Extract Chadori Hudsonski","
        Dr. Chadori Hudsonski, experimental physicist, wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov.  He is wearing a white lab coat.
        "]];
                };
            case "obj12": { //zedic defects
                    _mission = player createDiaryRecord ["Diary",["Task: Extract Gavriil Zedic","
        Dr. Gavriil Zedic, chemical warfare specialist, wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov. He is wearing a brown suit.
        "]];
                };
            case "obj13": { //commander defects
                    _mission = player createDiaryRecord ["Diary",["Task: Extract Russian Base Commander","
        The russian garrison commander wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov.  He is wearing a cap and a jacket with a fur liner at the neck line.
        "]];
                };
            case "obj14": { //general raid
                    _mission = player createDiaryRecord ["Diary",["Task: General Raid","
        Conduct a raid, killing at least ten enemy.
        "]];
                };
            case "obj15": { //steal tower stuff
                    _mission = player createDiaryRecord ["Diary",["Task: Steal Control Tower Frag Order","
        Infilitrate the enemy base and steal the frag order from the control tower. It should be located on the top floor on a laptop computer.
        "]];
                };
            case "obj16": { //blow up chem plant
                    _mission = player createDiaryRecord ["Diary",["Task: Destroy Base Chemical Plant","
        Destroy the base chemical plant at GRID 079 164.
        "]];
                };
            case "obj17": { //steal hudson's plans
                    _mission = player createDiaryRecord ["Diary",["Task: Steal Chadori's Hudsonksi's Designs","
        Steal Dr. Chadori Hudsonski's experimental designs from the aircraft manufacture at GRID 085 153. The designs should be near a computer station on the wall.
        "]];
                };
            case "obj18": { //photograph cannon
                    _mission = player createDiaryRecord ["Diary",["Task: Photograph Experimental Cannon","
        Photograph an experimental russian cannon at grid 083 152. We need an extreme closeup of the machinery, so you will need to be within 5 meters of it.
        "]];
                };
            }
        } forEach objectives;

        _mission = player createDiaryRecord ["Diary",["Mission","
        Sabotage enemy base facilities, tasking to follow.
        "]];

        _situation = player createDiaryRecord ["Diary",["Situation","
        A secret Russian research facility is located to the south west on the island of Bolshevik. Aerial reconnaissance points to the production of chemical weapons, as well as experimental aircraft testing. The base is guarded by approximately 40 personnel, including a motorpool of motorized vehicles, dog kennels, and a mi-8 helicopter. The garrison may have access to heavy weapons but are unlikely to have them deployed until the base comes under attack.<br/><br/>
        You are a group of Special Activities Division, infiltrated deep behind enemy lines. Expect no support. The government will deny your existence if you are captured.
        "]];

    };

case EAST:
    {
        if (vehiclevarname player in ["dog1","dog2"]) exitWith {
            _service = player createDiaryRecord ["Diary",["You are a dog","
            You cannot talk, but can hear direct. You can communicate with a range of vocalizations. You should listen to your handler, he has a whistle and might use it to ask you to return to him. You can bite enemy by left clicking on them. It takes approximately three serious bites to kill most humans. Most importantly: you can sniff the enemy at up to 500 meters. The closer you get to what you are tracking, the more accurate the readings will be. <br/><br/>
            You may perform long leaps by pressing your reload key (default r). You may scale walls by pressing shift-r. <br/><br/>
            You may sense your handler by using the action menu. Use this if your handler is out of sight.
            "]];
        };        
        if (vehicleVarName player in ["signaller, dr1, dr2, rusCommander"]) then {

            if (("obj11" in objectives) || ("obj12" in objectives) || ("obj13" in objectives)) then {

                if ( "signaller" == vehicleVarName player ) then {

                    private ["_ran"];
                    _ran = random 10;

                    if (_ran > -1) then {

                        _mission = player createDiaryRecord ["Diary",["READ THIS: Decoded Message","
    Last night while working late at the signals station and monitoring traffic you detected an inbound message coming in through a rarely used base radio channel. It was a message in english notifying the 'freedom loving' that 'the passage' was gaurenteed and that the church at Kovrov or Zirnitra would be the 'pickup' point. You do not know the meaning of this cryptic message, but you should probably inform the base commander.
            "]];
                    };

                };
            };

            if ("obj11" in objectives) then {
                if (vehiclevarname player == "dr1") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            if ("obj12" in objectives) then {
                if (vehiclevarname player == "dr2") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            if ("obj13" in objectives) then {
                if (vehiclevarname player == "rusCommander") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            _coolstuff = player createDiaryRecord ["Diary",["Game Mechanics","
            Be advised of the following game mechanics:  <br/><br/>
            * You may buttstroke and knock unconscious CIA infiltrators and traitors by pressing stand-c (default: shift-c). A revive action will then appear on them, which can be used to wake them up. This is the only way they will wake up. <br/>
            * If you manage to get a CIA operative or traitor into the stockade and shoot them, your team gets a substantial point bonus. <br/>

            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for Base Military Research Department","
            High command has tasked the base facility with developing an experimental cannon for a ground attack variant of the MiG-35, based on a copy of the M119 howitzer. Scientists Hudsonki and Zedic are tasked to perform field trials of this weapon system. Ammunition for the weapon was just manufactured by Zedic and is available at the Chemical Plant. Ranging data was just calculated by Hudsonski. Coordinate a field test at target range 0054 at GRID 0903. Impact data will be collected and analyzed by nearby Lab X-18. Acquire a vehicle to move ammo back and forth the chemical plant to the cannon site.<br/><br/>
            Consider requesting a security attachment for your plants, there are important designs and data contained within that might be the target of enemy infiltrators.
            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for K-9 Unit","
            As a K-9 handler you are tasked with giving orders to your dog. Dogs cannot talk, but can hear direct. They can communicate with a range of vocalizations. You have access to a whistle which you can use to call your dog back once you have given it a command. The dog can bite enemy by left clicking on them. It takes approximately three serious bites to kill most humans. Most importantly: dogs can sniff the enemy at up to 500 meters. The closer they get to what they are tracking, the more accurate their readings will be.  <br/><br/>
            Dogs may be loaded into urals and UAZs through an action on the vehicles when the animals are within 3 meters.
            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for Base Senior Sergeant","
            You have an important job on the base. You are tasked with employing the garrison's heavy weapons and special equipment. For up to 5 minutes from H-hour (and at the briefing screen) you can pre-deploy trip flares on the base grounds by clicking your mouse on the map with alt-shift selected. You have 20 tripflares to deploy. You also have a key to the base weapons locker. The weapon locker is at the arsenal on the map and can only be opened once enemy have been spotted. <br/><br/>
            You also have the important task of unlocking vehicles at the motorpool. Make sure you don't give your keys out to the wrong person, otherwise the base weapons and vehicles may fall into the wrong hands.
            "]];

            _commandsignals = player createDiaryRecord ["Diary",["Command and Signals","
            Each trooper has a PRR, leaders also have PRC148 radios.   <br/><br/>
            Callsigns
            <br/>
            1 - Base HQ
            <br/>
            1'1 - 1 Patrol
            <br/>
            1'2 - 2 Patrol
            <br/>
            1'3 - 3 Patrol
            <br/>
            1'4 - 4 Patrol
            <br/>
            1'5 - 5 Patrol
            <br/>
            2'A - 1 K-9
            <br/>
            2'B - 2 K-9
            <br/>
            Goliath - 1 Mi-8
            <br/><br/>
            Suggested Comnet
            <br/>
            Channel 1 (Long Range) - All leadership <br/>
            Channel 1 (Short Range) - 1 Patrol <br/>
            Channel 2 (Short Range) - 2 Patrol <br/>
            Channel 3 (Short Range) - 3 Patrol <br/>
            Channel 4 (Short Range) - 4 Patrol <br/>
            Channel 5 (Short Range) - 5 Patrol <br/>
            Channel 6 (Short Range) - HQ  <br/><br/>


            The challenge and password is " + challengePass + "
            " ]];


            _service = player createDiaryRecord ["Diary",["Service Support","
            The base has a weapons locker located west of signals, but can only be unlocked by someone with the key (represented as dog tags, held by the senior sergeant), and also only after intruders have been spotted. The locker contains PKM machine guns, disposable AT weapons, a Strela, anti-personnel mines, extra ammunition, grenades and other equipment. The senior sergeant may deploy x20 tripflares within 5 minutes of h-hour (see attached for reference). Patrol leaders and assistant patrol leaders have flashlights. <br/><br/>
            The motor pool has 4x UAZ, 4x Urals and x2 motorcycles. These vehicles are locked by default, but can be unlocked by the senior sergeant. <br/><br/>
            The base helicopter will take 7 minutes to prep before it is ready for take off.<br/><br/>
            Recommended Vehicle Plan: <br/><br/>

            1 patrol - 1 ural <br/>
            2 patrol - 1 ural <br/>
            3 patrol - 1 ural <br/>
            4 patrol - 1 ural <br/>
            1 k-9 - 1 UAZ <br/>
            2 k-9 - 1 UAZ<br/>
            HQ - 2 UAZ or 1 UAZ + 1 Motorcycle<br/>
            "]];

            _execution = player createDiaryRecord ["Diary",["Execution","
            Organize a series of area patrols in order to deny infiltrators. Deploy the K-9 units at opposite sides of the island to ensure complete coverage. Use the MI-8 to patrol over the water and relocate quick reaction forces to enemy detections. Ensure security of the base scientists by attaching a security detachment to them at all times. Deploy trip flares via the Senior Sergeant at various overwatch and critical positions adjacent to the base.
            "]];

            _mission = player createDiaryRecord ["Diary",["Mission","
            Patrol and defend the research facility. Provide persons protection to doctors Gavriil Zedic and Chadori Hudsonski. Neutralize all intruders.
            "]];

            _situation = player createDiaryRecord ["Diary",["Situation","
            A few hours ago high command received a tip that a group of CIA operatives had been spotted an hour from the base. Accordingly, the base garrison has been mustered and is to be put on high alert.<br/><br/>
            An (AI) manned checkpoint is to the north leading to the base facility. It is manned by three police officers of the Federal Security Service. They have been alerted and coms have been established. If the infiltrators threaten the checkpoint we will likely be notified.
            "]];
        } else {
            if (("obj11" in objectives) || ("obj12" in objectives) || ("obj13" in objectives)) then {

                if ( "signaller" == vehicleVarName player ) then {

                    private ["_ran"];
                    _ran = random 10;

                    if (_ran > 6) then {

                        _mission = player createDiaryRecord ["Diary",["READ THIS: Decoded Message","
    Last night while working late at the signals station and monitoring traffic you detected an inbound message coming in through a rarely used base radio channel. It was a message in english notifying the 'freedom loving' that 'the passage' was gaurenteed and that the church at Kovrov or Zirnitra would be the 'pickup' point. You do not know the meaning of this cryptic message, but you should probably inform the base commander.
            "]];
                    };

                };
            };

            if ("obj11" in objectives) then {
                if (vehiclevarname player == "dr1") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            if ("obj12" in objectives) then {
                if (vehiclevarname player == "dr2") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            if ("obj13" in objectives) then {
                if (vehiclevarname player == "rusCommander") then {
                    _mission = player createDiaryRecord ["Diary",["READ THIS: Personal Diary","
            DO NOT TELL THE OTHERS ABOUT THIS.<br/><br/>
            I have decided that I am going to flee to the west. My conscience will not allow me to support the activities on this base, and the horrible death that my actions will produce. I have contacted a CIA handler on the main land and he has agreed to smuggle me out of the country from the church at Zirnitra or Kovrov. I need to make it there alive, at any cost.
            "]];
                };
            };

            _coolstuff = player createDiaryRecord ["Diary",["Game Mechanics","
            Be advised of the following game mechanics:  <br/><br/>
            * You may buttstroke and knock unconscious CIA infiltrators and traitors by pressing stand-c (default: shift-c). A revive action will then appear on them, which can be used to wake them up. This is the only way they will wake up. <br/>
            * If you manage to get a CIA operative or traitor into the stockade and shoot them, your team gets a substantial point bonus. <br/>

            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for Base Military Research Department","
            High command has tasked the base facility with developing an experimental cannon for a ground attack variant of the MiG-35, based on a copy of the M119 howitzer. Scientists Hudsonki and Zedic are tasked to perform field trials of this weapon system. Ammunition for the weapon was just manufactured by Zedic and is available at the Chemical Plant. Ranging data was just calculated by Hudsonski. Coordinate a field test at target range 0054 at GRID 0903. Impact data will be collected and analyzed by nearby Lab X-18. Acquire a vehicle to move ammo back and forth the chemical plant to the cannon site.<br/><br/>
            Consider requesting a security attachment for your plants, there are important designs and data contained within that might be the target of enemy infiltrators.
            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for K-9 Unit","
            As a K-9 handler you are tasked with giving orders to your dog. Dogs cannot talk, but can hear direct. They can communicate with a range of vocalizations. You have access to a whistle which you can use to call your dog back once you have given it a command. The dog can bite enemy by left clicking on them. It takes approximately three serious bites to kill most humans. Most importantly: dogs can sniff the enemy at up to 500 meters. The closer they get to what they are tracking, the more accurate their readings will be.  <br/><br/>
            Dogs may be loaded into urals and UAZs through an action on the vehicles when the animals are within 3 meters.
            "]];

            _service = player createDiaryRecord ["Diary",["ATTACHMENT: Tasking for Base Senior Sergeant","
            You have an important job on the base. You are tasked with employing the garrison's heavy weapons and special equipment. For up to 5 minutes from H-hour (and at the briefing screen) you can pre-deploy trip flares on the base grounds by clicking your mouse on the map with alt-shift selected. You have 20 tripflares to deploy. You also have a key to the base weapons locker. The weapon locker is at the arsenal on the map and can only be opened once enemy have been spotted. <br/><br/>
            You also have the important task of unlocking vehicles at the motorpool. Make sure you don't give your keys out to the wrong person, otherwise the base weapons and vehicles may fall into the wrong hands.
            "]];

            _commandsignals = player createDiaryRecord ["Diary",["Command and Signals","
            Each trooper has a PRR, leaders also have PRC148 radios.   <br/><br/>
            Callsigns
            <br/>
            1 - Base HQ
            <br/>
            1'1 - 1 Patrol
            <br/>
            1'2 - 2 Patrol
            <br/>
            1'3 - 3 Patrol
            <br/>
            1'4 - 4 Patrol
            <br/>
            1'5 - 5 Patrol
            <br/>
            2'A - 1 K-9
            <br/>
            2'B - 2 K-9
            <br/>
            Goliath - 1 Mi-8
            <br/><br/>
            Suggested Comnet
            <br/>
            Channel 1 (Long Range) - All leadership <br/>
            Channel 1 (Short Range) - 1 Patrol <br/>
            Channel 2 (Short Range) - 2 Patrol <br/>
            Channel 3 (Short Range) - 3 Patrol <br/>
            Channel 4 (Short Range) - 4 Patrol <br/>
            Channel 5 (Short Range) - 5 Patrol <br/>
            Channel 6 (Short Range) - HQ  <br/><br/>


            The challenge and password is " + challengePass + "
            " ]];


            _service = player createDiaryRecord ["Diary",["Service Support","
            The base has a weapons locker located west of signals, but can only be unlocked by someone with the key (represented as dog tags, held by the senior sergeant), and also only after intruders have been spotted. The locker contains PKM machine guns, disposable AT weapons, a Strela, anti-personnel mines, extra ammunition, grenades and other equipment. The senior sergeant may deploy x20 tripflares within 5 minutes of h-hour (see attached for reference). Patrol leaders and assistant patrol leaders have flashlights. <br/><br/>
            The motor pool has 4x UAZ, 4x Urals and x2 motorcycles. These vehicles are locked by default, but can be unlocked by the senior sergeant. <br/><br/>
            The base helicopter will take 7 minutes to prep before it is ready for take off. <br/><br/>
            Recommended Vehicle Plan: <br/><br/>

            1 patrol - 1 ural <br/>
            2 patrol - 1 ural <br/>
            3 patrol - 1 ural <br/>
            4 patrol - 1 ural <br/>
            1 k-9 - 1 UAZ <br/>
            2 k-9 - 1 UAZ<br/>
            HQ - 2 UAZ or 1 UAZ + 1 Motorcycle
            "]];

            _execution = player createDiaryRecord ["Diary",["Execution","
            Organize a series of area patrols in order to deny infiltrators. Deploy the K-9 units at opposite sides of the island to ensure complete coverage. Use the MI-8 to patrol over the water and relocate quick reaction forces to enemy detections. Ensure security of the base scientists by attaching a security detachment to them at all times. Deploy trip flares via the Senior Sergeant at various overwatch and critical positions adjacent to the base.
            "]];

            _mission = player createDiaryRecord ["Diary",["Mission","
            Patrol and defend the research facility. Provide persons protection to doctors Gavriil Zedic and Chadori Hudsonski. Neutralize all intruders.
            "]];

            _situation = player createDiaryRecord ["Diary",["Situation","
            A few hours ago high command received a tip that a group of CIA operatives had been spotted an hour from the base. Accordingly, the base garrison has been mustered and is to be put on high alert.<br/><br/>
            An (AI) manned checkpoint is to the north leading to the base facility. It is manned by three police officers of the Federal Security Service. They have been alerted and coms have been established. If the infiltrators threaten the checkpoint we will likely be notified.
            "]];
        };
    };
};
