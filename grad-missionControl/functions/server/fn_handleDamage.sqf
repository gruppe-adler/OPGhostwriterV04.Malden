params ["_unit"];


_unit addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

	private _overalldamage = (damage _veh) + _damage;
	if (_overalldamage > 0.95) then
		{ 
		_veh setDamage 0.9;
		} else
		{
		_veh setDamage _overalldamage;
		};
}];