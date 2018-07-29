if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (player getVariable ["isCIAAgent", false]) then {
	player addItem "tf_fadak";
};

[] call GRAD_missionControl_fnc_addModules;

