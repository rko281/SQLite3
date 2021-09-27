"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Cursor
	instanceVariableNames: 'connection statement moreRows rowClass rows'
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3Cursor guid: (GUID fromString: '{f36da042-73b3-42bc-8fe7-034fb92d61a0}')!
SQLite3Cursor comment: 'I represent a set of results returned by the database. I produce UDBCSQLite3Row instances lazily.'!
!SQLite3Cursor categoriesForClass!SQLite3-Core-Database! !
!SQLite3Cursor methodsFor!

asArray

	| all |

	all := OrderedCollection new.
	[self next ifNil: [false] ifNotNil: [ :val | all add: val. true]] whileTrue.

	^all asArray!

changes 	^statement changes!

close	" closing a cursor is not the same as closing the statement - we may reuse a prepared statement"	statement ifNotNil: [ statement reset ].	statement := nil!

columnNames	^ statement ifNotNil: [ statement columnNames ] ifNil: [ #() ]!

connection 	^statement connection!

finalizeStatement
	statement finalize!

initialize	"Initializes the receiver"		super initialize.	moreRows := true.	rowClass := SQLite3Row!

next	^ self nextOfClass: self rowClass!

nextOfClass: aRowClass
	| rr |
	moreRows ifFalse: [ ^nil ].		rr := aRowClass new.	rr columnNames: self columnNames.	1 to: statement dataValuesAvailable do: [ :c | rr at: c put: (statement valueOfColumn: c - 1) ].	moreRows := statement step = SQLITE_ROW.	moreRows ifFalse: [ self close ].	^ rr!

onlyRow	^ self onlyRow: [ ]"For the common case where there is exactly one row expected. Returns nil if there is no row."!

onlyRow: ifNoneBlock	^self rows isEmpty		ifTrue: [ ifNoneBlock value ]		ifFalse: [ rows first ]."For the common case where there is exactly one row expected. Returns the evaluation of ifNoneBlock if there is no row."!

onlyValue	^(self onlyRow: SQLite3Row) ifNotNil: [ :r | r first ]!

rowClass	^ rowClass!

rowClass: anObject	rowClass := anObject!

rows	^ self rowsOfClass: self rowClass!

rowsOfClass: aRowClass		rows ifNil: [ rows := OrderedCollection new ].	[ moreRows ] whileTrue: [			rows add: (self nextOfClass: aRowClass) ].	^ rows!

statement	^ statement!

statement: anObject	statement := anObject.	moreRows := (statement ifNil:[false ] ifNotNil: [ statement dataValuesAvailable > 0 ])! !
!SQLite3Cursor categoriesForMethods!
asArray!public! !
changes!accessing!public! !
close!API!public! !
columnNames!accessing!public! !
connection!accessing!public! !
finalizeStatement!API!public! !
initialize!initialization!public! !
next!API!public! !
nextOfClass:!API!public! !
onlyRow!API!public! !
onlyRow:!API!public! !
onlyValue!API!public! !
rowClass!accessing!public! !
rowClass:!accessing!public! !
rows!API!public! !
rowsOfClass:!API!public! !
statement!accessing!public! !
statement:!accessing!public! !
!

!SQLite3Cursor class methodsFor!

new
	^super new initialize!

on: aStatement 	^(self new) statement: aStatement; yourself.! !
!SQLite3Cursor class categoriesForMethods!
new!public! !
on:!instance creation!public! !
!

