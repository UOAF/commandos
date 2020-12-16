    private ["_type", "_unit"];

    _type = _this select 0;
    _unit = _this select 1;


    removeallweapons _unit;
    removeallitems _unit;
    _unit addItem "ACE_EARPLUGS";
    _unit addWeapon "ItemMap";
    _unit addWeapon "ItemCompass";
    _unit addWeapon "ItemWatch";
    if !(vehiclevarname _unit in ["dr1","dr2"]) then { //why would scientists be carrying this stuff?
        _unit addItem "ACE_tourniquet";
        _unit addItem "ACE_tourniquet";
        _unit addItem "FirstAidKit";
        _unit addItem "ACE_BANDAGE";
        _unit addItem "ACE_BANDAGE";
        _unit addItem "ACE_MORPHINE";
    };

    switch (_type) do
    {
        case "commander":
        {
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addWeapon "rhs_weap_ak74";
            _unit addItem "ACRE_PRC148";
            _unit addWeapon "Binocular";
            _unit addweapon "ACE_Flashlight_XL50";
            _unit addprimaryweaponitem "rhs_acc_2dpZenit"; 
        };

        case "RTO":
        {
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addWeapon "rhs_weap_ak74";
            _unit addWeapon "Binocular";
            _unit addItem "ACRE_PRC148";
            _unit addItem "ACRE_PRC77";
            _unit addprimaryweaponitem "rhs_acc_2dpZenit"; 

        };

        case "medic":
        {
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addWeapon "rhs_weap_ak74";
            _unit addweapon "ACE_Rucksack_RD99";
            _unit setVariable ["ace_w_ismedic", true, false];
            _unit addItem "ACE_medkit";
            _unit addItem "ACE_surgicalKit";
            _unit addItem "ACE_tourniquet";
            _unit addItem "ACE_tourniquet";
            _unit addItem "ACE_packingBandage";
            _unit addItem "ACE_packingBandage";
            _unit addItem "ACE_packingBandage";
            _unit addItem "ACE_packingBandage";
            _unit addItem "ACE_elasticBandage";
            _unit addItem "ACE_elasticBandage";
            _unit addItem "ACE_elasticBandage";
            _unit addItem "ACE_elasticBandage";
            _unit addItem "ACE_fieldDressing";
            _unit addItem "ACE_fieldDressing";
            _unit addItem "ACE_fieldDressing";
            _unit addItem "ACE_medkit";
            _unit addItem "ACE_medkit";
            _unit addItem "ACE_medkit";
            _unit addItem "ACE_Epinephrine";
            _unit addItem "ACE_Epinephrine";
            _unit addItem "ACE_Epinephrine";
            _unit addItem "ACE_morphine";
            _unit addItem "ACE_morphine";
            _unit addItem "ACE_morphine";
            _unit addItem "ACE_morphine";
            _unit addprimaryweaponitem "rhs_acc_2dpZenit"; 
        };

            case "patrolLead":
        {
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addWeapon "rhs_weap_ak74";
            _unit addItem "ACRE_PRC148";
            _unit addWeapon "Binocular";
            _unit addweapon "ACE_Flashlight_XL50";
            _unit addmagazine "rhs_mag_rgd5";
            _unit addmagazine "rhs_mag_rgd5";
            _unit addprimaryweaponitem "rhs_acc_2dpZenit"; 
        };


        case "rifle":
        {
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addMagazine "rhs_30Rnd_545x39_7N6_AK";
            _unit addWeapon "rhs_weap_ak74";
            _unit addmagazine "rhs_mag_rgd5";
            _unit addmagazine "rhs_mag_rgd5";
        };

        case "pistolGuy":
        {
            _unit addWeapon "rhs_weap_makarov_pm";
            _unit addMagazine "rhs_mag_9x18_8_57N181S";
            _unit addMagazine "rhs_mag_9x18_8_57N181S";
        };

    };

