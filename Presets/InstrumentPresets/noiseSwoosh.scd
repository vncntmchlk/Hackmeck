(
~instrumentPresetsDictionary[\noiseSwoosh] = [
	\adsrType, \sync,
	\sendGate, false,
	\pitchOpType, \slide,
	\oscillatorType, \filteredNoise,
	\filterType, \hpf_12,
	\beatDuration, Pfunc { ~linkClock.tempo },
	\syncMultiplier, Pfunc {|ev| (ev.dur * ev.stretch);},
	\controlbus, ~launchcontrol_xl_row_4,
	\out, ~melody_bus,
	\send_1, ~ef_reverb,
	\send_1_level, 0.15,

	\pitchOp_1_interval, 0.55,
	\pitchOp_1_amount, 0.1,

	\oscillator_mod_1, 0.3,
	\oscillator_mod_2, 0,

	\fx_mod_1, 0,
	\fx_mod_2, 0,

	\filter_1_mod_1, 0.15,
	\filter_1_mod_2, 0.1,

	\envelope_mod, 1,
	\envCurve, 7,

	\vol, 1,
	\amp, 0.2,
];
~callInstrumentPreset.(\noiseSwoosh);
)