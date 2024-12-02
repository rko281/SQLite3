"Filed out from Dolphin Smalltalk"!

TestCase subclass: #SQLiteBaseConnectionTest
	instanceVariableNames: 'db res'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLiteBaseConnectionTest guid: (GUID fromString: '{9e659dac-9e00-44c7-813b-c1309ec79309}')!
SQLiteBaseConnectionTest comment: ''!
!SQLiteBaseConnectionTest categoriesForClass!SQLite3-Core-Tests-Connections! !
!SQLiteBaseConnectionTest methodsFor!

invalidFileNameOnCurrentOperatingSystem
	^'/&*no' !

noTestColumnNamesBobbyGo	"In this test, Bobby Tables strikes naive SQL string construction."	"20190302, pierce: #basicExecute: uses prepare/step/finalize internally and is no longer susceptible to injection attacks. "	| tables bobby |		res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: (res = 0).	res := db basicExecute: 'create table students (sk integer, sname varchar);'.	self assert: (res = 0).	tables := db tableNames.	self assert: (tables size = 2).	self assert: (tables first = 'x').		self assert: (tables second = 'students').		bobby := 'x); drop table students; --'.		res := db basicExecute: 'pragma table_info(', bobby, ')'.	self assert: (res = 0).	tables := db tableNames.	self assert: (tables size = 1).	self assert: (tables first = 'x').	!

setUp 	super setUp.	db := SQLite3BaseConnection on: ':memory:'.	db open.!

tearDown		[ db close ] on: SQLite3Misuse do: [ ].	super tearDown.!

testBadOpen	| newConnection |	newConnection := SQLite3BaseConnection		on: self invalidFileNameOnCurrentOperatingSystem.	self should: [ newConnection open ] raise: SQLite3CantOpen.	self deny: newConnection isOpen!

testBasicExecuteOk	res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: res equals: 0.	res := db basicExecute: 'drop table x;'.	self assert: res equals: 0.	!

testBasicExecuteSyntaxError	self should: [ db basicExecute: 'create table,;' ]		raise: SQLite3AbstractError	!

testBooleanColumnTypeMismatch	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv notboolean);'.	self assert: res equals: 0.	s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		self should: [ row booleanAt: 0 ] raise: SQLite3AbstractError ].	s finalize.	!

testBooleanObject	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putObject: true.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row objectAt: 0.		self assert: v equals: true ].	s finalize.	!

testBooleanWriteIntegerOneThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putInteger: 1.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: true ].	s finalize!

testBooleanWriteIntegerTwoThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putInteger: 2.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		self should: [ row booleanAt: 0 ] raise: SQLite3AbstractError ].	s finalize!

testBooleanWriteIntegerZeroThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putInteger: 0.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: false ].	s finalize!

testBooleanWriteNilThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putNil: nil.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: nil ].	s finalize!

testBooleanWriteSQLNullThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, NULL)'.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: nil ].	s finalize!

testBooleanWriteStringFalseThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putString: 'false'.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: false ].	s finalize!

testBooleanWriteStringTrueThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putString: 'true'.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: true ].	s finalize!

testBooleanWriteStringTwoThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putString: '2'.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		self should: [ row booleanAt: 0 ] raise: SQLite3AbstractError ].	s finalize!

testBooleanWriteThenRead	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xv boolean);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putBoolean: true.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row booleanAt: 0.		self assert: v equals: true ].	s finalize!

testColumnNames	| columns |		res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: res equals: 0.	columns := db columnNamesFor: 'x'.	self assert: columns size equals: 2.	self assert: columns first equals: 'xk'.	self assert: columns second equals: 'xv'.	!

testColumnNamesBobbyStop	"In this test, Bobby Tables strikes again, but fails, because #columnNamesFor: uses parameter binding."	| columns tables |		res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: res equals: 0.	res := db basicExecute: 'create table students (sk integer, sname varchar);'.	self assert: res equals: 0.	tables := db tableNames.	self assert: tables size equals: 2.	self assert: tables first equals: 'x'.		self assert: tables second equals: 'students'.			columns := db columnNamesFor: 'x; drop table students; --'.	self assert: (columns isNil).	tables := db tableNames.	self assert: tables size equals: 2.	self assert: tables first equals: 'x'.		self assert: tables second equals: 'students'!

testColumnNamesNoSuchTable	| columns |		res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: res equals: 0.	columns := db columnNamesFor: 'y'.	self assert: (columns isNil).!

testConstraintViolation
	db
		basicExecute: 'create table x (value integer primary key);';
		basicExecute: 'insert into x values(1);'.
	self should: [ db basicExecute: 'insert into x values(1);' ] raise: SQLite3ConstraintViolation!

testDataValuesAvailable	| s | 		res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.	self assert: res equals: 0.	res := db basicExecute: 'insert into x values (NULL, 1, "duh");'.		self assert: res equals: 0.		s := db prepare: 'select * from x'.	s basicExecute: [  :row |		self assert: row dataValuesAvailable equals: 3 ].	s finalize!

testDateAndTime	| data s | 		data := DateAndTime year: 2015 month: 4 day: 1.		res := db basicExecute: 'create table x (xv datetime);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (?)'.	s at: 1 putDateTime: data.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row dateTimeAt: 0.		self assert: v year equals: 2015.		self assert: v month equals: 4.		self assert: v dayOfMonth equals: 1 ].	s finalize!

testDeclaredColumnTypes	| columns |		res := db basicExecute: 'create table x (xk integer, xv blob, xb boolean);'.	self assert: res equals: 0.	columns := db declaredColumnTypesFor: 'x'.	self assert: columns size equals: 3.	self assert: columns first equals: 'integer'.	self assert: columns second equals: 'blob'.	self assert: columns third equals: 'boolean'!

testDefaultMultilingualStrings	| s | 		res := db basicExecute: 'create table x (xk integer primary key, xm1 text default ''中文'', xm2 text default ''áěšřčá'');'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	(db prepare: 'insert into x (xk) values (NULL)')		step;		finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xm1, xm2 from x order by xk'.	s basicExecute: [  :row |		self assert: (row stringAt: 0) equals: '中文' .		self assert: (row stringAt: 1) equals: 'áěšřčá' ].	s finalize!

testDoubleClose		db close.	[ db close ] on: SQLite3Misuse do: [ ]	"#tearDown will close the db again, and is similarly guarded."!

testFloat	| s |		res := db basicExecute: 'create table x (xk integer primary key, xv real);'.	self assert: res equals: 0.	res := db basicExecute: 'insert into x values (NULL, 1.141);'.	self assert: res equals: 0.		s := db prepare: 'select * from x'.	s basicExecute: [ :row |		self assert: (row nameOfColumn: 1) equals: 'xv'.		self assert: (row floatAt: 1) equals: 1.141 ].	s finalize!

testInteger	"The large integer comes from Glorp's testInt8."	| s |				res := db basicExecute: 'create table x (xk integer primary key, xv integer);'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putInteger: 3212321555.	s step. 			s finalize.			s := db prepare: 'select * from x'.	s basicExecute: [ :row |		self assert: (row nameOfColumn: 1) equals: 'xv'.		self assert: (row integerAt: 1) equals: 3212321555 ].	s finalize!

testMultilingualStrings	| data s idx | 		data := OrderedCollection with: 'English' with: '中文' with: 'にほんご', 'áěšřčá'.		res := db basicExecute: 'create table x (xk integer primary key, xv varchar);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	data do: [ :ea |		s at: 1 putString: ea.		s step; clearBindings; reset ].	s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		idx := 1.	s := db prepare: 'select xv from x order by xk asc'.	s basicExecute: [  :row |		self assert: (row stringAt: 0) equals: (data at: idx).		idx := idx + 1 ].	s finalize!

testMultilingualTableName	| s | 		res := db basicExecute: 'create table 表一 (xk integer primary key, xm1 text default ''中文'');'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	(db prepare: 'insert into 表一 (xk) values (NULL)')		step;		finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xm1 from 表一 order by xk'.	s basicExecute: [  :row |		self assert: (row stringAt: 0) equals: '中文' ].	s finalize!

testObjectBlob	| data s | 		data := OrderedCollection with: 1 with: 'two' with: 3.3.		res := db basicExecute: 'create table x (xk integer primary key, xv blob);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?)'.	s at: 1 putObject: data.	s step. s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select xv from x'.	s basicExecute: [  :row |		| v |		v := row objectAt: 0.		self assert: v size equals: 3.		self assert: v first equals: 1.		self assert: v second equals: 'two'.		self assert: v third equals: 3.3 ].	s finalize!

testPrepareStep	| s i sql | 		res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?, ?)'.	sql := s sqlText.	self assert: sql equals: 'insert into x values (NULL, ?, ?)'.	1 to: 10 do: [ :x |		s at: 1 putInteger: x * x.		s at: 2 putString: x displayString, ' * ', x displayString.		s step. s clearBindings. s reset. ].			s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		s := db prepare: 'select * from x'.	sql := s sqlText.	self assert: sql equals: 'select * from x'.	s basicExecute: [  :row |		i := row integerAt: 0.		self assert: (row integerAt: 1) equals: (i * i).		self assert: (row stringAt: 2) equals: (i displayString, ' * ', i displayString) ].	s finalize!

testPrepareStepSelective	| s i sql count | 		res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.	self assert: res equals: 0.	res := db basicExecute: 'begin'.	self assert: res equals: 0.	s := db prepare: 'insert into x values (NULL, ?, ?)'.	sql := s sqlText.	self assert: sql equals: 'insert into x values (NULL, ?, ?)'.	1 to: 10 do: [ :x |		s at: 1 putInteger: x * x.		s at: 2 putString: x displayString, ' * ', x displayString.		s step. s clearBindings. s reset. ].			s finalize.	res := db basicExecute: 'commit'.	self assert: res equals: 0.		count := 0.	s := db prepare: 'select * from x where iv < ?'.	sql := s sqlText.	self assert: sql equals: 'select * from x where iv < ?'.	s at: 1 putInteger: 27.	s basicExecute: [  :row |		count := count + 1.		i := row integerAt: 0.		self assert: (row integerAt: 1) equals: (i * i).		self assert: (row stringAt: 2) equals: (i displayString, ' * ', i displayString) ].	s finalize.	self assert: count equals: 5!

testResultSetColumnIntrospection	| s | 	res := db basicExecute: 'create table x (xk integer primary key, iv integer, tv text);'.	self assert: res equals: 0.	res := db basicExecute: 'insert into x values (NULL, 1, "duh");'.		self assert: res equals: 0.		s := db prepare: 'select * from x'.	s basicExecute: [  :row |		self assert: (row nameOfColumn: 0) equals: 'xk'.		self assert: (row valueOfColumn: 0) equals: 1.		self assert: (row nameOfColumn: 1) equals: 'iv'.		self assert: (row valueOfColumn: 1) equals: 1.		self assert: (row nameOfColumn: 2) equals: 'tv'.		self assert: (row valueOfColumn: 2) equals: 'duh' ].	s finalize!

testScaledDecimal
	"This test is a simplified version of GlorpNumericTest>>tesNumeric."
	| s number float |
	
	number := Number readFrom: '12345678s' readStream.
	float := number asFloat.

	res := db basicExecute: 'create table x (xk integer primary key, xv real);'.
	self assert: res equals: 0.
	
	s := db prepare: 'insert into x values (NULL, ?)'.
	number sqliteBindTo: s at: 1.
	s step. 		
	s finalize.	
	
	s := db prepare: 'select * from x'.
	s basicExecute: [ :row |
		self assert: (row nameOfColumn: 1) equals: 'xv'.
		self assert: (row floatAt: 1) equals: float ].
	s finalize!

testSpeed	| time sampleSize s results  |		res := db basicExecute: 'create table x (xk integer primary key, xr real, xs varchar(128), xb boolean);'.	self assert: res equals: 0.

	sampleSize := 10000.
	Transcript 
		cr; 
		show: 'Writing '; print: sampleSize; show: ' objects... ';
		show: (time := Time millisecondsToRun: [res := (1 to: sampleSize) collect: [ :i | db basicExecute: 'insert into x (xk,xr,xs,xb) values (<1d>, <2d>, <3p>, <4d>);' << {i. i * 3.14. (String new: 64) atAllPut: (Character asciiValue: (64 + (i \\ 64))); yourself. i odd}]]) displayString;
		show: ' ms'.
		self assert: (res allSatisfy: [ :r | r = 0]).
	s := db prepare: 'select * from x order by xk'.
	Transcript 
		cr; 
		show: 'Reading '; print: sampleSize; show: ' objects... ';
		show: (time := Time millisecondsToRun: 
				[s step. results := (SQLite3Cursor on: s) asArray]) displayString;
		show: ' ms'.

	self assert: results size equals: sampleSize.
	results keysAndValuesDo: 
		[ :index :row |
		self assert: (row values at: 1) equals: index.
		self assert: (row values at: 2) equals: index * 3.14.
		self assert: (row values at: 3) first asciiValue equals: (64 + (index \\ 64)).
		self assert: (row values at: 4) equals: index odd].

	s finalize!

testTableNames	| tables |		res := db basicExecute: 'create table x (xk integer, xv integer);'.	self assert: res equals: 0.	tables := db tableNames.	self assert: tables size equals: 1.	self assert: tables first equals: 'x'!

testTableNamesOfEmptyDatabase	| tables |		tables := db tableNames.	self assert: tables size equals: 0.	!

testTime

	| data s | 
	
	data := Time fromString: '12:00'.
	
	res := db basicExecute: 'create table x (xv time);'.
	self assert: res equals: 0.

	res := db basicExecute: 'begin'.
	self assert: res equals: 0.
	s := db prepare: 'insert into x values (?)'.
	s at: 1 putTime: data.
	s step. s finalize.
	res := db basicExecute: 'commit'.
	self assert: res equals: 0.
	
	s := db prepare: 'select xv from x'.
	s basicExecute: [  :row |
		| v |
		v := row timeAt: 0.
		self assert: v hour equals: data hour. 
		self assert: v minute equals: data minute. 
		self assert: v second equals: data second ].
	s finalize! !
!SQLiteBaseConnectionTest categoriesForMethods!
invalidFileNameOnCurrentOperatingSystem!public!tests! !
noTestColumnNamesBobbyGo!public!tests! !
setUp!public!running! !
tearDown!public!running! !
testBadOpen!public!tests / connections! !
testBasicExecuteOk!public!tests / execution! !
testBasicExecuteSyntaxError!public!tests / execution! !
testBooleanColumnTypeMismatch!public!tests / types! !
testBooleanObject!public!tests / types! !
testBooleanWriteIntegerOneThenRead!public!tests / writing! !
testBooleanWriteIntegerTwoThenRead!public!tests / writing! !
testBooleanWriteIntegerZeroThenRead!public!tests / writing! !
testBooleanWriteNilThenRead!public!tests / writing! !
testBooleanWriteSQLNullThenRead!public!tests / writing! !
testBooleanWriteStringFalseThenRead!public!tests / writing! !
testBooleanWriteStringTrueThenRead!public!tests / writing! !
testBooleanWriteStringTwoThenRead!public!tests / writing! !
testBooleanWriteThenRead!public!tests / writing! !
testColumnNames!public!tests / columns! !
testColumnNamesBobbyStop!public!tests / columns! !
testColumnNamesNoSuchTable!public!tests / columns! !
testConstraintViolation!public!tests / connections! !
testDataValuesAvailable!public!tests / execution! !
testDateAndTime!public!tests / types! !
testDeclaredColumnTypes!public!tests / columns! !
testDefaultMultilingualStrings!public!tests / multilingual! !
testDoubleClose!public!tests / connections! !
testFloat!public!tests / types! !
testInteger!public!tests / types! !
testMultilingualStrings!public!tests / multilingual! !
testMultilingualTableName!public!tests / multilingual! !
testObjectBlob!public!tests / types! !
testPrepareStep!public!tests! !
testPrepareStepSelective!public!tests! !
testResultSetColumnIntrospection!public!tests! !
testScaledDecimal!public!tests / types! !
testSpeed!public!tests / types! !
testTableNames!public!tests / tables! !
testTableNamesOfEmptyDatabase!public!tests / tables! !
testTime!public!tests / types! !
!

