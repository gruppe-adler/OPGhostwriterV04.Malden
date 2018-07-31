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



  ["ZEUS HELPERS", "Sound Alarm",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [obj_loudspeakers, ["Alarm_OPFOR",200]] remoteExec ["say3D",0,false];

  }] call Ares_fnc_RegisterCustomModule;



  ["ZEUS HELPERS", "Spawn Intel Map",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _map = createVehicle ["Land_Map_Malden_F", _position, [], 0, "can_collide"];
    private _radioHolder = createVehicle ["groundWeaponHolder", _position, [], 0, "can_collide"]; 
    _radioHolder addItemCargo ["ItemMap", 1];

    [{
      params ["_radioHolder", "_map"];
      count ((getItemCargo cursorObject) select 0) isEqualTo 0
    }, {
      params ["_radioHolder", "_map"];
      deleteVehicle _map;
    }, [_radioHolder, _map]] call CBA_fnc_waitUntilAndExecute;

  }] call Ares_fnc_RegisterCustomModule;




};