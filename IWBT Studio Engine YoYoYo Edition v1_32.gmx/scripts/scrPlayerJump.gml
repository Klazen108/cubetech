var onBlock,onWater,onWater3;
if isVGrav() {
    onBlock = place_meeting(x,y+(global.grav),objBlock)
    onWater = place_meeting(x,y+(global.grav),objWater)
    onWater2 = place_meeting(x,y+(global.grav),objWater2)
    onWater3 = place_meeting(x,y+(global.grav),objWater3)
} else {
    onBlock = place_meeting(x+(global.grav/2),y,objBlock)
    onWater = place_meeting(x+(global.grav/2),y,objWater)
    onWater2 = place_meeting(x+(global.grav/2),y,objWater2)
    onWater3 = place_meeting(x+(global.grav/2),y,objWater3)
}

if (onBlock || onPlatform || onWater)
{
    if isVGrav() vspeed = -jump;
    else hspeed = -jump;
    djump = 1;
    audio_play_sound(sndJump,0,false);
}
else if (djump == 1 || onWater2 || global.infJump)
{
    if isVGrav() vspeed = -jump2;
    else hspeed = -jump2
    sprite_index = sprPlayerJump;
    audio_play_sound(sndDJump,0,false);
    
    if (!onWater3)
        djump = 0;  //take away the player's double jump
    else
        djump = 1;  //replenish djump if touching water3
}
