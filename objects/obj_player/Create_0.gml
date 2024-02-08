global.mode = "outdoors"

// possible modes are 
// outdoors, indoors, cave

// our footsteps
stone_footsteps = [stone_footstep_001, stone_footstep_002, stone_footstep_003, stone_footstep_004]
grass_footsteps = [grass_001, grass_002, grass_003, grass_004]

step_time = 60
current_step_time = 0

current_step = 0

function play_sound(_reverb, _surface)
{
	var _ef_bit = audio_effect_create(AudioEffectType.Bitcrusher)
	var _ef_reverb = audio_effect_create(AudioEffectType.Reverb1)
	var _hp_effect = audio_effect_create(AudioEffectType.HPF2);

	_ef_bit.factor = 20;
	_ef_reverb.size = _reverb;
	_hp_effect.cutoff = 2000;
	
	audio_bus_main.effects[0] = _ef_reverb
	audio_bus_main.effects[1] = _ef_bit
	audio_bus_main.effects[3] = _hp_effect;
	
	current_step++;
	if (current_step > 3)
	current_step = 0;
	
	// then play a sound depending on the surface
	if (_surface == "outdoors")
	{
		audio_play_sound(grass_footsteps[current_step],99,false)
	}
	
	if (_surface == "cave")
	{
		audio_play_sound(stone_footsteps[current_step],99,false)
	}	
	
	if (_surface == "indoors")
	{
		audio_play_sound(stone_footsteps[current_step],99,false)
	}
}
