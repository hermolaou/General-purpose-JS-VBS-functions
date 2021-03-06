/*
«Δόξα ἐν ὑψίστοις Θεῷ καί ἐπί γῆς εἰρήνη, ἐν ἀνθρώποις εὐδοκία»
*/

grammarCategories={
	tense: "pres imperf fut futperf aor perf plup",
	mood: "ind subj opt imperat inf",
	voice: "act mid mp pass",
	number: "sg pl dl",
	case: "nom gen dat acc voc",
	gender: "masc fem neut"
}

/* заменяет греческие символы из области юникода Greek Extended на такие же символы из Greek regular
replaces some Greek Extended Unicode characters with Greek Regular */
function ReplaceExtChars(text) {
	
	var patches=
		[
			'ύύ','άά','έέ','ίί','όό','ήή','ώώ'
		];
		
//	lowChars = "[ύάέίόήώ]";	//' Greek regular, with low char codes.
//	extChars = "[ύάέίόήώ]";	//' Greek extended, high char codes
	
	patches.forEach(function(r) {
		text=text.replace(new RegExp(r.charAt(0),"g"), r.charAt(1));
	});
	
	return text;
	
}

