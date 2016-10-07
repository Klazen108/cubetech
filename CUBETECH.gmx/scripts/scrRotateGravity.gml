///scrRotateGravity(gravity,degrees)

//sanitize the input
var amount = argument1;
while amount<000 amount+=360
while amount>360 amount-=360
amount = (amount div 90)*90
var result;
switch argument0 {
case G_DOWN:
    if amount==000 result = G_DOWN;
    if amount==090 result = G_RIGHT;
    if amount==180 result = G_UP;
    if amount==270 result = G_LEFT;
    break;
case G_UP:
    if amount==000 result = G_UP;
    if amount==090 result = G_LEFT;
    if amount==180 result = G_DOWN;
    if amount==270 result = G_RIGHT;
    break;
case G_LEFT:
    if amount==000 result = G_LEFT;
    if amount==090 result = G_DOWN;
    if amount==180 result = G_RIGHT;
    if amount==270 result = G_UP;
    break;
case G_RIGHT:
    if amount==000 result = G_RIGHT;
    if amount==090 result = G_UP;
    if amount==180 result = G_LEFT;
    if amount==270 result = G_DOWN;
    break;
}

//show_debug_message("gravity in: "+string(argument0));
//show_debug_message("rotate: "+string(amount));
//show_debug_message("gravity out: "+string(result));

return result;
