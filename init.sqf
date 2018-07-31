enableSentences false;
enableRadio false;
enableSaving [false, false];

2 enableChannel false;  // command
4 enableChannel false;  // vehicle
5 enableChannel false;  // direct

// SCRIPTS =====================================================================
[] execVM "USER\userInit.sqf";

["BLU_F", "USMPT"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "ModerateRebels"] call GRAD_Loadout_fnc_FactionSetLoadout;