Document.open(thisProcess.nowExecutingPath.dirname +/+ "pitchPatterns.scd");
Document.open(thisProcess.nowExecutingPath.dirname +/+ "rhythmicPatterns.scd");
Document.open(thisProcess.nowExecutingPath.dirname +/+ "patternFunctions.scd");
Document.open(thisProcess.nowExecutingPath.dirname +/+ "drumFills.scd");
Document.open(thisProcess.nowExecutingPath.dirname +/+ "launchControlXlTrigger.scd");
~cueData[\lsysBeats1]
~instrPreset.create(\click)
~instrPreset.create_d(\template_drum)
~instrPreset.create_o(\simpleLead)
~instrPreset.edit(\syncWub);


// root note und drums mit phillip klären

(Pdef(\sd3) <> ~quarterFills).play(~linkClock, quant: 1);
(Pdef(\sd3) <> ~halfFills).play(~linkClock, quant: 2);
Pdef(\fill, (Pdef(\sd3) <> ~quarterFills));

Pdef(\fill).stop

thisProcess.openPorts
(
(Pn(Pdef(\looper, {
		var events = List.new;
		Pseq([
			(Psync(~loopPattern,1,~loopDur)).collect{|ev| events.add(ev);ev},
			Pn(Plazy{Pseq(events)}, ~loopRepeats - 1)
		])
	})
) <> (
	loopPattern: Pbind(\dur, Prand([1/3,1/4,1/2],inf), \degree, Pwhite(-7,3)),
	loopRepeats: 2,
	loopDur: Pn(Plazy {|ev| ev.loopDurKey })
) <> (Pbind(\loopDurKey, Pn(Plazy { 2 ** (~launchcontrol_xl_row_6.getnSynchronous(4).at(2).lincurve(0,1,3,-1,2).round) }.trace)
)
)).play(quant: 1);

// metronom
Pbind(\dur, 1, \note,24, \legato, 0.1).play(quant: 1)
);

2**4

//////// RHYTHMEN mit INSTRUMENTEN verketten


(
( Psym1(Pxrand([\simplePluck, \srrPluck, \noisyPluck],inf)) <>
Pbindef(\root) <>
Pbindef(\accPulse1)
).play
);

( Pdef(\simpleLead) <> Pbindef(\root) <> Pbindef(\pulse_8) ).play(~linkClock, quant: 4);


( {Psym1(Pxrand([\simplePluckReverse, \tonalSwoosh], inf))} <> Pbindef(\fifth) <> Pbindef(\pulse_4_ob)).play


~perc.stop;
~perc = ( Pdef(\sd2) <> Pbindef(\pat_332) <> Pbindef(\euclidean_4th_rng) ).play(~linkClock, quant: 4);
~perc2.stop;
~perc2 = ( Pdef(\bongo_1) <> Pbindef(\pat_332_allArp) <> Pbindef(\pulse_16)  ).play(~linkClock, quant: 4);
~perc3.stop;
~perc3 = ( Pdef(\bongo_muted) <> Pbindef(\pat_332_allArp) <> Pbindef(\euclidean_32th_rng)  ).play(~linkClock, quant: 4);


~bd.stop;

~bd2.stop;
~bd2 = ( Pdef(\bd1) <> Pbindef(\root) <> Pbindef(\pulse_2) ).play(~linkClock, quant: 4);
~sd.stop;
~sd = ( Pdef(\sd2) <> Pbindef(\fifth) <> Pbindef(\pulse_2_ob)  ).play(~linkClock, quant: 4);
~sd2.stop;
~sd2 = ( Pdef(\sd2) <> Pbindef(\fifth) <> Pbindef(\pulse_4_ob)  ).play(~linkClock, quant: 4);
~sdSwoosh.stop;
~sdSwoosh = ( Pdef(\tonalSwoosh) <> Pbindef(\fifth) <> Pbindef(\pulse_4_ob)  ).play(~linkClock, quant: 4);

~boom.stop;
~boom =  ( Pdef(\boom) <> Pbindef(\root) <> Pbindef(\pulse, \stretch, 16) ).play(~linkClock, quant: 4);


~longSwoosh.stop;
~longSwoosh =  ( Pdef(\noiseSwoosh) <> Pbindef(\root) <> Pbindef(\pulse, \stretch, 8) ).play(~linkClock, quant: 4);


~pluck.stop;
~pluck = ( Pdef(\srrPluck) <> Pn(Psync(Pbindef(\triad, \upperLimit, 24, \lowerLimit, 12),maxdur:4)) <> Pbindef(\pulse_4_ob)).play(~linkClock, quant: 4);

~pluck_ob.stop;
~pluck_ob = ( Pdef(\srrPluck) <> Pn(Psync(Pbindef(\xSus4, \upperLimit, 24, \lowerLimit, 12),maxdur:4)) <> Pbindef(\pulse_8_ob)).play(~linkClock, quant: 4);

(
~pluck.stop;
~pluck = ( Pdef(\srrPluck) <> Pn(Psync(Pbindef(\arp,
	\upperLimit, -12,
	\lowerLimit, -36,
	\transpositionHarmonics, 1,
	\chordTranspositions, 10),maxdur:8))
<> Pbindef(\pulse_16)).play(~linkClock, quant: 8);
);

(
~pluckRev.stop;
~pluckRev = ( Pdef(\simplePluckReverse) <> Pn(Psync(Pbindef(\arp,
	\upperLimit, 36,
	\lowerLimit, 0,
	\transpositionHarmonics,1,
	\chordTranspositions, 10),maxdur:16))
<> Pbindef(\pulse_16)).play(~linkClock, quant: 8);
);

(
~pluckRev.stop;
~pluckRev = ( Pdef(\simplePluckReverse)
	<> Pn(Psync(Pbindef(\pat_332_downUp,
		\upperLimit, 24,
		\lowerLimit, 0,),maxdur:32)) <> Pbindef(\pulse_8) ).play(~linkClock, quant: 4);
);
~simpleBass.stop;
~simpleBass = ( Pdef(\simpleBass) <> Pbindef(\root) <> Pbindef(\pulse) ).play(~linkClock, quant: 4);

Pdef(\pluckRevLong).stop;
Pdef(\pluckRevLong, Pdef(\simplePluckReverse) <> Pn(Psync(Pbindef(\rawPitches, \upperLimit, 48, \lowerLimit, -36,),maxdur:32)) <> Pbindef(\pulse, \stretch, 8) ).play(~linkClock, quant: 4);

~pluck.stop;
~pluck = ( Pdef(\srrPluck)	<> Pn(Psync(Pbindef(\rawPitches, \upperLimit, 48, \lowerLimit, -36,),maxdur:32)) <> Pbindef(\pulse) ).play(~linkClock, quant: 4);


~pluck2.stop;
~pluck2 = ( Pdef(\simplePluck) <> Ptsym(Pseq([\xSus4, \triad, \x7sus4, \tensionsArp], inf),dur: Pseq([2], inf)) <> Pbindef(\pulse_8_ob) ).play(~linkClock, quant: 4);


~pluck3.stop;
~pluck3 = ( Pdef(\variedPlucks) <> Pbindef(\triad) <> Pbindef(\pulse_8_ob)  ).play(~linkClock, quant: 4);

~source_group.release;
Pdef.all.do{ |item| Pdef(item).stop}



~sd2.stop;
~sd2 = ( Pdef(\sd2) <> Pbindef(\fifth) <> Pbindef(\pulse_4_ob)  ).play(~linkClock, quant: 4);
~bd2.stop;
~bd2 = ( Pdef(\bd1) <> Pbindef(\root) <> Pbindef(\pulse_2) ).play(~linkClock, quant: 4);
~hh_rng.stop;
~hh_rng = ( Pdef(\hh3) <> Pbindef(\root) <> Pbindef(\hh_rng) ).play(~linkClock, quant: 4);
~pluck3.stop;
~pluck3 = ( Pdef(\variedPlucks) <> Pbindef(\root) <> Pbindef(\pulse_4_ob)  ).play(~linkClock, quant: 4);
~sdSwoosh.stop;
~sdSwoosh = ( Pdef(\tonalSwoosh) <> Pbindef(\fifth) <> Pbindef(\pulse_4_ob)  ).play(~linkClock, quant: 4);



(
~bd.stop;
~bd = ( Pdef(\bdThump) <> Pbindef(\root) <> Pbindef(\bd_pattern_8th_rng) ).play(~linkClock, quant: 4);
~bd2.stop;
~bd2 = ( Pdef(\bd1) <> Pbindef(\root) <> Pbindef(\pulse_2) ).play(~linkClock, quant: 4);
~sd.stop;
~sd = ( Pdef(\sd1) <> Pbindef(\fifth) <> Pbindef(\sd_pattern_1)  ).play(~linkClock, quant: 4);
~hh1.stop;
~hh1 = ( Pdef(\hh1) <> Pbindef(\root) <> Pbindef(\euclidean_8th_rng) ).play(~linkClock, quant: 4);
~hh2.stop;
~hh2 = ( Pdef(\hh2) <> Pbindef(\root) <> Pbindef(\euclidean_16th_rng) ).play(~linkClock, quant: 4);
~hh_rng.stop;
~hh_rng = ( Pdef(\hh3) <> Pbindef(\root) <> Pbindef(\hh_rng) ).play(~linkClock, quant: 4);
);




(
Pbindef(\guitarCloud,
	\dur, Pseq([4], inf),
	\note, Pfunc {~pitchesRootDissonance[\root]} + Pseq([[-12, 0]], inf),
	\harmonic, Ptuple([1] ++ (Pwhite(1, 8).round ! 3), inf),
	\filter_mod_1, 0,
).play(~linkClock, quant: 4);
)

Pbindef(\guitarCloud).stop(quant: 4);
