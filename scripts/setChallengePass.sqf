private ["_potentialChallenges", "_potentialPasses", "_ranIndex", "_ranString", "_challenge", "_pass"]; 

_potentialChallenges = ["thunder", "flash", "pepsi", "bat", "arnold", "wookie", "azzwort", "united", "task force", "smack", "red", "gold", "blue", "green", "hairy", "lake", "frank", "big", "rolling", "boston"];
_potentialPasses = ["cats", "thunder", "light", "cola", "man", "bang", "sucks", "school", "operations", "proteus", "bolt", "down", "balls", "monster", "beans", "steak", "magazine", "lip", "blow", "job"]; 

_ranIndex = round (random((count _potentialChallenges)-1));

_challenge = _potentialChallenges select _ranIndex;

_ranIndex = round (random((count _potentialPasses)-1));

_pass = _potentialPasses select _ranIndex;

challengePass = _challenge + " " + _pass; 
publicvariable "challengePass"; 

challengePassDone = true; 
publicvariable "challengePassDone";
