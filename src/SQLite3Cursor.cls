﻿"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Cursor
	instanceVariableNames: 'connection statement moreRows rowClass rows'
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3Cursor guid: (GUID fromString: '{f36da042-73b3-42bc-8fe7-034fb92d61a0}')!
SQLite3Cursor comment: 'I represent a set of results returned by the database. I produce UDBCSQLite3Row instances lazily.
!SQLite3Cursor categoriesForClass!SQLite3-Core-Database! !
!SQLite3Cursor methodsFor!

asArray

	| all |

	all := OrderedCollection new.
	[self next ifNil: [false] ifNotNil: [ :val | all add: val. true]] whileTrue.

	^all asArray!

changes 

close

columnNames

connection 

finalizeStatement
	statement finalize!

initialize

next

nextOfClass: aRowClass
	| rr |
	moreRows ifFalse: [ ^nil ].

onlyRow

onlyRow: ifNoneBlock

onlyValue

rowClass

rowClass: anObject

rows

rowsOfClass: aRowClass

statement

statement: anObject
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

on: aStatement 
!SQLite3Cursor class categoriesForMethods!
new!public! !
on:!instance creation!public! !
!
