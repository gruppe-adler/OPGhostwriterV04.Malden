
private _position = position player;
_position set [2, 17];
player setPos _position;

["Terminate"] call BIS_fnc_EGSpectator;

if (([missionConfigFile >> "missionSettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 1) then {
    [] call grad_waverespawn_fnc_onPlayerRespawn;
};
