if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (player getVariable ["isCIAAgent", false]) then {
	player addItem "tf_fadak";
};

if (player getVariable ["isPOW", false]) then {

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

				hint "Irgendwo bei 051 093 soll eine Funkstation sein.";

				private _position = getMarkerPos "mrk_radioStation";
				private _markerstr = createMarkerLocal ["mrk_radioStation_local",_position];
				_markerstr setMarkerShapeLocal "ICON";
				_markerstr setMarkerTypeLocal "hd_unknown";
				_markerstr setMarkerColorLocal "ColorRed";
				_markerstr setMarkerTextLocal "Funkstation";
		};
	}];
};

[] call GRAD_missionControl_fnc_addModules;

