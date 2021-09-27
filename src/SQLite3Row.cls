﻿"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3Row
	instanceVariableNames: 'values columnNames'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3Row guid: (GUID fromString: '{990f2b80-d137-445e-a0fe-f57a5a12f4af}')!
SQLite3Row comment: 'I represent a row of results returned by the database.
!SQLite3Row categoriesForClass!SQLite3-Core-Database! !
!SQLite3Row methodsFor!

asArray

asDictionary

at: aKey 

at: aKey ifAbsent: aBlock

at: aKey put: anObject

atIndex: anIndex

atIndex: anIndex put: anObject

atName: aKey 

atName: aKey put: anObject

columnNames

columnNames: anArray

dataCount

doesNotUnderstand: aMessage

first

last
	^ self values isEmpty ifFalse: [self values last]!

publishedAspects
	"Answer a <LookupTable> of the <Aspect>s published by the receiver."

	| aspects |
	aspects := self class publishedAspectsOfInstances.
	self columnNames 
		do: [:each | aspects add: ((self at: each) newAspect: each class: KeyedAspect)].
	^aspects!

size

values

values: anArray
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
publishedAspects!development!must strip!public! !
size!accessing!public! !
values!accessing!public! !
values:!accessing!public! !
!

!SQLite3Row class methodsFor!

new: anInteger
!SQLite3Row class categoriesForMethods!
new:!instance creation!public! !
!
