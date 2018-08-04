params ["_position"];

private _light = "#lightpoint" createvehicle _position;
_light setLightDayLight true;
_light setLightBrightness 5;
_light setLightAmbient [0.1, 0.00, 0.0];
_light setlightcolor [0.5, 0, 0];