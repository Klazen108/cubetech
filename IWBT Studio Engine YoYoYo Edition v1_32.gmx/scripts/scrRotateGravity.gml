///scrRotateGravity(gravity,degrees)

//sanitize the input
var amount = argument1;
while amount<000 amount+=360
while amount>360 amount-=360
amount = (amount div 90)*90
show_debug_message("gravity: "+string(argument0));
show_debug_message("rotate gravity: "+string(amount));
switch argument0 {
case G_DOWN:
    if amount==000 return G_DOWN;
    if amount==090 return G_RIGHT;
    if amount==180 return G_UP;
    if amount==270 return G_LEFT;
case G_UP:
    if amount==000 return G_UP;
    if amount==090 return G_LEFT;
    if amount==180 return G_DOWN;
    if amount==270 return G_RIGHT;
case G_LEFT:
    if amount==000 return G_LEFT;
    if amount==090 return G_DOWN;
    if amount==180 return G_RIGHT;
    if amount==270 return G_UP;
case G_RIGHT:
    if amount==000 return G_RIGHT;
    if amount==090 return G_UP;
    if amount==180 return G_DOWN;
    if amount==270 return G_LEFT;
}
