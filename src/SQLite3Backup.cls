"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Backup
	instanceVariableNames: 'library srcConnection srcName dstConnection dstName isOpen handle'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3Backup guid: (GUID fromString: '{c58a6f17-0d14-4288-b0c7-771f9a146bbc}')!
SQLite3Backup comment: 'I represent a SQLite backup operation.This is detailed at https://sqlite.org/c3ref/backup_finish.html#sqlite3backupinit'!
!SQLite3Backup categoriesForClass!SQLite3-Core-Connections! !
!SQLite3Backup methodsFor!

dstConnection	^ dstConnection!

dstConnection: anObject	dstConnection := anObject!

dstName	^ dstName!

dstName: anObject	dstName := anObject!

finalize 	self finish!

finish 	handle 		ifNotNil: [			library apiBackupFinish: handle.			handle := nil]!

handle	^ handle!

handle: anObject	handle := anObject!

initialize	super initialize.	isOpen := false.	library := SQLite3Library current.	handle := SQLite3DatabaseExternalObject new.	handle beFinalizable!

isOpen	^ isOpen!

open 	handle := (library backupTo: dstConnection named: dstName from: srcConnection named: srcName).	isOpen := true!

srcConnection	^ srcConnection!

srcConnection: anObject	srcConnection := anObject!

srcName	^ srcName!

srcName: anObject	srcName := anObject!

step 	"Passing negative number means run to completion"	self step: -1!

step: nPages	library backup: handle step: nPages! !
!SQLite3Backup categoriesForMethods!
dstConnection!accessing!public! !
dstConnection:!accessing!public! !
dstName!accessing!public! !
dstName:!accessing!public! !
finalize!finalization!public! !
finish!initialization!public! !
handle!accessing!public! !
handle:!accessing!public! !
initialize!initialization!public! !
isOpen!accessing!public! !
open!accessing!public! !
srcConnection!accessing!public! !
srcConnection:!accessing!public! !
srcName!accessing!public! !
srcName:!accessing!public! !
step!accessing!public! !
step:!accessing!public! !
!

!SQLite3Backup class methodsFor!

new

	^super new initialize!

to: dConnection named: dName from: sConnection named: sName	^(self new)		dstConnection: dConnection;		dstName: dName;		srcConnection: sConnection;		srcName: sName! !
!SQLite3Backup class categoriesForMethods!
new!instance creation!public! !
to:named:from:named:!creating!public! !
!

