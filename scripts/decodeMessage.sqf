private["_GuyGettingSnuffed", "_objCount", "_randomNum", "_randomObj", "_text" ];

_GuyGettingSnuffed = _this select 3 select 0; 

player removeAction decode;  

player removeweapon "EvMoscow";

_objCount = (count objectivesText) - 1;

_randomNum = round(random _objCount);

_randomObj = objectivesText select _randomNum; 

hint "Decoding!";

_text = ""; 

switch (_randomObj) do { 

		case "obj1": { 
		_text = "Neutralize the Russian base commander. He was last seen wearing an officer's cap and a heavy jacket with fur along the collar line.";
			};
		case "obj2": { //kill chad hudson
		_text = "Neutralize Dr. Chadori Hudsonski, experimental physicist. He was last seen wearing a white lab coat.";
			};
		case "obj3": { //kill zedic
				_text = "Neutralize Dr. Gavriil Zedic, chemical warfare expert. He was last seen wearing a brown three piece suit. ";
 
			};
		case "obj4": { //blow up drones
				_text = "Destroy enemy experimental drones at grid 097 162.";
			};
		case "obj5": { //blow up t-50
		_text = "Destroy enemy T-50 plane at grid 084 156.";
			};
		case "obj6": { //blow up apache
			_text = "Destroy captured NATO AH-64 at grid 081 158.";
			};
		case "obj7": { //blow up cargo plane
			_text = "Destroy enemy cargo plane at grid 098 165.";

			};
		case "obj8": { //blow up fuel dump 
			_text = "Destroy enemy fuel supply at grid 095 163.";

			};
		case "obj9": { //blow up radio tower
			_text = "Destroy enemy signal tower at grid 094 163.";

			};
		case "obj10": { //blow up food
			_text = "Destroy enemy food supply at grid 083 151.";

			};
				case "obj11": { //hudson defects
			_text = "Dr. Chadori Hudsonski, experimental physicist, wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov.  He is wearing a white lab coat.";

			};
				case "obj12": { //zedic defects
			_text = "Dr. Gavriil Zedic, chemical warfare specialist, wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov. He is wearing a brown suit.";

			};
			case "obj13": { //commander defects
			_text = "The russian garrison commander wants to defect to the west. Extract and escort him to the church at Zirnitra or Kovrov.  He is wearing a cap and a jacket with a fur liner at the neck line.";

			};
	
				case "obj14": { //general raid
			_text = "Conduct a raid, killing at least ten enemy. ";

			};
			
				case "obj15": { //steal tower stuff
			_text = "Infilitrate the enemy base and steal the frag order from the control tower. It should be located in a set of metal lockers on the top floor.";

			};
			
				case "obj16": { //blow up chem plant
			_text = "Destroy the base chemical plant at GRID 079 164.";

			};
			
				case "obj17": { //steal hudson's plans
			_text = "Steal Dr. Chadori Hudsonski's experimental designs from the aircraft manufacture at GRID 085 153. The designs should be near a computer station on the wall.";

			};

				case "obj18": { //photograph cannon
			_text = "Photograph an experimental russian cannon at grid 083 152. We need an extreme closeup of the machinery, so you will need to be within 5 meters of it.";

			};

}; 
sleep 30; 
hint "Message decoded, check briefing."; 
		_intel = player createDiaryRecord ["Diary",["INTELLIGENCE: CIA Message Decoded","You have succesfully decoded a CIA message by using a captured one-time pad, it reads as follows: " + _text]];
	
decode = player addAction ["Decode CIA Message", "scripts\decodeMessage.sqf",[this],-1,false,true,"","('EvMoscow' in weapons _this) && ('signaller' == vehicleVarName _this)"];
