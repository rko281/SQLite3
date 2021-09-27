﻿"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3PreparedStatement
	instanceVariableNames: 'connection handle changes columnNames'
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3PreparedStatement guid: (GUID fromString: '{bd7392e9-0869-42a6-b979-d7e82dc6f6a2}')!
SQLite3PreparedStatement comment: 'I represent an SQLite prepared statement.'!
!SQLite3PreparedStatement categoriesForClass!SQLite3-Core-Database! !
!SQLite3PreparedStatement methodsFor!

at: aColumn putBoolean: aBoolean

at: aColumn putByteArray: anObject

at: aColumn putDate: aDate

	| string |

	string := SQLite3DateTimeString
		streamContents: [ :stream | aDate printOn: stream format: 'yyyy-MM-dd'].
	^ self library with: handle at: aColumn putString: string!

at: aColumn putDateTime: aDateTime
	| s |
	
	s := SQLite3DateTimeString streamContents: [ :stream | aDateTime printOn: stream ].
	^ self library with: handle at: aColumn putString: s trimBlanks!

at: aColumn putFloat: aFloat

	^ self library with: handle at: aColumn putFloat: aFloat asFloat!

at: aColumn putInteger: anInteger

at: aColumn putNil: anObject

at: aColumn putObject: anObject
	^ self library with: handle at: aColumn putBlob: anObject binaryStoreBytes!

at: aColumn putString: aString

at: aColumn putTime: aTime

	| string |

	string := SQLite3DateTimeString streamContents: [ :stream | aTime printOn: stream ].
	^ self library with: handle at: aColumn putString: string!

basicExecute: aBlock

bindParameterCount

bindParameterIndex: aName

bindParameters: bindings

booleanAt: aColumn 

byteArrayAt: aColumn

changes 

checkOk: aValue

clearBindings 

columnCount

columnNames 

connection: anObject

dataTypeForObject: anObject

dataTypeForObject: anObject ifNone: aBlock

	( anObject isKindOf: Boolean )
		ifTrue: [ ^ #at:putBoolean: ].

	( anObject isKindOf: Integer )
		ifTrue: [ ^ #at:putInteger: ].

	( self isFloatLike: anObject )
		ifTrue: [ ^ #at:putFloat: ].

	( anObject isKindOf: String )
		ifTrue: [ ^ #at:putString: ].

	( anObject isKindOf: ByteArray )
		ifTrue: [ ^ #at:putByteArray: ].

	( anObject isKindOf: DateAndTime )
		ifTrue: [ ^ #at:putDateTime: ].

	( anObject isKindOf: Time )
		ifTrue: [ ^ #at:putTime: ].

	( anObject isKindOf: Date )
		ifTrue: [ ^ #at:putDate: ].

	^ aBlock value!

dataValuesAvailable

dateAt: aColumn
	^ Date readFrom: ( self stringAt: aColumn ) readStream format: 'yyyy-MM-dd'!

dateTimeAt: aColumn	

dbHandle

execute: bindings 

finalize
	"Finalize the statement as required by the SQLite3 API. As per the API, the user is expected to finalize a statement after use.
	Since executing a new statement without having finalized the previous one might cause SQLITE_BUSY errors, we can't rely on the garbage collector to execute the finalization, or we'll be exposed to non-deterministic behaviour."

	handle
		ifNotNil:
			[ "Remove the statement object from its finalization registry. This should happen before the actual finalization to avoid finalizing the statement twice, which might result in 'undefined and undesirable behavior such as segfaults and heap corruption' as per the SQLite3 API"
			handle beUnfinalizable.
			connection finalize: handle.
			handle := nil ].
	^ 0!

floatAt: aColumn

handle

initialize

integerAt: aColumn 

isFloatLike: anObject

isReadOnly 

library 

nameOfColumn: aColumn

nilAt: aColumn

objectAt: aColumn
	^ Object fromBinaryStoreBytes: (self library blobFrom: handle at: aColumn)  !

prepare: anSQLText

reset

sqlText 

step

stepOk: aValue
	(aValue = SQLITE_CONSTRAINT)
		ifTrue:  [ connection signal: SQLite3ConstraintViolation with: aValue].	

stringAt: aColumn	 

timeAt: aColumn
	^ Time fromString: ( self stringAt: aColumn )!

timestampAt: aColumn
	^ DateAndTime fromString: ( self stringAt: aColumn )!

typeOfColumn: aColumn

	"aColumn is a zero-based index"

	^self library typeFor: handle at: aColumn!

valueOfColumn: aColumn
!SQLite3PreparedStatement categoriesForMethods!
at:putBoolean:!bindings!public! !
at:putByteArray:!bindings!public! !
at:putDate:!bindings!public! !
at:putDateTime:!bindings!public! !
at:putFloat:!bindings!public! !
at:putInteger:!bindings!public! !
at:putNil:!bindings!public! !
at:putObject:!bindings!public! !
at:putString:!bindings!public! !
at:putTime:!bindings!public! !
basicExecute:!public! !
bindParameterCount!bindings!public! !
bindParameterIndex:!bindings!public! !
bindParameters:!bindings!public! !
booleanAt:!fetching!public! !
byteArrayAt:!fetching!public! !
changes!public!public / accessing! !
checkOk:!private! !
clearBindings!bindings!public! !
columnCount!public! !
columnNames!public!public / accessing! !
connection:!private / accessing!public! !
dataTypeForObject:!bindings!public! !
dataTypeForObject:ifNone:!bindings!private! !
dataValuesAvailable!public!public / accessing! !
dateAt:!fetching!public! !
dateTimeAt:!fetching!public! !
dbHandle!private / accessing!public! !
execute:!operating!public! !
finalize!initialization!public! !
floatAt:!fetching!public! !
handle!private / accessing!public! !
initialize!initialization!public! !
integerAt:!fetching!public! !
isFloatLike:!private / testing!public! !
isReadOnly!public!public / accessing! !
library!private / accessing!public! !
nameOfColumn:!fetching!public! !
nilAt:!fetching!public! !
objectAt:!fetching!public! !
prepare:!public! !
reset!public! !
sqlText!operating!public! !
step!public! !
stepOk:!private! !
stringAt:!fetching!public! !
timeAt:!fetching!public! !
timestampAt:!fetching!public! !
typeOfColumn:!fetching!public! !
valueOfColumn:!fetching!public! !
!

!SQLite3PreparedStatement class methodsFor!

new
	^super new initialize! !
!SQLite3PreparedStatement class categoriesForMethods!
new!instance creation!public! !
!
