(
s = Server.default();
/*
s.options.protocol = \tcp;
s.options.bindAddress = "0.0.0.0";*/
s.options.sampleRate = 48000;
s.options.bindAddress = "0.0.0.0";
s.options.maxLogins = 4;
s.options.device = "ASIO : ASIO Fireface USB";
s.waitForBoot {
	if(MIDIClient.initialized.not){
		MIDIClient.init;
		MIDIIn.connectAll;
	};
	"loading signal flow".postln;
	"signal_flow.scd".loadRelative;
	"loading instruments".postln;
	"instruments/fm_1.scd".loadRelative;
	"instruments/BD_808_1.scd".loadRelative;
	"instruments/clicks_1.scd".loadRelative;
	"instruments/spreadsynth_1.scd".loadRelative;
	"instruments/modes_synth_1.scd".loadRelative;
	"instruments/simple_modes_synth_1.scd".loadRelative;
	"loading utilities".postln;
	"utilities/cc_monitor.scd".loadRelative;
	"utilities/address_book.scd".loadRelative;
	"utilities/midi_defs_launchcontrol-xl.scd".loadRelative;
	"utilities/ip_config.scd".loadRelative;
	"ready".postln
}
)

s.record

s.freeAll

s.stopRecording