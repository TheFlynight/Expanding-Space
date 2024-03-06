//check if no powerup is active
if(obj_game.powerup_time < 0)
{
	//randomize a powerup to drop and reset timer
	var _obj = choose (obj_powerup_slow) //obj_powerup_ghost,obj_powerup_spread);
	instance_create_layer(x, y, "Instances", _obj);
	obj_game.powerup_time = 20;

}

//play audio
audio_play_sound(snd_rock, 0, false, .4, 0, random_range(0.8, 1.2));

//add points depending on rock type shot
ini_open("save.save_file");
if sprite_index == spr_rock_main_V2
{
	global.points += 100;
}

ini_write_real("Points", "Current", global.points);
ini_close();

//destroy instance of rock and play fx
instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_red);

direction = random(360);

// Check which version of rock is hit
// Spawn small rocks if main rock hit
if sprite_index == spr_rock_main_V2
{
	sprite_index = spr_rock_broken;
	instance_copy(true);
}
else
{	
	instance_destroy();
}


