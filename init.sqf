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

/*

Friede, Freude, Eierkuchen, liebe Landsleute!
Riecht ihr auch? Es duftet nach Krieg.
Ein paar Leichen mehr oder weniger, uns ists egal.
Qui qua quo, veni vidi vici.
Unter keinen Umständen darf der Feind uns hören.
Einfach schweigen ist aber auch keine Option.
Natürlich gibt es Codes und Geheimnisse.
Zahlen sind, soweit bekannt.
Sofort doppelt zu nehmen!
Ich weiß, es klingt unlogisch und blöd.
Es ist aber tatsächlich sehr, sehr sinnvoll.
Bevor wir irgendetwas preisgeben können.
Erkennt die Botschaft und hört die Kommandos -
Natürlich nur der stolzen Rebellen.

*/