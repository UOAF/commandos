    private ["_type", "_unit"];

    _type = _this select 0;
    _unit = _this select 1;

        removeallweapons _unit;
    removeallitems _unit;
    _unit addWeapon "ACE_EARPLUGS";
    _unit addWeapon "ItemMap";
    _unit addWeapon "ItemCompass";
    _unit addWeapon "ItemWatch";
        _unit addMagazine "ACE_BANDAGE";
    _unit addMagazine "ACE_BANDAGE";
    _unit addMagazine "ACE_MORPHINE";
    _unit addWeapon "ACRE_PRC148";
    _unit addWeapon "NVGoggles";
    _unit addWeapon "ACE_GlassesTactical";
    _unit addweapon "ACE_DAGR";


    switch (_type) do
    {
        case "operator":
        {
_unit addmagazine "ACE_12Rnd_45ACP_USPSD";
_unit addmagazine "ACE_12Rnd_45ACP_USPSD";
_unit addmagazine "ACE_12Rnd_45ACP_USPSD";
_unit addmagazine "ACE_12Rnd_45ACP_USPSD";
_unit addmagazine "ACE_12Rnd_45ACP_USPSD";
        };

            case "gearcar":
        {
            _unit addweaponcargo ["ACE_GlassesBalaklava", 6];
            _unit addweaponcargo ["EvMoney", 10];
            _unit addweaponcargo ["ACE_Kestrel4500", 1];
            _unit addweaponcargo ["ACE_SpottingScope", 1];
            _unit addweaponcargo ["ACE_MX2A", 1];
            _unit addweaponcargo ["Binocular", 2];
            _unit addweaponcargo ["ACE_Rangefinder_OD", 1];
            _unit addmagazinecargo ["ACE_Battery_Rangefinder", 2];
            _unit addweaponcargo ["ACE_DAGR", 2];
            _unit addweaponcargo ["ACE_VTAC_RUSH72", 6];
            _unit addweaponcargo ["ACE_WireCutter", 2];
            _unit addweaponcargo ["ACE_Flaregun", 2];
            _unit addmagazinecargo ["ACE_SSRed_FG", 5];
            _unit addmagazinecargo ["ACE_SSGreen_FG", 5];
            _unit addmagazinecargo ["ACE_Knicklicht_B", 5];
            _unit addmagazinecargo ["ACE_Knicklicht_R", 5];
            _unit addmagazinecargo ["ACE_Knicklicht_G", 5];
            _unit addmagazinecargo ["ACE_C4_M", 10];
            _unit addmagazinecargo ["pipebomb", 6];
            _unit addmagazinecargo ["IRStrobe", 2];
            _unit addmagazinecargo ["HandGrenade_Stone", 5];
            _unit addweaponcargo ["ACE_MugLite", 2];
            _unit addmagazinecargo ["ACE_BANDAGE", 20];
            _unit addmagazinecargo ["ACE_MORPHINE", 20];
            _unit addmagazinecargo ["ACE_MEDKIT", 12];
            _unit addmagazinecargo ["ACE_Epinephrine", 12];

        };

            case "weaponscar":
        {
        _unit addweaponcargo ["M249_EP1", 1];
        _unit addmagazinecargo ["200Rnd_556x45_M249", 5];
        _unit addweaponcargo ["ACE_RPG27", 2];
        _unit addweaponcargo ["AKS_74_U", 2];
        _unit addmagazinecargo ["30Rnd_545x39_AK", 20];
        _unit addweaponcargo ["ACE_G3SG1", 1];
        _unit addmagazinecargo ["ACE_20Rnd_762x51_B_G3", 10];
        _unit addweaponcargo ["ACE_HK416_D10_SD", 4];
        _unit addmagazinecargo ["30Rnd_556x45_StanagSD", 40];
            _unit addweaponcargo ["MP5SD", 2];
        _unit addmagazinecargo ["30Rnd_9x19_MP5SD", 20];
        _unit addweaponcargo ["M32_EP1", 1];
        _unit addmagazinecargo ["6Rnd_HE_M203", 3];
        _unit addmagazinecargo ["6Rnd_Smoke_M203", 1];
        _unit addweaponcargo ["bizon_silenced", 1];
        _unit addmagazinecargo ["64Rnd_9x19_SD_Bizon", 10];
        _unit addweaponcargo ["AA12_PMC", 1];
        _unit addmagazinecargo ["20Rnd_B_AA12_74Slug", 5];
        _unit addmagazinecargo ["20Rnd_B_AA12_Pellets", 5];
        _unit addweaponcargo ["UZI_SD_EP1", 1];
        _unit addmagazinecargo ["30Rnd_9x19_UZI_SD", 5];
        _unit addweaponcargo ["Mk_48_DES_EP1", 1];
        _unit addmagazinecargo ["100Rnd_762x51_M240", 4];
        _unit addweaponcargo ["ACE_TAC50_SD", 1];
        _unit addmagazinecargo ["ACE_5Rnd_127x99_S_TAC50", 10];
        _unit addweaponcargo ["M24", 1];
        _unit addmagazinecargo ["5Rnd_762x51_M24", 10];
        _unit addmagazinecargo ["ACE_ANM14", 5];
        _unit addmagazinecargo ["ACE_Flashbang", 5];
        _unit addmagazinecargo ["ACE_Claymore_M", 5];
        _unit addmagazinecargo ["ACE_M34", 5];
        _unit addmagazinecargo ["ACE_TripFlare_M", 5];
        _unit addmagazinecargo ["HandGrenade_West", 20];
        _unit addmagazinecargo ["ACE_M86PDM", 5];


        };



    };

