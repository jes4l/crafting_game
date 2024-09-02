// Create event
spawn_amount = 7;
spawn_count = 0;
spawn_rate = 1 * room_speed;
alarm[0] = 1;
alarm[1] = room_speed * 5;
alarm[2] = room_speed * 5;

// oEnemy
global.hp = 175;
global.spd = 1.2;

// oEnemyhomelander
global.hp_homelander = 375;
global.spd_homelander = 1.4;
spawn_amount_homelander = 10;
spawn_count_homelander = 0;
spawn_rate_homelander = 1 * room_speed;
homelander_spawned = false;

// oEnemyBoss
global.hp_boss = 475;
global.spd_boss = 1.6;
spawn_amount_boss = 6;
spawn_count_boss = 0;
spawn_rate_boss = 1 * room_speed;
boss_spawned = false;


/*// oEnemyGhost
global.hp_ghost = 11;
global.spd_ghost = 1;
spawn_amount_ghost = 1;
spawn_count_ghost = 0;
spawn_rate_ghost = 1 * room_speed;
ghost_spawned = false;
*/

// Countdown
global.countdown = 5;