"Filed out from Dolphin Smallalk"!

Error subclass: #SQLite3AbstractError
	instanceVariableNames: 'resultCode'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3AbstractError guid: (GUID fromString: '{6354c2de-1fb2-4b0c-9d37-e0e929e0521c}')!
SQLite3AbstractError comment: 'I represent an SQLite non-ok condition.'!
!SQLite3AbstractError categoriesForClass!SQLite3-Core-Errors! !
!SQLite3AbstractError methodsFor!

resultCode	^ resultCode!

resultCode: anObject	resultCode := anObject! !
!SQLite3AbstractError categoriesForMethods!
resultCode!accessing!public! !
resultCode:!accessing!public! !
!

!SQLite3AbstractError class methodsFor!

isAbstract 	^self name = #SQLite3AbstractError! !
!SQLite3AbstractError class categoriesForMethods!
isAbstract!public!testing! !
!

