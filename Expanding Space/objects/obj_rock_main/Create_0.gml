if instance_number(obj_player) = 1
{
// Get the player's X and Y coordinates
player_x = instance_nearest(x, y, obj_player).x;
player_y = instance_nearest(x, y, obj_player).y;
// Calculate the direction towards the player
direction = point_direction(x, y, player_x, player_y);
speed = 1;
image_angle = random(360);
}







