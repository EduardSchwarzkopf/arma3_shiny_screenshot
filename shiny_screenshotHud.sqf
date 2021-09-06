// Author: shinySonic [RCT-7]

private ["_shiny_toggle", "_shiny_setter", "_prefix"];

_prefix = "shiny_screenshot_";

waitUntil {!isNull player};

if (isNil{shiny_screenshotClearHudValues}) then {
	shiny_screenshotClearHudValues = [
		// [variable Name, empty Value, (optional) ini Value]
		["showHUD", [false,false,false,false,false,false,false,false,false,false,false], shownHUD],
		["diwako_dui_compass_style", ["", "", ""]],
		["diwako_dui_compass_opacity", 0],
		["diwako_dui_enable_compass_dir", 0],
		["diwako_dui_nametags_enabled", false],
		["diwako_dui_namelist", false]
	];
};

_shiny_setter = {
	params ["_name", "_val"];
	
	if (_name == "showHUD") then {
		showHUD _val;
	} else {
		missionNamespace setVariable [_name, _val];
	}
};

_shiny_toggle = {
	if (_this) then {
		// hide HUD
		{
			_varName = _x select 0;
			_varVal = missionNamespace getVariable _varName;

			if (!isNil {_x select 2}) then {
				_varVal = _x select 2;
			};

			missionNamespace setVariable [format ["%1%2",_prefix, _varName], _varVal];
			[_varName, _x select 1] call _shiny_setter;
		} foreach shiny_screenshotClearHudValues;
		
	} else {
		// show HUD
		{
			_varName = _x select 0;
			_varVal = missionNamespace getVariable (format ["%1%2", _prefix, _varName]);
			[_varName, _varVal] call _shiny_setter;
		} foreach shiny_screenShotClearHudValues;
	};
};

while {alive player} do {	
	_switchingStr = "Switching";
	_switching = player getVariable [format ["%1%2", _prefix, _switchingStr], true];
	waitUntil {inputAction "User10" > 0 && _switching};
	
	player setVariable [format["%1%2", _prefix, _switchingStr], false];
	_toggleVarName = format["%1Toggle", _prefix];
	_toggle = player getVariable [_toggleVarName, true];
	_toggle call _shiny_toggle;
	player setVariable [_toggleVarName, !_toggle];
	player setVariable [format["%1%2", _prefix, _switchingStr], true];
	sleep 0.5;
};
