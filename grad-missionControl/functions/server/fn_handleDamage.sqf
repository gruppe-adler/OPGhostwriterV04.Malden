params ["_unit"];


_unit addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

	private _overalldamage = (damage _unit) + _damage;
	if (_overalldamage > 0.9) then
		{ 
		_unit setDamage 0.9;
		diag_log format ["prevented blowup on %1", _unit];
		} else
		{
		_unit setDamage _overalldamage;
		diag_log format ["set damage on %1", _unit];
		};
	0
}];