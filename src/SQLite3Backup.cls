﻿"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Backup
	instanceVariableNames: 'library srcConnection srcName dstConnection dstName isOpen handle'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3Backup guid: (GUID fromString: '{c58a6f17-0d14-4288-b0c7-771f9a146bbc}')!
SQLite3Backup comment: 'I represent a SQLite backup operation.
!SQLite3Backup categoriesForClass!SQLite3-Core-Connections! !
!SQLite3Backup methodsFor!

dstConnection

dstConnection: anObject

dstName

dstName: anObject

finalize 

finish 

handle

handle: anObject

initialize

isOpen

open 

srcConnection

srcConnection: anObject

srcName

srcName: anObject

step 

step: nPages
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

to: dConnection named: dName from: sConnection named: sName
!SQLite3Backup class categoriesForMethods!
new!instance creation!public! !
to:named:from:named:!creating!public! !
!
