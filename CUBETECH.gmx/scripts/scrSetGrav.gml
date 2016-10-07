///scrSetGrav(gravity)
var old_grav = global.grav;
var new_grav = argument0;

global.grav = new_grav;
/*
var old_vspeed;
if (old_grav==G_DOWN) old_vspeed=vspeed;
if (old_grav==G_UP) old_vspeed=vspeed;
if (old_grav==G_RIGHT) old_vspeed=hspeed;
if (old_grav==G_LEFT) old_vspeed=hspeed;*/

//flip the player
with (objPlayer)
{
    //vspeed=-vspeed;
    
    if (abs(global.grav)==1) {
        jump = abs(jump) * global.grav;
        jump2 = abs(jump2) * global.grav;
        gravity_direction=270;
        gravity = abs(gravity) * global.grav;    
        global.invert = (global.grav==-1);
    } else {
        jump = abs(jump) * global.grav/2;
        jump2 = abs(jump2) * global.grav/2;
        gravity_direction=0;
        gravity = abs(gravity) * (global.grav/2);     
        global.invert = (global.grav==2);
    }
    scrSetPlayerMask();
    switch (old_grav) {
    case G_DOWN:
        switch (new_grav) {
        case G_DOWN : vspeed= vspeed; y=ceil (y); break;
        case G_UP   : vspeed=-vspeed; y=floor(y); break;
        case G_LEFT : hspeed=-vspeed; x=floor(x); break;
        case G_RIGHT: hspeed= vspeed; x=ceil (x); break;
        }
        break;
    case G_UP:
        switch (new_grav) {
        case G_DOWN : vspeed=-vspeed; break;
        case G_UP   : vspeed= vspeed; break;
        case G_LEFT : hspeed= vspeed; break;
        case G_RIGHT: hspeed=-vspeed; break;
        }
        break;
    case G_LEFT:
        switch (new_grav) {
        case G_DOWN : vspeed=-hspeed; break;
        case G_UP   : vspeed= hspeed; break;
        case G_LEFT : hspeed= hspeed; break;
        case G_RIGHT: hspeed=-hspeed; break;
        }
        break;
    case G_RIGHT:
        switch (new_grav) {
        case G_DOWN : vspeed= hspeed; break;
        case G_UP   : vspeed=-hspeed; break;
        case G_LEFT : hspeed=-hspeed; break;
        case G_RIGHT: hspeed= hspeed; break;
        }
        break;
    }
    
    //if the player ended up in a block, push him out
    if (place_meeting(x,y,objBlock)) {
        var _l=0,_r=0,_u=0,_d=0;
        while (place_meeting(x-_l,y,objBlock) && _l<4) _l++;
        while (place_meeting(x+_r,y,objBlock) && _r<4) _r++;
        while (place_meeting(x,y-_u,objBlock) && _u<4) _u++;
        while (place_meeting(x,y+_d,objBlock) && _d<4) _d++;
        
        if (_u <= _l && _u <= _r && _u <= _d) objPlayer.y-=_u;
        if (_d <= _l && _d <= _r && _d <= _u) objPlayer.y+=_d;
        if (_l <= _u && _l <= _r && _l <= _d) objPlayer.x-=_l;
        if (_r <= _l && _r <= _d && _r <= _u) objPlayer.x+=_r;
    }
    /*
    switch (new_grav) {
    case G_DOWN : y=ceil (y)-1; if (place_meeting(x,y,objBlock)) y+=1; break;
    case G_UP   : y=floor(y)+1; if (place_meeting(x,y,objBlock)) y-=1; break;
    case G_LEFT : x=floor(x)+1; if (place_meeting(x,y,objBlock)) x-=1; break;
    case G_RIGHT: x=ceil (x)-1; if (place_meeting(x,y,objBlock)) x+=1; break;
    }*/
    //y += 4 * global.grav; //not sure what to do with this piece yet
}
