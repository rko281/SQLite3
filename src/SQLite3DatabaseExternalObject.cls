"Filed out from Dolphin Smallalk"!

VOID subclass: #SQLite3DatabaseExternalObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3DatabaseExternalObject guid: (GUID fromString: '{b63bdc07-ea2c-4d6c-b5cd-5a09e31ac3a7}')!
SQLite3DatabaseExternalObject comment: 'SQLite3DatabaseExternalObject class	instanceVariableNames: '''''!
!SQLite3DatabaseExternalObject categoriesForClass!SQLite3-Core-UFFI-Support! !
!SQLite3DatabaseExternalObject methodsFor!

free

	self beUnfinalizable.
	SQLite3Library current close: self! !
!SQLite3DatabaseExternalObject categoriesForMethods!
free!public! !
!

