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
            _unit addItemCargoGlobal      ["G_Balaclava_blk", 6];
            _unit addItemCargoGlobal      ["ACE_MRE_ChickenTikkaMasala", 6];
            // no money in the mod pack :(
            // _unit addweaponcargo ["EvMoney", 10];
            _unit addItemCargoGlobal      ["ACE_Kestrel4500NV", 1];
            _unit addItemCargoGlobal      ["ACE_SpottingScope", 1];
            _unit addItemCargoGlobal      ["ACE_MX2A", 1];
            _unit addItemCargoGlobal      ["Binocular", 2];
            _unit addItemCargoGlobal      ["ACE_Vector", 1];
            _unit addItemCargoGlobal      ["ACE_DAGR", 2];
            _unit addItemCargoGlobal      ["ACE_WireCutter", 2];
            _unit addItemCargoGlobal      ["fow_w_type10", 2];
            // _unit addmagazinecargo ["ACE_SSRed_FG", 5];
            // _unit addmagazinecargo ["ACE_SSGreen_FG", 5];
            _unit addItemCargoGlobal      ["Chemlight_blue", 5];
            _unit addItemCargoGlobal      ["Chemlight_red", 5];
            _unit addItemCargoGlobal      ["Chemlight_green", 5];
            _unit addItemCargoGlobal      ["rhsusf_m112_mag", 10];
            _unit addItemCargoGlobal      ["CUP_PipeBomb_M", 6];
            _unit addItemCargoGlobal      ["ACE_IR_Strobe_Item", 2];
            _unit addItemCargoGlobal      ["rhs_grenade_mkii_mag", 5];
            _unit addItemCargoGlobal      ["ACE_Flashlight_XL50", 2];
            _unit addItemCargoGlobal      ["ACE_fieldDressing", 20];
            _unit addItemCargoGlobal      ["ACE_MORPHINE", 20];
            _unit addItemCargoGlobal      ["MEDKIT", 12];
            _unit addItemCargoGlobal      ["ACE_Epinephrine", 12];
            _unit addBackpackCargoGlobal  ["B_TacticalPack_blk", 6];

        };

        case "weaponscar":
        {
        _unit addItemCargoGlobal ["rhs_weap_m249_pip_S", 1];
        _unit addItemCargoGlobal ["rhsusf_200rnd_556x45_M855_box", 5];
        _unit addItemCargoGlobal ["rhs_weap_rpg26", 2];
        _unit addItemCargoGlobal ["rhs_weap_aks74u", 2];
        _unit addItemCargoGlobal ["rhs_30Rnd_545x39_7N6M_AK", 20];
        _unit addItemCargoGlobal ["UK3CB_G3SG1_RIS", 1];
        _unit addItemCargoGlobal ["UK3CB_G3_20rnd_762x51", 10];
        _unit addItemCargoGlobal ["rhs_weap_hk416d10", 4];
        _unit addItemCargoGlobal ["rhsusf_acc_nt4_black", 4];
        _unit addItemCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag", 40];
        _unit addItemCargoGlobal ["UK3CB_MP5_SD", 2];
        _unit addItemCargoGlobal ["30Rnd_9x21_Mag", 20];
        _unit addItemCargoGlobal ["rhs_weap_m32", 1];
        _unit addItemCargoGlobal ["rhsusf_mag_6Rnd_M441_HE", 3];
        _unit addItemCargoGlobal ["rhsusf_mag_6Rnd_M714_white", 1];
        _unit addItemCargoGlobal ["CUP_smg_bizon", 1];
        _unit addItemCargoGlobal ["cup_muzzle_snds_kzrzp_ak762", 1];
        _unit addItemCargoGlobal ["CUP_64Rnd_9x19_Bizon_M", 10];
        _unit addItemCargoGlobal ["CUP_sgun_AA12", 1];
        _unit addItemCargoGlobal ["CUP_20Rnd_B_AA12_Slug", 5];
        _unit addItemCargoGlobal ["CUP_20Rnd_B_AA12_Buck_0", 5];
        _unit addItemCargoGlobal ["rhsusf_weap_MP7A2", 1];
        _unit addItemCargoGlobal ["rhsusf_acc_rotex_mp7", 1];
        _unit addItemCargoGlobal ["rhsusf_mag_40Rnd_46x30_FMJ", 5];
        _unit addItemCargoGlobal ["CUP_lmg_Mk48", 1];
        _unit addItemCargoGlobal ["150Rnd_762x51_Box", 4];
        _unit addItemCargoGlobal ["TFC_W_c15a2", 1];
        _unit addItemCargoGlobal ["tfc_wa_cyclops", 1];
        _unit addItemCargoGlobal ["ACE_5Rnd_127x99_AMAX_Mag", 10];
        _unit addItemCargoGlobal ["rhs_weap_m24sws_wd", 1];
        _unit addItemCargoGlobal ["rhs_weap_m24sws_wd", 1];
        //rhsusf_acc_m24_silencer_wd
        _unit addItemCargoGlobal ["5Rnd_762x51_M24", 10];
        _unit addItemCargoGlobal ["ACE_M14", 5];
        _unit addItemCargoGlobal ["ACE_CTS9", 5];
        _unit addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 5];
        _unit addItemCargoGlobal ["rhs_mag_an_m8hc", 5];
        _unit addItemCargoGlobal ["ACE_FlareTripMine_Mag", 5];
        _unit addItemCargoGlobal ["rhs_mag_m67", 20];
        _unit addItemCargoGlobal ["APERSMineDispenser_Mag", 5];


        };



    };

