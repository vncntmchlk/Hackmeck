(
~instrumentPresetsDictionary[\bd1] = [
\octave, 3,
	\drumType, \bodyTimbreTransientTail,
	\type, \on,
	\controlbus, ~launchcontrol_xl_row_1,
	\out, ~drums_bus,
	\send_1, ~ef_reverb,
	\send_1_level, 0,

	\timbre_ratio, 0.4,
	\body_sweep_ratio, 1,
	\timbre_sweep_ratio, 1,
	\body_time, 0.6,
	\timbre_time, 0.4,
	\transient_time, 0,
	\tail_time, 0.15,
	\body_vol, 1,
	\timbre_vol, 0.6,
	\transient_vol, 0.25,

	\fx_mod_1, 0,

	\tail_vol, 0,

	\time_factor, 0.35,
	\punch_factor, 2,

	\vol, 1,
	\amp, 2,
];
~callInstrumentPreset.(\bd1);
)