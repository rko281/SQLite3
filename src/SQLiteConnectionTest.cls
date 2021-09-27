﻿"Filed out from Dolphin Smallalk"!

TestCase subclass: #SQLiteConnectionTest
	instanceVariableNames: 'db res rs target'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLiteConnectionTest guid: (GUID fromString: '{d1bdf2ee-b368-440c-96ad-69fb674d57a1}')!
SQLiteConnectionTest comment: ''!
!SQLiteConnectionTest categoriesForClass!SQLite3-Core-Tests-Connections! !
!SQLiteConnectionTest methodsFor!

populateRowsInto: tableName of: database
	| rand rows schema insert rn rt |
	 rand := Random new.	
	rows := (rand next * 100) rounded.

	schema := 'create table ', tableName, ' (rk integer primary key, rn integer, rt text);'.
	insert := 'insert into ', tableName, ' values (?, ?, ?)'.
	
	database basicExecute: 'begin'. 
	database	basicExecute: schema.	
	1 to: rows do: [ :i |
		rn := i * (rand next * 10) rounded.
		rt := i asString, '-ZZZ'.
		database execute: insert with: (Array with: i with: rn with: rt) ].	
	database basicExecute: 'commit'.
	
	^ rows!

setUp 

tearDown

testBackup

testChanges

testExactlyOneRow

testExactlyOneRowGotNone

testExecuteDelete

testExecuteDrop

testExecuteNoResult

testExecuteValueInsertArray

testExecuteValueInsertBooleanNilThenSelect

testExecuteValueInsertChanges

testExecuteValueInsertThenSelect

testExecuteValueInsertThenSelect2

testExecuteValueInsertThenSelectDateTime

testExecuteWithInsertBooleanSQLNullThenSelect

testExecuteWithInsertBooleanThenSelect

testExecuteWithInsertChanges

testExecuteWithInsertMultilingualStringsThenSelect

testExecuteWithInsertNoDataThenSelect

testExecuteWithInsertThenSelect

testExecuteWithInsertThenSelect2

testExecuteWithInsertThenSelect3

testExecuteWithInsertThenSelectChineseTableName

testExecuteWithInsertThenSelectDateTime

testExecuteWithInsertThenSelectJapaneseTableName

testExecuteWithToFail

testExecuteWithToFail2

testGetAutocommit

testGlorpAutoID

testGlorpCompositeKey

testGlorpDoubleInsertPrimaryKey

testGlorpUpdate

testGlorpUpdateTwice

testInsertThenSelectInTransaction

testRows
	"SQLite uses 1-based column indexing for database rows."
	| rowCount rows any |
	
	rowCount := self populateRowsInto: 'junk' of: db.
	rs := db execute: 'select * from junk'.
	rs rowClass: SQLite3Row.
	rows := rs rows.
	
	self assert: rows size equals: rowCount.
	self assert: (rows first at: 'rk') equals: 1.
	self assert: (rows first at: 'rt') equals: '1-ZZZ'.
	self assert: (rows first at: 1) equals: 1.
	self assert: (rows first at: 3) equals: '1-ZZZ'.
	
	1 to: 5 do: [ :x |
		any := (Random new next * rowCount) truncated + 1.
		self assert: ((rows at: any) at: 'rk') equals: any.
		self assert: ((rows at: any) at: 'rt') equals: (any asString, '-ZZZ').
		self assert: (((rows at: any) at: 'rn') \\ any) equals: 0.
		self assert: ((rows at: any) at: 1) equals: any.
		self assert: (((rows at: any) at: 2) \\ any) equals: 0.
		self assert: ((rows at: any) at: 3) equals: (any asString, '-ZZZ') ].
			
	self assert: (rows last at: 'rk') equals: rowCount.
	self assert: (rows last at: 'rt') equals: (rowCount asString, '-ZZZ').
	self assert: (rows last at: 1) equals: rowCount.
	self assert: (rows last at: 3) equals: (rowCount asString, '-ZZZ').!

testStatementReadOnly

testValueInsertThenSelectInTransaction

untestStatementInProgress
!SQLiteConnectionTest categoriesForMethods!
populateRowsInto:of:!public!utilities! !
setUp!public!running! !
tearDown!public!running! !
testBackup!public!tests! !
testChanges!public!tests! !
testExactlyOneRow!public!tests! !
testExactlyOneRowGotNone!public!tests! !
testExecuteDelete!public!tests! !
testExecuteDrop!public!tests! !
testExecuteNoResult!public!tests! !
testExecuteValueInsertArray!public!tests! !
testExecuteValueInsertBooleanNilThenSelect!public!tests! !
testExecuteValueInsertChanges!public!tests! !
testExecuteValueInsertThenSelect!public!tests! !
testExecuteValueInsertThenSelect2!public!tests! !
testExecuteValueInsertThenSelectDateTime!public!tests! !
testExecuteWithInsertBooleanSQLNullThenSelect!public!tests! !
testExecuteWithInsertBooleanThenSelect!public!tests! !
testExecuteWithInsertChanges!public!tests! !
testExecuteWithInsertMultilingualStringsThenSelect!public!tests! !
testExecuteWithInsertNoDataThenSelect!public!tests! !
testExecuteWithInsertThenSelect!public!tests! !
testExecuteWithInsertThenSelect2!public!tests! !
testExecuteWithInsertThenSelect3!public!tests! !
testExecuteWithInsertThenSelectChineseTableName!public!tests! !
testExecuteWithInsertThenSelectDateTime!public!tests! !
testExecuteWithInsertThenSelectJapaneseTableName!public!tests! !
testExecuteWithToFail!public!tests! !
testExecuteWithToFail2!public!tests! !
testGetAutocommit!public!tests! !
testGlorpAutoID!public!tests / glorp compatibility! !
testGlorpCompositeKey!public!tests / glorp compatibility! !
testGlorpDoubleInsertPrimaryKey!public!tests / glorp compatibility! !
testGlorpUpdate!public!tests / glorp compatibility! !
testGlorpUpdateTwice!public!tests / glorp compatibility! !
testInsertThenSelectInTransaction!public!tests! !
testRows!public!tests! !
testStatementReadOnly!public!tests! !
testValueInsertThenSelectInTransaction!public!tests! !
untestStatementInProgress!public!tests! !
!
