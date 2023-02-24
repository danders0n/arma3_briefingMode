
params [["_unit", player]];

/* insignia stuff */
if((_unit getVariable "role") != "") then {

	_role = _unit getVariable "role";
	if(_role == "tl") then {
		//[_unit, "asterixIconTL"] call BIS_fnc_setUnitInsignia;
		[_unit, "asterixIconTL"] remoteExec ["BIS_fnc_setUnitInsignia"];
	};
	if(_role == "sl") then {
		//[_unit, "asterixIconSL"] call BIS_fnc_setUnitInsignia;
		[_unit, "asterixIconSL"] remoteExec ["BIS_fnc_setUnitInsignia"];
	};
	if(_role == "medic") then {
		//[_unit, "asterixIconMedic"] call BIS_fnc_setUnitInsignia;
		[_unit, "asterixIconMedic"] remoteExec ["BIS_fnc_setUnitInsignia"];
	};
};
// ********************************