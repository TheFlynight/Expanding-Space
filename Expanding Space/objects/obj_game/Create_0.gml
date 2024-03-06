powerup_time = 10;

//Spawn Rocks

while (instance_number(obj_rock_main) < 5)
{
    var _ranx = random_range(0, room_width);
    var _rany = random_range(0, room_height);

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




