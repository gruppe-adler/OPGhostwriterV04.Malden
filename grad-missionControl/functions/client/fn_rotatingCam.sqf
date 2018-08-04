/* by mcdiod */

params ["_target",["_timeout",15],["_radius",50],["_angle",180],["_altitude",15],["_dir",0],["_commitTime",0.1],["_showCinemaBorder",false]];

_coords = _target getPos [_radius,_angle];
_targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
_targetPos set [2,1];
_heightASL = (getTerrainHeightASL _targetPos) + _altitude;

_coords set [2, 1.2];
private _camera = "camera" camCreate _coords;
_camera cameraEffect ["Internal","BACK"];
showCinemaBorder true;
_camera camPrepareFOV 0.300;
_camera camPrepareTarget _targetPos;
_camera camCommitPrepared 0;

cutText ["", "BLACK IN", .5];

while {INTRO_CAM_ROTATION_1} do {
    _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
    _targetPos set [2,1];
    _coords = _targetPos getPos [_radius,_angle];
    _coords set [2, 1.2];
    /*_coords = ASLToATL _coords;*/

    _camera camPreparePos _coords;
    _camera camCommitPrepared _commitTime;

    waitUntil {camCommitted _camera};

    _angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
};

_targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
_targetPos set [2,1];
_coords = _targetPos getPos [_radius*2,_angle-180];
_coords set [2, 1.2];
/*_coords = ASLToATL _coords;*/
_camera camPreparePos _coords;
_camera camSetFov 0.1;
_camera camCommitPrepared 0;


while {INTRO_CAM_ROTATION_2} do {
    _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};
    _targetPos set [2,1];
    _coords = _targetPos getPos [_radius*1.5,_angle-180];
    _coords set [2, 2];
    _camera camSetFov 0.1;
    /*_coords = ASLToATL _coords;*/

    _camera camPreparePos _coords;
    _camera camCommitPrepared _commitTime;

    waitUntil {camCommitted _camera};

    _angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
};
ROTATION_FINISHED = true;