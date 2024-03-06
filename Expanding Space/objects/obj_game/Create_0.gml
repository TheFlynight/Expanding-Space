powerup_time = 10;

// Define a buffer zone to avoid spawning in the middle
var _buffer = 1; // Adjust this value to control the distance from the edge

//Spawn Rocks
while (instance_number(obj_rock_main) < 5)
{
	// Generate new random positions within allowed area (excluding buffer zone)
	var _ranx = irandom_range(room_width - _buffer * 2, _buffer);
	var _rany = irandom_range(room_height - _buffer * 2, _buffer);

	
    // Check for collision with existing rocks and itself
    var _rock_coll = instance_place(_ranx, _rany, obj_rock_main);
    var _self_coll = instance_place(_ranx - x, _rany - y, obj_rock_main);

    // Minimum spawn radius check (if applicable)
    var _room_center_x = room_width / 2;
    var _room_center_y = room_height / 2;
    var _min_radius = 5;
    var _spawn_radius = point_distance(_ranx, _rany, _room_center_x, _room_center_y);

    if (_spawn_radius >= _min_radius && !_rock_coll && !_self_coll)
    {
        instance_create_layer(_ranx, _rany, "Instances", obj_rock_main);
    }
}




