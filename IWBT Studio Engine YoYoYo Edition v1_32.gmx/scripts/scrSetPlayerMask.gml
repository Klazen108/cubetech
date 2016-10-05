///sets the player's mask depending on gravity flip mode

if isVGrav() {
    if (global.grav == 1)
        mask_index = sprPlayerMask;
    else
        mask_index = sprPlayerMaskFlip;
} else {
    if (global.grav == 2)
        mask_index = sprPlayerMask; //right
    else
        mask_index = sprPlayerMaskFlip; //left
}
