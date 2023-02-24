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
 *	[] call dAn_fnc_hintGroup
 *	
 * 	Public: No
 */

private ["_grpName", "_arrText", "_group"];

_grpName = text (groupId group player);
	_grpName setAttributes ["align", "left"];
	_grpName setAttributes ["font", "RobotoCondensedBold"];

_arrText = [_grpName, lineBreak];
_group = "";

// for each loop
{
	if (isPlayer _x) then {
		private ["_identity", "_name", "_role", "_weight", "_rankImage", "_strText"];
		
		_identity = [_x] call dAn_fnc_GetIdentity;
		_name = _identity select 2;
		_role = _identity select 3;
		_weight = _identity select 4;

		_rankImage  = image (_identity select 1);
			_rankImage setAttributes ["align", "left"];

		//_len = count (_name + _role +_weight);
		//systemchat str _len;
		//seting up texts attributes
		_name = text _name;
			_name setAttributes ["align", "left"];
			_name setAttributes ["color", "#fea80a"];
			_name setAttributes ["font", "RobotoCondensedBold"];
		_role = text _role;
			_role setAttributes ["align", "left"];
			_role setAttributes ["color", "#999999"];
		_weight = text _weight;
			_weight setAttributes ["align", "right"];

		//systemchat format ["%1, %2, %3, %4", _rank, _name, _role, _weight];
		_strText = composeText [
		_rankImage,
		_name, " ",
		_role,
		_weight, lineBreak];

	_arrText pushBack _strText;
	};
} forEach units group player;

_group = composeText _arrText;

// return
_group;