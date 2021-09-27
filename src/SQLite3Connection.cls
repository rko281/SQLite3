﻿"Filed out from Dolphin Smallalk"!

SQLite3BaseConnection subclass: #SQLite3Connection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3Connection guid: (GUID fromString: '{4e8c4df4-33cf-464d-aca9-2e41bf38836a}')!
SQLite3Connection comment: 'I represent a connection to an SQLite database.
!SQLite3Connection categoriesForClass!SQLite3-Core-Connections! !
!SQLite3Connection methodsFor!

execute: anSQLText	

execute: anSQLText value: anObject

execute: anSQLText value: object1 value: object2

execute: anSQLText value: object1 value: object2 value: object3

execute: anSQLText value: object1 value: object2 value: object3 value: object4

execute: anSQLText with: aCollection

execute: anSQLText with: aCollection doing: aBlock
	| cursor |
	cursor := self execute: anSQLText with: aCollection.
	[aBlock value: cursor]
		ensure: [ cursor finalizeStatement ]! !
!SQLite3Connection categoriesForMethods!
execute:!public!public API / operating! !
execute:value:!public!public API / operating! !
execute:value:value:!public!public API / operating! !
execute:value:value:value:!public!public API / operating! !
execute:value:value:value:value:!public!public API / operating! !
execute:with:!public!public API / operating! !
execute:with:doing:!public!public API / operating! !
!
