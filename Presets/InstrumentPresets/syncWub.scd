(
~instrumentPresetsDictionary['syncWub'] = [
\adsrType, \lead, // \noEnv, \pluck, \lead, \pad, \sync
\sendGate, true,
\envelope_mod, 0,
\envCurve, 3,

\pitchOpType, \unisonoDetune, // \noPitchOp, \vibrato, \slide, \unisonoDetune, \fm, \vibratoSync, \slideVibrato, \rectArpSync, \rectArp
\pitchOp_1_interval, 0.1,
\pitchOp_1_amount, 0,

\pitchOpType, \unisonoDetune,
\pitchOp_2_interval, 0.2,
\pitchOp_2_amount, 0.1,

\oscillatorType, \fm, // \noOscillator, \basic, \fm, \formant, \filteredNoise, \modal, \pulsar, \ping, \grainCloudGuitar
\oscillator_mod_1, 0.2,
\oscillator_mod_2, 0.2,
\oscillator_1_level, 1,
\oscillator_1_transpose, 0,

\oscillatorType_2, \fm,
\oscillator_2_mod_1, 0.75,
\oscillator_2_mod_2, 0.01,
\oscillator_2_level, 1,
\oscillator_2_transpose, 0,

// \noFx,
// \overdriveSoft, \overdriveMid, \overdriveHard,
// \shelvedOverdriveSoft, \shelvedOverdriveMid, \shelvedOverdriveHard,
// \sampleRateReduction, \fold, \wrap, \rectifier,
// \tremoloRect, \tremoloSine, \tremoloRamp,

\fxType, \bitcrush,
\fx_1_input_gain, 1,
\fx_mod_1, 0.1,
\fx_mod_2, 0.25,

\fxType_2, \sampleRateReduction,
\fx_2_mod_1, 0.89,
\fx_2_mod_2, 0.1,


\filterType, \lpf_moog, // \noFilter, \lpf_moog, \lpf_24, \lpf_12, \hpf_24, \hpf_12, \bpf, \notch, \lo_shelf, \hi_shelf,
\filter_1_mod_1, 0.1,
\filter_1_mod_2, 0.5,

\filterType_2, \notch,
\filter_2_mod_1, 0.5,
\filter_2_mod_2, 0.5,

\vol, 1,
\amp, 1,

\out, ~melody_bus,
\send_1, ~ef_reverb,
\send_1_level, 0.05,
\send_2, ~simpleDelay_8d,
\send_2_level, 0,

\mod1Type, \adsrEnv,
\mod1Target, "filter_1_mod_1",
\mod1Amount, 7,
\mod1Rate, 0.25,
\mod1attack, 0.1,
\mod1decay, 0.1,
\mod1sustain, 0,
\mod1release, 1,
\mod1EnvCurve, 1,
\mod1syncEnvRatio, 0.25,
\mod1ControlbusChannel, 0,

\mod2Type, \adsrEnv,
\mod2Target, "oscillator_2_mod_1",
\mod2Amount, 0.25,
\mod2Rate, 0.25,
\mod2attack, 0.2,
\mod2decay, 1,
\mod2sustain, 0.5,
\mod2release, 1,
\mod2EnvCurve, 2,
\mod2syncEnvRatio, 0,
\mod2ControlbusChannel, 1,

\mod3Type, \adsrEnv,
\mod3Target, "freq",
\mod3Amount, 2,
\mod3Rate, 0.25,
\mod3attack, 0,
\mod3decay, 0.025,
\mod3sustain, 0,
\mod3release, 1,
\mod3EnvCurve, 5,
\mod3syncEnvRatio, 0,
\mod3ControlbusChannel, 2,

\mod4Type, \adsrEnv,
\mod4Target, "filter_2_mod_1",
\mod4Amount, 1,
\mod4Rate, 0.25,
\mod4attack, 0.05,
\mod4decay, 0.05,
\mod4sustain, 0.5,
\mod4release, 1,
\mod4EnvCurve, 2,
\mod4syncEnvRatio, 0,
\mod4ControlbusChannel, 3,

\external1Target, "",
\external1Amount, 1,
\external2Target, "",
\external2Amount, 1,
\external3Target, "",
\external3Amount, 1,
\external4Target, "",
\external4Amount, 1,

\pattern1Target, "",
\pattern1Amount, 1,
\pattern2Target, "",
\pattern2Amount, 1,
\pattern3Target, "",
\pattern3Amount, 1,
\pattern4Target, "",
\pattern4Amount, 1,
];
~callInstrumentPreset.('syncWub');
)