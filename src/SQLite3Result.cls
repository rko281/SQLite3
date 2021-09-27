"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Result
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3Result guid: (GUID fromString: '{08852fc3-7557-4704-a0f8-c4d971bb1f25}')!
SQLite3Result comment: 'SQLite3Result class	instanceVariableNames: '''''!
!SQLite3Result categoriesForClass!SQLite3-Core-Results! !
!SQLite3Result class methodsFor!

forNativeResultCode: anInteger	^ (self subclassForNativeResultCode: anInteger) new!

isAbstract 	^self name = #SQLite3Result!

nativeResultCode	^ self subclassResponsibility!

subclassForNativeResultCode: anInteger	^ self subclasses 		detect: [ :subclass | subclass nativeResultCode = anInteger ]  ! !
!SQLite3Result class categoriesForMethods!
forNativeResultCode:!accessing!public! !
isAbstract!public!testing! !
nativeResultCode!private / accessing!public! !
subclassForNativeResultCode:!private / accessing!public! !
!

