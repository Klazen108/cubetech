///scrSetGrav(gravity)
var old_grav = global.grav;
var new_grav = argument0;

global.grav = new_grav;

if (old_grav==G_DOWN) old_vspeed=vspeed;
if (old_grav==G_UP) old_vspeed=-vspeed;
if (old_grav==G_RIGHT) old_vspeed=hspeed;
if (old_grav==G_LEFT) old_vspeed=-hspeed;

//flip the player
with (objPlayer)
{
    vspeed=-vspeed;
    
    if (abs(global.grav)==1) {
        jump = abs(jump) * global.grav;
        jump2 = abs(jump2) * global.grav;
        gravity_direction=270;
        gravity = abs(gravity) * global.grav;    
    } else {
        jump = abs(jump) * global.grav/2;
        jump2 = abs(jump2) * global.grav/2;
        gravity_direction=0;
        gravity = abs(gravity) * (global.grav/2);   
    }
    scrSetPlayerMask();
    
    //y += 4 * global.grav; //not sure what to do with this piece yet
}
