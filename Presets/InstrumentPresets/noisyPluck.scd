(
~instrumentPresetsDictionary[\noisyPluck] = [
	\adsrType, \pluck,
	\sendGate, false,
	\pitchOpType, \unisonoDetune,
	\oscillatorType, \filteredNoise,
	\oscillatorType_2, \basic,
	\fxType, \shelvedOverdriveSoft,
	\filterType, \lpf_moog,
	\controlbus, ~launchcontrol_xl_row_4,
	\out, ~melody_bus,
	\send_1, ~ef_reverb,
	\send_1_level, 0.2,

	\pitchOp_1_interval, 0,
	\pitchOp_1_amount, 0.1,

	\oscillator_mod_1, 0.005,
	\oscillator_mod_2, 0,

	\fx_mod_1, 0.35,
	\fx_mod_2, 0.3,

	\filter_1_mod_1, 0.15,
	\filter_1_mod_2, 0.1,

	\envelope_mod, 0.6,

	\vol, 1,
	\amp, 0.2,
];
~callInstrumentPreset.(\noisyPluck);
)