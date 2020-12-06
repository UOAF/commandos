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
            _unit addItemCargoGlobal ["G_Balaclava_blk", 6];
            _unit addItemCargoGlobal ["ACE_MRE_ChickenTikkaMasala", 6];
            // no money in the mod pack :(
            // _unit addweaponcargo ["EvMoney", 10];
            _unit addItemCargoGlobal ["ACE_Kestrel4500NV", 1];
            _unit addItemCargoGlobal ["ACE_SpottingScope", 1];
            _unit addItemCargoGlobal ["ACE_MX2A", 1];
            _unit addItemCargoGlobal ["Binocular", 2];
            _unit addItemCargoGlobal ["ACE_Vector", 1];
            _unit addItemCargoGlobal ["ACE_DAGR", 2];
            _unit addItemCargoGlobal ["B_TacticalPack_blk", 6];
            _unit addItemCargoGlobal ["ACE_WireCutter", 2];
            _unit addItemCargoGlobal ["fow_w_type10", 2];
            // _unit addmagazinecargo ["ACE_SSRed_FG", 5];
            // _unit addmagazinecargo ["ACE_SSGreen_FG", 5];
            _unit addItemCargoGlobal ["Chemlight_blue", 5];
            _unit addItemCargoGlobal ["Chemlight_red", 5];
            _unit addItemCargoGlobal ["Chemlight_green", 5];
            _unit addItemCargoGlobal ["rhs_charge_M2tet_x2_mag", 10];
            _unit addItemCargoGlobal ["CUP_PipeBomb_M", 6];
            _unit addItemCargoGlobal ["ACE_IR_Strobe_Item", 2];
            _unit addItemCargoGlobal ["rhs_grenade_mkii_mag", 5];
            _unit addItemCargoGlobal ["ACE_Flashlight_XL50", 2];
            _unit addItemCargoGlobal ["ACE_fieldDressing", 20];
            _unit addItemCargoGlobal ["ACE_MORPHINE", 20];
            _unit addItemCargoGlobal ["MEDKIT", 12];
            _unit addItemCargoGlobal ["ACE_Epinephrine", 12];

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

