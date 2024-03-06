var _ranx = random_range(0, room_width);
var _rany = random_range(0, room_height);

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
if sprite_index == spr_rock_main
{
	global.points += 25;
}
if sprite_index == spr_rock_broken
{
	global.points += 50;
}

ini_write_real("Points", "Current", global.points);
ini_close();

//destroy instance of rock and play fx
instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_white);

direction = random(360);

// Check which version of rock is hit
// Ensure < 12 rocks at a time
if (sprite_index == spr_rock_main)
{
	sprite_index = spr_rock_broken;
	instance_copy(true);
}
else if instance_number(obj_rock_main) < 12
{
	sprite_index = spr_rock_main;
	x = -100;
}
else
{	
	instance_destroy();
}
//spawn next tier rocks when at correct score
if (global.points > 100)
{
	instance_create_layer(_ranx,_rany,"Instances",obj_rock_main_V2)
}



