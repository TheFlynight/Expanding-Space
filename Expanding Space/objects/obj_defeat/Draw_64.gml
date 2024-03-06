//open save file and read value of current points
ini_open("save.save_file");
//ini_read_real("Points", "Current", global.points);
global.points = ini_read_real("Points", "Current", global.points);
global.high_score = ini_read_real("Highscore", "Current", global.high_score);


//check if score is new high score
if(global.points > global.high_score)
{
	global.high_score = global.points;
	ini_write_real("Highscore", "Current", global.high_score);
}

ini_close();

//set text alignment for game over screen
draw_set_halign(fa_center);
draw_set_valign(fa_center);

//text for game over screen
draw_text(500, 400, "Game Over\n\nScore:" + string(global.points));
draw_text(500, 600, "Highscore:" + string(global.high_score));
//reset text alignment
draw_set_halign(fa_top);
draw_set_valign(fa_left);


