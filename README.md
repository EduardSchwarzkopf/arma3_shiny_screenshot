# Arma 3 - Place Sandbags

## install

place `shiny_screenshotHud.sqf .sqf` in your `scripts` folder

## init

put the following code in your `init.sqf` or `initPlayerLocal.sqf` **and** in your `onPlayerRespawn.sqf`:  
`[] execVM "scripts\shiny_screenshotHud.sqf .sqf";`

## customize

if you want to customize more HUD elements just extend the variable shiny_screenshotClearHudValues:
```
shiny_screenshotClearHudValues = [
  ...,
  [
    variable Name,
    value for hiding HUD element,
    (optional) init value
  ]
};
```

## Credits
Regimental Combat Team 7
