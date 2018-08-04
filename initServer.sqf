["Initialize"] call BIS_fnc_dynamicGroups;

startFog=0.60;
startFogDecay=0;
startFogBase=2.6;

endFog=0.15;
endFogDecay=1;
endFogBase=0;

0 setFog [startFog, startFogDecay, startFogBase];

1200 setFog [endFog, endFogDecay, endFogBase];