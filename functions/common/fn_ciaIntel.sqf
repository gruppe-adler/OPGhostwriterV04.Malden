
//delete all old markers
private _oldMarkers = missionNamespace getVariable ["zade_cia_intel_markers", []];
{
  deleteMarkerLocal _x;
} forEach _oldMarkers;


private _newMarkers =  [];
private _groups = allGroups select {side _x == east};

//time
_hour = floor daytime; 
_minute = floor ((daytime - _hour) * 60);
if (_hour < 10) then {
  _hour = format["0%1",_hour];
};
if (_minute < 10) then {
  _minute = format["0%1",_minute];
};
_time24 = format ["%1%2", _hour, _minute]; 

{
  private _leader = leader _x;
  private _name = format ["zade_cia_intel_%1", count _newMarkers];
  private _displayname = gettext (configFile >> "CfgVehicles" >> (typeof (vehicle _leader)) >> "displayName");

  //add marker to array
  _newMarkers pushBack _name;

  //create marker
  _marker = createMarkerLocal [_name,getPos _leader];
  _marker setMarkerShapeLocal "ICON";
  _marker setMarkerTypeLocal "o_unknown";
  _marker setMarkerAlphaLocal 0.3;
  _marker setMarkerColorLocal "ColorWhite";

  if (vehicle _leader isKindOf "Man") then {
      _displayname = "Inf";
  };
  if (vehicle _leader isKindOf "Car") then {
      _displayname = "Motorized";
  };
  if (vehicle _leader isKindOf "Tank") then {
      _displayname = "Armor";
  };
  
  _marker setMarkerTextLocal _time24 + " " + _displayname;
} forEach _groups;

zade_cia_intel_markers = _newMarkers;