(
~instrumentPresetsDictionary[\crash] = [
	\octave, 7,
	\adsrType, \pluck,
	\sendGate, false,
	\pitchOpType, \slide,
	\oscillatorType, \fm,
	\oscillatorType_2, \filteredNoise,
	\filterType, \hpf_12,
	\controlbus, ~launchcontrol_xl_row_4,
	\out, ~melody_bus,
	\send_1, ~ef_reverb,
	\send_1_level, 0.35,
	\pitchOp_mod_1, 0.3,
	\pitchOp_mod_2, 0.3,
	\oscillator_mod_1, 0.7,
	\oscillator_mod_2, 0.735,
	\oscillator_2_mod_1, 0.9,
	\oscillator_2_mod_2, 0.2,
	\fx_mod_1, 0,
	\fx_mod_2, 0.8,
	\filter_mod_1, 0.4,
	\filter_mod_2, 0.3,
	\envelope_mod, 0.9,
	\vol, 1,
	\amp, 1,
	\pitchOp_mod_1_macro_channel, 0,
	\pitchOp_mod_2_macro_channel, 0,
	\oscillator_mod_1_macro_channel, 0,
	\oscillator_mod_2_macro_channel, 0,
	\fx_mod_1_macro_channel, 0,
	\fx_mod_2_macro_channel, 0,
	\filter_mod_1_macro_channel, 0,
	\filter_mod_2_macro_channel, 0,
	\envelope_mod_macro_channel, 0,
	\vol_macro_channel, 0,
];
~callInstrumentPreset.(\crash);
)