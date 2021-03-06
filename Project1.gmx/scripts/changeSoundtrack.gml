//changeSoundtrack(newSoundtrack, fadeOutTime, fadeInTime, loop)
//fade times are in seconds, soundtracks will overlap while fading
with (obj_init)
{
    if not (global.soundtrack == noone)
    {
        audio_sound_gain(global.soundtrack, 0, argument1*1000);
        soundToStop = global.soundtrack;
        alarm[0] = (room_speed * argument1) + 1;
    }
    global.soundtrack = audio_play_sound(argument0, 10, argument3);
    audio_sound_gain(global.soundtrack, 0, 0);
    if (global.soundtrackPlaying) {
        audio_sound_gain(global.soundtrack, 1, room_speed * argument2);
    }
}
