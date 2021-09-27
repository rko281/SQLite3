"Filed out from Dolphin Smallalk"!

SQLite3AbstractError subclass: #SQLite3NativeError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3NativeError guid: (GUID fromString: '{ae67e89d-6cb5-48c2-b348-5204f728303a}')!
SQLite3NativeError comment: 'SQLite3NativeError class	instanceVariableNames: '''''!
!SQLite3NativeError categoriesForClass!SQLite3-Core-Errors! !
!SQLite3NativeError class methodsFor!

example	(SQLite3NativeError forNativeErrorCode: SQLITE_INTERRUPT  messageText: 'Interrupted') signal!

forNativeErrorCode: anInteger messageText: aString	^(self subclassForNativeErrorCode: anInteger) new			messageText: aString;			yourself	!

isAbstract 	^self name = #SQLite3NativeError!

nativeErrorCode	"Returns the native error code as defined by SQLite C library."		^ self subclassResponsibility!

subclassForNativeErrorCode: anInteger	^ self subclasses 		detect: [ :subclass | subclass nativeErrorCode = anInteger ]! !
!SQLite3NativeError class categoriesForMethods!
example!examples!public! !
forNativeErrorCode:messageText:!accessing!public! !
isAbstract!public!testing! !
nativeErrorCode!private / accessing!public! !
subclassForNativeErrorCode:!private / accessing!public! !
!

