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
 *	[] call dAn_fnc_hintTitle
 *	
 * 	Public: No
 */

["start", {
    missionNamespace setVariable ["dAn_brefingMode", true, true];
	["Weapons are live in 5 seconds"] remoteExec ["hintSilent"];

	//[] remoteExec ["dAn_fnc_updateRoster"];
	[
		{
			hintSilent "";
			[] call dAn_fnc_startMission;
		},
		[],
		5
	] remoteExec ["CBA_fnc_waitAndExecute"];
}, "admin"] call CBA_fnc_registerChatCommand;
/*
[
    { 
		systemChat format ["frame! params: %1", _this getVariable "params"]; 
		[] call dAn_fnc_displayHint;
	}, 																									// _function
    1, 																									// _delay
    ["some_params", [1,2,3]], 																			// _args
    { systemChat format ["start! params: %1", _this getVariable "params"]; _test = 127; },				// _start
    { systemChat format ["end! params: %1",   _this getVariable "params"]; systemChat str [_test] }, 	// _end
    {},																									// _runCondition
    { missionNamespace getVariable ["dAn_safeStart", true] == false},									// _exitCondition
    "_test"																								// _private
] call CBA_fnc_createPerFrameHandlerObject;
*/

if (isClass(configfile >> "CfgWeapons" >> "ACRE_BaseComponent")) then {
	waitUntil { [] call acre_api_fnc_isInitialized;};
};

[
    { 
		//systemChat format ["Second has passed! Time: %1", time-1];
		[] call dAn_fnc_displayHint;
		[] call dAn_fnc_updateRoster;
	},
    10,
    ["some_params", [1,2,3]],
    {
		//systemChat format ["start!"];
		_test = 127;
	},
    { 
		//systemChat format ["end!"]
	},
    {true},
    {missionNamespace getVariable["dAn_brefingMode", false]},
    "_test"
] call CBA_fnc_createPerFrameHandlerObject;