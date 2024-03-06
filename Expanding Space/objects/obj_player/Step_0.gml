//Movement
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
up = keyboard_check(ord("W")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);


if up
{
	motion_add(image_angle, 0.07);
}

if down
{
	motion_add(image_angle, -0.07);
}


if left
{
	image_angle += 3;
}

if right
{
	image_angle -= 3;
}

move_wrap(true, true, 0);


//shooting

if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x,y,"Instances", obj_bullet);
	audio_play_sound(snd_bullet, 0, false, 1, 0, random_range(0.8, 1.2));
	
	
	if (powerup == 1)
	{
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 10;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 10;	
	}
}



