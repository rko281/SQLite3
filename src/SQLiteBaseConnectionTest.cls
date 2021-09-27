﻿"Filed out from Dolphin Smallalk"!

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

noTestColumnNamesBobbyGo

setUp 

tearDown

testBadOpen

testBasicExecuteOk

testBasicExecuteSyntaxError

testBooleanColumnTypeMismatch

testBooleanObject

testBooleanWriteIntegerOneThenRead

testBooleanWriteIntegerTwoThenRead

testBooleanWriteIntegerZeroThenRead

testBooleanWriteNilThenRead

testBooleanWriteSQLNullThenRead

testBooleanWriteStringFalseThenRead

testBooleanWriteStringTrueThenRead

testBooleanWriteStringTwoThenRead

testBooleanWriteThenRead

testColumnNames

testColumnNamesBobbyStop

testColumnNamesNoSuchTable

testConstraintViolation
	db
		basicExecute: 'create table x (value integer primary key);';
		basicExecute: 'insert into x values(1);'.
	self should: [ db basicExecute: 'insert into x values(1);' ] raise: SQLite3ConstraintViolation!

testDataValuesAvailable

testDateAndTime

testDeclaredColumnTypes

testDefaultMultilingualStrings

testDoubleClose

testFloat

testInteger

testMultilingualStrings

testMultilingualTableName

testObjectBlob

testPrepareStep

testPrepareStepSelective

testResultSetColumnIntrospection

testScaledDecimal
	"This test is a simplified version of GlorpNumericTest>>tesNumeric."
	| s number float |
	
	number := Number readFrom: '12345678s' readStream.
	float := number asFloat.

	res := db basicExecute: 'create table x (xk integer primary key, xv real);'.
	self assert: res equals: 0.
	
	s := db prepare: 'insert into x values (NULL, ?)'.
	s at: 1 putFloat: number.
	s step. 		
	s finalize.	
	
	s := db prepare: 'select * from x'.
	s basicExecute: [ :row |
		self assert: (row nameOfColumn: 1) equals: 'xv'.
		self assert: (row floatAt: 1) equals: float ].
	s finalize!

testTableNames

testTableNamesOfEmptyDatabase

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
testTableNames!public!tests / tables! !
testTableNamesOfEmptyDatabase!public!tests / tables! !
testTime!public!tests / types! !
!
