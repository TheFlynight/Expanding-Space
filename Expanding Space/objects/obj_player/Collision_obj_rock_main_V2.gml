//Check if ghost is active and ignore collision if it is
if (powerup == 2) exit;

//Play FX and destroy player on collision
effect_create_above(ef_firework, x, y, 1, c_white);
audio_play_sound(snd_death, 0, false);
instance_destroy();


obj_game.alarm[0] = 120;




