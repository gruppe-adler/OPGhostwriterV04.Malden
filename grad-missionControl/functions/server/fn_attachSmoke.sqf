params ["_vehicle"];

private _smoke = createVehicle ["SmokeShell", position _vehicle, [], 0 , "CAN_COLLIDE"]; 
 
_smoke attachTo [_vehicle, [0,-2,0]];

[{
	isNull (_this select 0)
}, {
	params ["_smoke", "_vehicle"];
	
	private _smoke = createVehicle ["SmokeShell", position _vehicle, [], 0 , "CAN_COLLIDE"]; 
 
	_smoke attachTo [_vehicle, [0,-2,0]];
}, [_smoke, _vehicle]] call CBA_fnc_waitUntilAndExecute;