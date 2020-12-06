//Written by beta
//Briefing file

waituntil{objectivesDone};


_notes = player createDiaryRecord ["Diary",["Mission Notes","
GENERAL NOTES
<br/><br/>
A Simple TVT mission by Krause.
<br/><br/>
This mission has random objectives every time it is played.<br/><br/>
These missions do not have respawn and have simple objectives. The maximum duration is 60 minutes or less.
<br/><br/>
If less than 25% of the Russians or less than 1 CIA are alive the mission will end.
<br/><br/>
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


        _commandsignals = player createDiaryRecord ["Diary",["Command and Signals","
        Each operative has a PRC-148 radio.  <br/><br/>


        "]];

        _service = player createDiaryRecord ["Diary",["Service Support","
    Equipment available: <br/><br/>
    Gear car (white Skoda): x6 Balaklava, 10x bundles of cash, Kestrel4500, spotting scope, MX2A, x2 Binoculars, rangefinder, x2 DAGR, x6 VTAC rush, x1 wirecutter, x2 flare guns, x10 blocks of C4, x4 satchels, x2 IR strobes, x2 MAGlite, x20 bandage, x20 morphine, x12 medkit, x12 epi<br/><br/>
    Weapon car (Red): x1 M249, x2 RPG-27, x2 AKS-74, x1 G3SG1, x3 HK416 (silenced), x2 MP5 (silenced), x1 M32, x1 bizon (silenced), x1 AA-12, x1 UZI (silenced), x1 Mk48, x1 TAC-50 (silenced), x1 M24, x5 incind. grenades, x5 flashbangs, x5 claymores, x5 M34, x5 tripflares, x5 PDM
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
        Infilitrate the enemy base and steal the frag order from the control tower. It should be located in a set of metal lockers on the top floor.
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

