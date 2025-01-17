(
{
	"../Synthese_Sounddesign/0_main_patch.scd".loadRelative;

	~localSetup = true; // hier und bei globals ist das relevant

	"resources/globals.scd".loadRelative;
	"resources/lsysCreator_noDaemon.scd".loadRelative;
	"resources/pdefCreator.scd".loadRelative; // load pdef which will play back lsystems
	"resources/lsys_dict_text_replace.scd".loadRelative;


}.fork
)


/*
F - play
G - rest
- -down
+ - up
[] - new branch
| - play no rule
*/
(
var gen_all = 10;
var tempo_all = 1/2;
var quant_all = 0;
var leg_all = 0.8;
var vol_all = 1.5;

~newLsys.(
	name: \poppe_hi,
	axiom: "aG",
	rules: ( $a: "ab", $b: "bc", $c: "cd", $d: "d-e+", $e: "e+f-", $f: "-f[a]+", $G: "[a]" ),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 12,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: leg_all,
		wrapLo: [ 12 ],
		wrapHi: [ 96 ],
		instr: \simpleLead,
		vols: (vol_all * 0.5)
	)
);


~newLsys.(
	name: \poppe_mid,
	axiom: "aG",
	rules: ( $a: "ab", $b: "bc", $c: "cd", $d: "de", $e: "e+f-", $f: "--f[a]++", $G: "[--a++]" ),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 0,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: leg_all,
		wrapLo: [ 12 ],
		wrapHi: [ 96 ],
		instr: \simpleLead,
		vols: (vol_all * 0.75)
	)
);

~newLsys.(
	name: \poppe_lo,
	axiom: "aG",
	rules: ( $a: "ab", $b: "bc", $c: "cd", $d: "de", $e: "e--f++", $f: "-f[a]+", $G: "[++a--]" ),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: -12,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: leg_all),
	wrapLo: [ 12 ],
	wrapHi: [ 96 ],
	instr: \simpleLead,
	vols: (vol_all * 1.5)
)
);
)

(
Pdef(\poppe_hi_filter,
	Pbind(\vol, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.vol * 0.5},
			$b, {ev.vol * 0.6},
			$c, {ev.vol * 0.7},
			$d, {ev.vol * 0.8},
			$e, {ev.vol * 0.9},
			$f, {ev.vol * 1}
		)
	},
	\mod1Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Amount * 0.5},
			$b, {ev.mod1Amount * 0.6},
			$c, {ev.mod1Amount * 0.7},
			$d, {ev.mod1Amount * 0.8},
			$e, {ev.mod1Amount * 0.9},
			$f, {ev.mod1Amount * 1}
		)
	},
	\mod1Rate, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Rate * 0.5},
			$b, {ev.mod1Rate * 0.6},
			$c, {ev.mod1Rate * 0.7},
			$d, {ev.mod1Rate * 0.8},
			$e, {ev.mod1Rate * 0.9},
			$f, {ev.mod1Rate * 1}
		)
	},
	\mod2Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod2Amount * 0.5},
			$b, {ev.mod2Amount * 0.6},
			$c, {ev.mod2Amount * 0.7},
			$d, {ev.mod2Amount * 0.8},
			$e, {ev.mod2Amount * 0.9},
			$f, {ev.mod2Amount * 1}
		)
	},
	\mod3Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod3Amount * 0.1},
			$b, {ev.mod3Amount * 0.2},
			$c, {ev.mod3Amount * 0.3},
			$d, {ev.mod3Amount * 0.4},
			$e, {ev.mod3Amount * 0.5},
			$f, {ev.mod3Amount * 0.6}
		)
	},
	)

);

Pdef(\poppe_mid_filter,
	Pbind(\vol, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.vol * 0.5},
			$b, {ev.vol * 0.6},
			$c, {ev.vol * 0.7},
			$d, {ev.vol * 0.8},
			$e, {ev.vol * 0.9},
			$f, {ev.vol * 1}
		)
	},
	\mod1Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Amount * 0.5},
			$b, {ev.mod1Amount * 0.6},
			$c, {ev.mod1Amount * 0.7},
			$d, {ev.mod1Amount * 0.8},
			$e, {ev.mod1Amount * 0.9},
			$f, {ev.mod1Amount * 1}
		)
	},
	\mod1Rate, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Rate * 0.5},
			$b, {ev.mod1Rate * 0.6},
			$c, {ev.mod1Rate * 0.7},
			$d, {ev.mod1Rate * 0.8},
			$e, {ev.mod1Rate * 0.9},
			$f, {ev.mod1Rate * 1}
		)
	},
	\mod2Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod2Amount * 0.5},
			$b, {ev.mod2Amount * 0.6},
			$c, {ev.mod2Amount * 0.7},
			$d, {ev.mod2Amount * 0.8},
			$e, {ev.mod2Amount * 0.9},
			$f, {ev.mod2Amount * 1}
		)
	},
	\mod3Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod3Amount * 0.3},
			$b, {ev.mod3Amount * 0.4},
			$c, {ev.mod3Amount * 0.5},
			$d, {ev.mod3Amount * 0.6},
			$e, {ev.mod3Amount * 0.7},
			$f, {ev.mod3Amount * 0.8}
		)
	},
	)
);

Pdef(\poppe_lo_filter,
	Pbind(\vol, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.vol * 0.5},
			$b, {ev.vol * 0.6},
			$c, {ev.vol * 0.7},
			$d, {ev.vol * 0.8},
			$e, {ev.vol * 0.9},
			$f, {ev.vol * 1}
		)
	},
	\mod1Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Amount * 0.5},
			$b, {ev.mod1Amount * 0.6},
			$c, {ev.mod1Amount * 0.7},
			$d, {ev.mod1Amount * 0.8},
			$e, {ev.mod1Amount * 0.9},
			$f, {ev.mod1Amount * 1}
		)
	},
	\mod1Rate, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod1Rate * 0.5},
			$b, {ev.mod1Rate * 0.6},
			$c, {ev.mod1Rate * 0.7},
			$d, {ev.mod1Rate * 0.8},
			$e, {ev.mod1Rate * 0.9},
			$f, {ev.mod1Rate * 1}
		)
	},
	\mod2Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod2Amount * 0.5},
			$b, {ev.mod2Amount * 0.6},
			$c, {ev.mod2Amount * 0.7},
			$d, {ev.mod2Amount * 0.8},
			$e, {ev.mod2Amount * 0.9},
			$f, {ev.mod2Amount * 1}
		)
	},
	\mod3Amount, Pfunc {|ev|
		switch (ev.charNow,
			$a, {ev.mod3Amount * 0.5},
			$b, {ev.mod3Amount * 0.6},
			$c, {ev.mod3Amount * 0.7},
			$d, {ev.mod3Amount * 0.8},
			$e, {ev.mod3Amount * 0.9},
			$f, {ev.mod3Amount * 1}
		)
	},
	)
);

( Pbind(\controlbus, ~launchcontrol_xl_row_1)
<> Psym(Pseq([\poppe_hi], inf))
<> Pbind(\external1Target, "envelope_mod",
	\external1Amount, 1)
).play(~linkClock, quant: 4);

( Pbind(\controlbus, ~launchcontrol_xl_row_1)
<> Psym(Pseq([\poppe_mid], inf))
<> Pbind(\external1Target, "envelope_mod",
	\external1Amount, 1)
).play(~linkClock, quant: 4);

( Pbind(\controlbus, ~launchcontrol_xl_row_1)
<> Psym(Pseq([\poppe_lo], inf))
<> Pbind(\external1Target, "envelope_mod",
	\external1Amount, 1)
).play(~linkClock, quant: 4);

);


///////////////////////// SIMPLE SWITCH

~instrPreset.edit(\sd1);
(
~newLsys.(
	name: \simpleSwitch,
	axiom: "F",
	rules: ( $F: "FG", $f: "-F+G", $G: "G+f-" ),
	gen: 6,
	opts: (
		useGlobalPitch: false,
		noteOffset: -24,
		quant: 0,
		baseTempo: 1/4,
		legatoArr: 0.75,
		wrapLo: [ 12 ],
		instr: \syncWub
	)
);

Pdef(\simpleSwitch_filter,
	Pbind(\vol, Pfunc {|ev|
		if(ev.charNow == $F){ev.vol}{ev.vol * 1.2}
	},
	\filter_1_mod_1, Pfunc {|ev|
		if(ev.charNow == $F){ev.filter_1_mod_1}{ev.filter_1_mod_1 * 1.2}
	},
	\timingOffset, Pfunc {|ev|
		if(ev.charNow == $F){0}{0}
	},
	)
	<> (Pbind(\time, Ptime))
);

(Pdef(\play, Psym(Pseq([\simpleSwitch], inf))
	<> (Pbind(\time, Ptime)))
).play(~linkClock, quant: 4)
);

(
~newLsys.(
	name: \simpleSwitch,
	axiom: "F",
	rules: ( $F: "FG", $f: "-F+G", $G: "G+f-" ),
	gen: 6,
	opts: (
		useGlobalPitch: false,
		noteOffset: -24,
		quant: 0,
		baseTempo: 1/2,
		legatoArr: 0.75,
		wrapLo: [ 12 ],
		instr: \syncWub
	)
);

Pdef(\simpleSwitch_filter,
	Pbind(\vol, Pfunc {|ev|
		if(ev.charNow == $F){ev.vol}{ev.vol * 1.2}
	},
	\filter_1_mod_1, Pfunc {|ev|
		if(ev.charNow == $F){ev.filter_1_mod_1}{ev.filter_1_mod_1 * 1.2}
	},
	\timingOffset, Pfunc {|ev|
		if(ev.charNow == $F){0}{3/16}
	},
	)
	<> (Pbind(\time, Ptime))
);

(Pdef(\play, Psym(Pseq([\simpleSwitch], inf))
	<> (Pbind(\time, Ptime)))
).play(~linkClock, quant: 4)
);



///////////////////////// Rabbit

(
var gen_all = 3;
var tempo_all = 1/8;
var quant_all = 0;

~newLsys.(
	name: \rabbitSeq,
	axiom: "F",
	rules: ( $F: "+F-G--f++GfG", $f: "+F-G--f++GfG", $G: "F"),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 0,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: 0.2,
		wrapLo: [ 24 ],
		instr: \simplePluck
	)
);

~newLsys.(
	name: \rabbitSeq_bd,
	axiom: "F",
	rules: ( $F: "FGfGfG", $f: "FGfGfG", $G: "f"),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 0,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: 0.2,
		wrapLo: [ 12 ],
		instr: \bd1
	)
);

~newLsys.(
	name: \rabbitSeq_sd,
	axiom: "F",
	rules: ( $F: "fGFGSG", $f: "fGFGSG", $S: "fsFGSG", $G: "F", $s: "F"),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 7,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: 0.2,
		wrapLo: [ 12 ],
		vols: [0.9],
		instr: \sd1
	)
);

~newLsys.(
	name: \rabbitSeq_hh,
	axiom: "H",
	rules: ( $H: "12+H12-GHhHG", $G: "--H++", $h: "--H++"),
	gen: gen_all,
	opts: (
		useGlobalPitch: false,
		noteOffset: 12,
		quant: quant_all,
		baseTempo: tempo_all,
		legatoArr: 0.2,
		wrapLo: [ 12 ],
		vols: [0.9],
		instr: \hh1
	)
);
);

(
Pdef(\rabbitSeq_bd_filter,
	Pbind(\vol, Pfunc {|ev|
		if(ev.charNow == $F){ev.vol}{0}
	})
	<> (Pbind(\time, Ptime))
);

Pdef(\rabbitSeq_sd_filter,
	Pbind(\vol, Pfunc {|ev|
		case
		{ev.charNow == $S}{ev.vol}
		{ev.charNow == $s}{ev.vol * 0.8}
		{true}{0}
	})
);

Pdef(\rabbitSeq_hh_filter,
	Pbind(\vol, Pfunc {|ev|
		case
		{ev.charNow == $H}{ev.vol}
		{ev.charNow == $h}{ev.vol * 0.5}
		{true}{0}
	})
);


Pdef(\rabbitSeq_filter,
	Pbind(\vol, Pfunc {|ev|
		if(ev.charNow == $F){ev.vol * 1.1}{ev.vol * 0.8}
	},
	\oscillator_mod_1, Pfunc {|ev|
		if(ev.charNow == $F){ev.oscillator_mod_1 * 1}{ev.oscillator_mod_1 * 0.7}
	},
	\envelope_mod, Pfunc {|ev|
		if(ev.charNow == $F){ev.envelope_mod * 0.8}{ev.envelope_mod * 1}
	},
	)
);

( Pbind(\controlbus, ~launchcontrol_xl_row_1)
<> Psym(Pseq([\rabbitSeq], inf))
<> Pbind(\external1Target, "envelope_mod",
	\external1Amount, 1)
).play(~linkClock, quant: 4);
Pdef(\rabbit_sd, Psym(Pseq([\rabbitSeq_sd], inf))).play(~linkClock, quant: 4);
Pdef(\rabbit_bd, Psym(Pseq([\rabbitSeq_bd], inf))).play(~linkClock, quant: 4);
Pdef(\rabbit_hh, Psym(Pseq([\rabbitSeq_hh], inf))).play(~linkClock, quant: 4);
);

(
~newLsys.(
	name: \theLick,
	axiom: "-F",//"F-F-F-F-F",
	rules: ( $F: "F+F+F+F--FG--F+FGG" ),
	gen: 2.0
);
)

Pdef(\basicL).play(l)
~lsys.presets.theLick.instr = \simpleBass
~lsys.presets.theLick.baseTempo = 1/7
~lsys.presets.theLick.quant = 0
Pdef(\play, Psym(Pseq([\rabbitSeq_bd], inf))).play

(
~newLsys.(
	name: \fuenfte,
	axiom: "F-[F-F]-F-F",
	rules: ( $F: "GFFF--FGGG" ),
	gen: 2.0
);
)

Pdef(\basicL).play(l)
~ctlPresets.fuenfte.presetName = \simplePluck
~ctlPresets.theLick.baseTempo = 1/4
Pdef(\play, Psym(Pseq([\fuenfte], inf))).play





// baueme umdrehen
~newLsys.(
	name: \snowFlake,
	axiom: "F",
	rules: ($F: "F-[|4+[|4G]10F]F"),
	gen: 2.0
)

Pdef(\snowFlake).play(l)
~ctlPresets.snowFlake.baseTempo = 1/8
~ctlPresets.snowFlake.presetName = \srrLead
Pdef(\play, Psym(Pseq([\snowFlake], inf))).play

(
~newLsys.(
	name: \pausen,
	axiom: "G",
	rules: ( $F: "-F++F-F", $G: "G--X++G[X-X+F]", $X: "[XG-F]----XG++++F" ),
	gen: 2,
	opts: (
		instr: [\simplePluck, \simplePluck, \srrPluck],
		useGlobalPitch: false,
		noteOffset: 28,
		vols: [0.8, 0.7, 0.7],
		legatoArr: 1,
		quant: 0
	)
)
)
~lsys.presets.pausen.numBranches
Pdef(\play, Pn(Pdef(\pausen))).play

// es gibt fuer jedes lsystem pdef ein pdef mit dem namen + _filter
// außerdem für jedes "branchLevel" ein pdef mit dem namen + _filter0 (_filter1, _filter2 .. )
// alle werden mit leerem Pbind initialisiert (bewirken also keine änderung)

// fuer das gesamte lsys den wert \oscillator_mod_1 ändern wenn der char F ist
Pdef(\pausen_filter,
	Pbind(\oscillator_mod_1, Pfunc {|ev|
		if(ev.charNow == $F){0}{ev.oscillator_mod_1}
	})
)
Pdef(\pausen_filter, Pbind()) // rückgängig machen

// fuer branchlevel 0 (root) midinote random ändern
Pdef(\pausen_filter0,
	Pbind(\midinote, Pkey(\midinote) + Prand([0,7],inf))
)
Pdef(\pausen_filter0, Pbind()) // rückgängig machen

// bei level 2 alle X rausfiltern
Pdef(\pausen_filter1,
	Pbind(\vol, Pfunc{|ev|
		if(ev.charNow == $X){0}{ev.vol}})
)
Pdef(\pausen_filter1, Pbind())

// bei level 3 alle F rausfiltern
Pdef(\pausen_filter2,
	Pbind(\vol, Pfunc{|ev|
		if(ev.charNow == $F){0}{ev.vol}})
)
Pdef(\pausen_filter2, Pbind())
