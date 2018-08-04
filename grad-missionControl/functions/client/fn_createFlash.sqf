params ["_position"];

_position set [2,300];

private _light = "#lightpoint" createvehicle _position;
_light setLightDayLight true;
_light setLightBrightness 40;
_light setLightAmbient [1, 1, 1];
_light setlightcolor [0.5, 0.5, 0.6];

sleep 0.1;

_light setLightBrightness 0;

sleep random 0.5;

_light setLightBrightness 40;

sleep 0.2;

_light setLightBrightness 0;

sleep 2;

_light setLightBrightness 40;

sleep 0.1;

_light setLightBrightness 0;

deleteVehicle _light;