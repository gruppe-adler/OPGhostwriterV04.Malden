waitUntil {!isNull player};
waitUntil {  time > 3 };
if (
  !isNull (getAssignedCuratorLogic player) &&
  {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  waitUntil {not isNil "ares_category_list"};

  ["ZEUS HELPERS", "Put POW back to prison.",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_objectUnderCursor] remoteExec ["GRAD_missionControl_fnc_resetPOW", _objectUnderCursor];

  }] call Ares_fnc_RegisterCustomModule;

};