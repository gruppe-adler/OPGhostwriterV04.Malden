
if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
    cutText ["", "BLACK IN", 10];
} else {
	cutText ["","BLACK FADED",999];
	[] spawn GRAD_missionControl_fnc_intro;
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (player getVariable ["isCIAAgent", false]) then {
  	//second parameter is delay in seconds: 300 = 5min
  	[grad_common_fnc_ciaIntel, 300] call CBA_fnc_addPerFrameHandler;
};

if (player getVariable ["isPOW", false]) then {

	ace_map_BFT_Enabled = false;

	player addEventhandler ["Take", {
		params ["_unit", "_container", "_item"];

		// hint "debug";

		if (_item isEqualTo "ItemMap") then {

				private _position = getMarkerPos "mrk_radioStation";
				hint format ["Irgendwo bei %1 soll eine Funkstation sein.", mapGridPosition _position];
				
				private _markerstr = createMarkerLocal ["mrk_radioStation_local",_position];
				_markerstr setMarkerShapeLocal "ICON";
				_markerstr setMarkerTypeLocal "hd_unknown";
				_markerstr setMarkerColorLocal "ColorRed";
				_markerstr setMarkerTextLocal "Funkstation";

				player removeEventHandler ["Take", _thisEventHandler];
		};
	}];
	/*
	player addEventHandler ["InventoryClosed", {
		params ["_unit", "_container"];

		// hint "debug";

		if (("ItemMap" in (
				vestItems player + 
				uniformItems player + 
				backpackItems player + 
				assignedItems player
			)) && !(player getVariable ["becameMap", false])) then {
				player setVariable ["becameMap", true];

				private _position = getMarkerPos "mrk_radioStation";
				hint format ["Irgendwo bei %1 soll eine Funkstation sein.", mapGridPosition _position];
				
				private _markerstr = createMarkerLocal ["mrk_radioStation_local",_position];
				_markerstr setMarkerShapeLocal "ICON";
				_markerstr setMarkerTypeLocal "hd_unknown";
				_markerstr setMarkerColorLocal "ColorRed";
				_markerstr setMarkerTextLocal "Funkstation";

				player removeEventHandler _thisEventhandler;
		};
	}];
	*/
};

[] call GRAD_missionControl_fnc_setMyFrequency;
[] call GRAD_missionControl_fnc_addModules;

