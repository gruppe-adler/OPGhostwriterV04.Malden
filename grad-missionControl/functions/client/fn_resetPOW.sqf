/*
	executed locally on client

	fades to black, heals unit, puts her back where it came from with little fx

	[player] execVM "grad-missionControl\functions\client\fn_resetPOW.sqf";
*/

params ["_unit"];

private _targetPosition = getMarkerPos "mrk_powCamp";

cutText ["","BLACK OUT",3];
3 fadeSound 0;

sleep 3;


private _blurFX = ppEffectCreate ["DynamicBlur", 0];
_blurFX ppEffectEnable true;
_blurFX ppEffectAdjust [10];
_blurFX ppEffectCommit 0;



_unit setPos _targetPosition;
[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;

sleep 1;
3 fadeSound 1;
cutText ["<t color='#ffffff' size='2'>You feel dizzy... they probably brought you back to the prison.</t>", "BLACK IN", 10, true, true];

_blurFX ppEffectAdjust [0];
_blurFX ppEffectCommit 10;

sleep 10;
_blurFX ppEffectEnable false;
ppEffectDestroy _blurFX;