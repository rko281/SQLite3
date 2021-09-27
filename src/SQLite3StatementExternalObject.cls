"Filed out from Dolphin Smallalk"!

VOID subclass: #SQLite3StatementExternalObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3StatementExternalObject guid: (GUID fromString: '{c0f6eb9e-82bd-4e69-8a19-8422a1eebdf6}')!
SQLite3StatementExternalObject comment: 'I represent the SQLite API ''sqlite3_stmt'' C-level type.'!
!SQLite3StatementExternalObject categoriesForClass!SQLite3-Core-UFFI-Support! !
!SQLite3StatementExternalObject methodsFor!

free

	self beUnfinalizable.	SQLite3Library current apiFinalize: self! !
!SQLite3StatementExternalObject categoriesForMethods!
free!finalization!public! !
!

