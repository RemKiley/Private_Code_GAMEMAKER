function Sc_Take_Damage(){
_health -= argument0

if (_health <= 0) 
{
    player_die()
}
}