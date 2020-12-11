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
    _unit addWeapon "ACE_tourniquet";
    _unit addWeapon "ACE_tourniquet";
    _unit addWeapon "FirstAidKit";

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
            _unit addWeapon "ACRE_PRC148";
            _unit addWeapon "Binocular";
                        _unit addweapon "ACE_Flashlight_XL50";

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
            _unit addWeapon "ACE_P159_RD99";
             _unit addWeapon "ACRE_PRC148";

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
            _unit addMagazine "ACE_medkit";
            _unit addMagazine "ACE_surgicalKit";
            _unit addMagazine "ACE_tourniquet";
            _unit addMagazine "ACE_tourniquet";
            _unit addMagazine "ACE_packingBandage";
            _unit addMagazine "ACE_packingBandage";
            _unit addMagazine "ACE_packingBandage";
            _unit addMagazine "ACE_packingBandage";
            _unit addMagazine "ACE_elasticBandage";
            _unit addMagazine "ACE_elasticBandage";
            _unit addMagazine "ACE_elasticBandage";
            _unit addMagazine "ACE_elasticBandage";
            _unit addMagazine "ACE_fieldDressing";
            _unit addMagazine "ACE_fieldDressing";
            _unit addMagazine "ACE_fieldDressing";
            _unit addMagazine "ACE_medkit";
            _unit addMagazine "ACE_medkit";
            _unit addMagazine "ACE_medkit";
            _unit addMagazine "ACE_Epinephrine";
            _unit addMagazine "ACE_Epinephrine";
            _unit addMagazine "ACE_Epinephrine";
            _unit addMagazine "ACE_morphine";
            _unit addMagazine "ACE_morphine";
            _unit addMagazine "ACE_morphine";
            _unit addMagazine "ACE_morphine";
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
            _unit addWeapon "ACRE_PRC148";
            _unit addWeapon "Binocular";
            _unit addweapon "ACE_Flashlight_XL50";
            _unit addmagazine "rhs_mag_rgd5";
            _unit addmagazine "rhs_mag_rgd5";

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
            _unit addMagazine "rhs_mag_9x18_8_57N181S";
            _unit addMagazine "rhs_mag_9x18_8_57N181S";
        };

    };

