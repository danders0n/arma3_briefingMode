/*
 *	Author: D.Anderson
 *	Description:
 *		Executed locally when player joins mission (includes both mission start and JIP).
 *	Parametr(s):
 *		0 - _unit: <Object>
 *		1 - _didJIP: <Boolean>
 */

_unit   = _this select 0;
_didJIP = _this select 1;

waituntil {! isnull _unit};

[_unit] call dAn_fnc_initBriefingMode;