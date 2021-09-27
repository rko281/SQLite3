﻿"Filed out from Dolphin Smallalk"!

SQLite3AbstractError subclass: #SQLite3NativeError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3NativeError guid: (GUID fromString: '{ae67e89d-6cb5-48c2-b348-5204f728303a}')!
SQLite3NativeError comment: 'SQLite3NativeError class
!SQLite3NativeError categoriesForClass!SQLite3-Core-Errors! !
!SQLite3NativeError class methodsFor!

example

forNativeErrorCode: anInteger messageText: aString

isAbstract 

nativeErrorCode

subclassForNativeErrorCode: anInteger
!SQLite3NativeError class categoriesForMethods!
example!examples!public! !
forNativeErrorCode:messageText:!accessing!public! !
isAbstract!public!testing! !
nativeErrorCode!private / accessing!public! !
subclassForNativeErrorCode:!private / accessing!public! !
!
