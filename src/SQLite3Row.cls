"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Row
	instanceVariableNames: 'values columnNames'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3Row guid: (GUID fromString: '{990f2b80-d137-445e-a0fe-f57a5a12f4af}')!
SQLite3Row comment: 'I represent a row of results returned by the database.'!
!SQLite3Row categoriesForClass!SQLite3-Core-Database! !
!SQLite3Row methodsFor!

asArray	^ self values asArray!

asDictionary	"Borrowed from the future - Pharo 8"	| dict |	dict := Dictionary new.	self columnNames with: self values do: [ :k :v | dict at: k put: v ].	^ dict!

at: aKey 	^ self at: aKey ifAbsent: [  ]!

at: aKey ifAbsent: aBlock	^ aKey isInteger 		ifTrue: [ self values at: aKey ifAbsent: aBlock ] 		ifFalse: [ self values at:(self columnNames indexOf: aKey) ifAbsent: aBlock ]!

at: aKey put: anObject	^ aKey isInteger 		ifTrue: [self atIndex: aKey put: anObject]		ifFalse: [ self atName: aKey put: anObject ]!

atIndex: anIndex	^ values at: anIndex ifAbsent: [  ]!

atIndex: anIndex put: anObject	^ self values at: anIndex put: anObject!

atName: aKey 	| idx |	idx := self columnNames indexOf: aKey.	^idx = 0 		ifTrue: [ SQLite3Misuse				signal: 'Attept to set invalid column name ', aKey, ' in result set'   ] 		ifFalse: [ values at: idx ]!

atName: aKey put: anObject	| idx |	^ (idx := self columnNames indexOf: aKey) isZero 		ifTrue: [ 			columnNames := self columnNames copyWith: aKey.			values := self values copyWith: anObject ]		ifFalse: [ values at: idx put: anObject ]!

columnNames	^ columnNames ifNil: [ #() ]!

columnNames: anArray	columnNames := anArray.	values := Array new: anArray size!

dataCount	^ self columnNames size!

doesNotUnderstand: aMessage	^ self at: aMessage selector asString 			ifAbsent: [ 				"20160514: This bit, for Glorp integration, feels a bit iffy."				self at: aMessage selector asString asUppercase 					ifAbsent: [ super doesNotUnderstand: aMessage ]]!

first	^ self values isEmpty ifFalse: [self values first]!

last
	^ self values isEmpty ifFalse: [self values last]!

size	^ self columnNames size!

values	 ^values ifNil: [ #() ]!

values: anArray	 values := anArray! !
!SQLite3Row categoriesForMethods!
asArray!converting!public! !
asDictionary!converting!public! !
at:!accessing!public! !
at:ifAbsent:!accessing!public! !
at:put:!accessing!public! !
atIndex:!accessing!public! !
atIndex:put:!accessing!public! !
atName:!accessing!public! !
atName:put:!accessing!public! !
columnNames!accessing!public! !
columnNames:!accessing!public! !
dataCount!accessing!public! !
doesNotUnderstand:!public!reflective operations! !
first!accessing!public! !
last!accessing!public! !
size!accessing!public! !
values!accessing!public! !
values:!accessing!public! !
!

!SQLite3Row class methodsFor!

new: anInteger	^(self new) 		columnNames:(Array new:anInteger);		values: (Array new: anInteger);		yourself! !
!SQLite3Row class categoriesForMethods!
new:!instance creation!public! !
!

