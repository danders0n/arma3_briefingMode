/*
 *	Author: D.Anderson
 *	Lorem
 *	
 *	Arguments:
 *	None
 *	
 *	Return Value:
 *	Structured Text
 *	
 *	Example:
 *	[] call dAn_fnc_disableWeapons
 *	
 * 	Public: No
 */

// TODO: privates

params[["_unit", player]];

[_unit, "blockThrow", "dAn_brefingMode", true] call ace_common_fnc_statusEffect_set;
_actionEH = [_unit, "DefaultAction", "True", {}] call ace_common_fnc_addActionEventHandler;

_unit setVariable ["briefingMode_actionEh", _actionEH, true];