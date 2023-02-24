_missionName = getMissionConfigValue "OnLoadName";
_missionAuthor = ["by", getMissionConfigValue "author"] joinString " ";

[ 
	[ 
		[_missionName, "align = 'left' shadow = '0' size = '1' font='PuristaBold'", "#ffffff"], 
		["", "<br/>"],
		[_missionAuthor, "align = 'left' shadow = '0' size = '0.75'", "#757575"]
	],
	safeZoneX/2, safeZoneH / 2
] spawn BIS_fnc_typeText2;