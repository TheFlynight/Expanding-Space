

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

//set random values for rock spawn
// Define a buffer zone to avoid spawning in the middle
var buffer = 10; // Adjust this value to control the distance from the edge

while (true) 
{
    // Generate random positions for x and y within the entire screen area
    var _ranx = irandom_range(room_width, 0);
    var _rany = irandom_range(room_height, 0);

    // Check if the position is on the edge (top, bottom, left, or right)
    if (_ranx <= buffer || _ranx >= room_width - buffer - 1 ||
        _rany <= buffer || _rany >= room_height - buffer - 1) 
	{
        // Valid edge position found, break the loop
        break;
    }
}

// Check which version of rock is hit
// If hitting main rock, split rock into 2 broken rocks
if (sprite_index == spr_rock_main)
{
	sprite_index = spr_rock_broken;
	instance_copy(true);
}
// Spawn another main rock if there are less than 
// x ammount currently and destory current instance
else if instance_number(obj_rock_main) < 12
{
	sprite_index = spr_rock_main;
	x = _ranx;
	y = _rany;
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



