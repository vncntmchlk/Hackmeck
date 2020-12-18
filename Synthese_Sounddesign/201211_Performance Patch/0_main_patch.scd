(
Server.scsynth;
s = Server.default;
/*
s.options.protocol = \tcp;
s.options.bindAddress = "0.0.0.0";
*/
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
	"instruments/sine_OD_1.scd".loadRelative;
	"instruments/fm_1.scd".loadRelative;
	"instruments/synchronous_grains_1.scd".loadRelative;
	"instruments/asynchronous_grains_1.scd".loadRelative;
	"instruments/grain_sample_timestretch_1.scd".loadRelative;
	"instruments/wavetable_1.scd".loadRelative;
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
	~linkClock = LinkClock.new(1).permanent_(true);
	"ready".postln
}
)

~switchRows.(\pr1);
~switchRows.(\pr2);

TempoClock.default.tempo = 1

s.record

s.freeAll

s.stopRecording