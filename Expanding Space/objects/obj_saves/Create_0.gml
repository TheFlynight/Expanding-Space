//save system
global.points = 0;
global.high_score = 0;
//opens save file
ini_open("save.save_file");
global.high_score = ini_read_real("Highscore", "Current", 0);
ini_close();



