	private ["_type", "_unit"];

	_type = _this select 0;
	_unit = _this select 1;
	

	removeallweapons _unit; 
	removeallitems _unit;
	_unit addWeapon "ACE_EARPLUGS"; 
	_unit addMagazine "ACE_BANDAGE"; 
	_unit addMagazine "ACE_BANDAGE";
	_unit addMagazine "ACE_MORPHINE";
	_unit addWeapon "ItemMap";
	_unit addWeapon "ItemCompass";
	_unit addWeapon "ItemWatch";
	_unit addWeapon "ACRE_PRC343";
	
	switch (_type) do
	{
		case "commander":
		{
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addWeapon "AKS_74_U";
			_unit addWeapon "ACRE_PRC148";
			_unit addWeapon "Binocular";
						_unit addweapon "ACE_MugLite";

		};
		
		case "RTO":
		{
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addWeapon "AKS_74_U";
			_unit addWeapon "ACE_P159_RD99";
						_unit addWeapon "ACRE_PRC148";

		};
		
		case "medic":
		{
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addWeapon "AKS_74_U";
_unit addweapon "ACE_Rucksack_RD99";
			_unit setVariable ["ace_w_ismedic", true, false];
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_medkit";
			_unit addMagazine "ACE_Epinephrine";
			_unit addMagazine "ACE_Epinephrine";
			_unit addMagazine "ACE_MORPHINE";
			_unit setVariable ["ACE_RuckMagContents", [["SmokeShellGreen",4], ["ACE_Epinephrine", 10], ["ACE_BANDAGE", 20], ["ACE_MORPHINE", 20]]];
		};
		
			case "patrolLead":
		{
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addWeapon "AKS_74_U";
			_unit addWeapon "ACRE_PRC148";
			_unit addWeapon "Binocular";
			_unit addweapon "ACE_MugLite";
			_unit addmagazine "handgrenade_east";
			_unit addmagazine "handgrenade_east";

		};

		
		case "rifle":
		{
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addMagazine "30Rnd_545x39_AK";
			_unit addWeapon "AKS_74_U";
			_unit addmagazine "handgrenade_east";
			_unit addmagazine "handgrenade_east";
		};	
		
		case "pistolGuy":
		{
			_unit addMagazine "8Rnd_9x18_Makarov";
			_unit addMagazine "8Rnd_9x18_Makarov";
			_unit addMagazine "8Rnd_9x18_Makarov";
			_unit addMagazine "8Rnd_9x18_Makarov";

		};	
		
	};

