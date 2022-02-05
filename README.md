# Arma 3 - shiny's screenshot HUD

## install

place `shiny_screenshotHud.sqf .sqf` in your `scripts` folder

## toggle

you need to bind `Use Action 10` to toggle the HUD

## init

put the following code in your `init.sqf` or `initPlayerLocal.sqf` **and** in your `onPlayerRespawn.sqf`:  
`[] execVM "scripts\shiny_screenshotHud.sqf";`

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
