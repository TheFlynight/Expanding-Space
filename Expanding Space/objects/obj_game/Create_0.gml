powerup_time = 10;

//Spawn Rocks
while(instance_number(obj_rock_main) < 8)
{
	var _ranx = random_range(0, room_width);
	var _rany = random_range(0, room_height);
	
	//check for collision with rocks during spawn
	var _rock_coll = instance_place(_ranx, _rany, obj_rock_main) && instance_place(_ranx, _rany, obj_rock_main);
	

    // Minimum spawn radius
	var _room_center_x = room_width / 2;
	var _room_center_y = room_height / 2;
	var _min_radius = 5;
	var _spawn_radius = point_distance(x, y, _room_center_x, _room_center_y);
	
	if(!_rock_coll) //&& (_spawn_radius <= _min_radius)
	{
		instance_create_layer(_ranx, _rany, "Instances", obj_rock_main);
	}
}


