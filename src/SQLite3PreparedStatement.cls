"Filed out from Dolphin Smalltalk"!

Object subclass: #SQLite3PreparedStatement
	instanceVariableNames: 'connection handle changes columnNames columnDeclaredTypes library'
	classVariableNames: ''
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3PreparedStatement guid: (GUID fromString: '{bd7392e9-0869-42a6-b979-d7e82dc6f6a2}')!
SQLite3PreparedStatement comment: 'I represent an SQLite prepared statement.'!
!SQLite3PreparedStatement categoriesForClass!SQLite3-Core-Database! !
!SQLite3PreparedStatement methodsFor!

at: aColumn putBoolean: aBoolean	^ self library 		with: handle 		at: aColumn 		putInteger: (aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ])		"See http://www.sqlite.org/datatype3.html."!

at: aColumn putByteArray: anObject	^ self library with: handle at: aColumn putBlob: anObject!

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

	^ self library with: handle at: aColumn putFloat: aFloat!

at: aColumn putInteger: anInteger	^ self library with: handle at: aColumn putInteger: anInteger!

at: aColumn putNil: anObject	"Goofy interface note - anObject is ignored here."	"When used by SQLite3Connection, anObject will always be nil."	^ self library with: handle putNullAt: aColumn!

at: aColumn putObject: anObject
	^ self library with: handle at: aColumn putBlob: anObject binaryStoreBytes!

at: aColumn putScaledDecimal: aScaledDecimal

	^self at: aColumn putString: aScaledDecimal displayString!

at: aColumn putString: aString	^ self library with: handle at: aColumn putString: aString!

at: aColumn putTime: aTime

	| string |

	string := SQLite3DateTimeString streamContents: [ :stream | aTime printOn: stream ].
	^ self library with: handle at: aColumn putString: string!

basicExecute: aBlock	| ret |		ret := self step. 	(ret = SQLITE_DONE) " == SQLITE_DONE, meaning step should not be sent again."		ifTrue: [ aBlock value: self ]		ifFalse: [			[ ret = SQLITE_ROW ] whileTrue: [ " == SQLITE_ROW, meaning another row is available."				aBlock value: self.				ret := self step ]]!

bindParameterCount	^ self library bindParameterCount: handle!

bindParameterIndex: aName	^ self library bindParameterIndex: handle for: aName!

bindParameters: bindings	"A 'variable' or 'parameter' token specifies a placeholder in the expression for a value that is filled in at runtime using the sqlite3_bind() family of C/C++ interfaces. Parameters can take several forms:?NNN		A question mark followed by a number NNN holds a spot for the NNN-th parameter. NNN must be between 1 and SQLITE_MAX_VARIABLE_NUMBER.?		A question mark that is not followed by a number creates a parameter with a number one greater than the largest parameter number already assigned. If this means the parameter number is greater than SQLITE_MAX_VARIABLE_NUMBER, it is an error. This parameter format is provided for compatibility with other database engines. But because it is easy to miscount the question marks, the use of this parameter format is discouraged. Programmers are encouraged to use one of the symbolic formats below or the ?NNN format above instead.:AAAA		A colon followed by an identifier name holds a spot for a named parameter with the name :AAAA. Named parameters are also numbered. The number assigned is one greater than the largest parameter number already assigned. If this means the parameter would be assigned a number greater than SQLITE_MAX_VARIABLE_NUMBER, it is an error. To avoid confusion, it is best to avoid mixing named and numbered parameters.@AAAA		An 'at' sign works exactly like a colon, except that the name of the parameter created is @AAAA.$AAAA		A dollar-sign followed by an identifier name also holds a spot for a named parameter with the name $AAAA. The identifier name in this case can include one or more occurrences of '::' and a suffix enclosed in '(...)' containing any text at all. This syntax is the form of a variable name in the Tcl programming language. The presence of this syntax results from the fact that SQLite is really a Tcl extension that has escaped into the wild.Parameters that are not assigned values using sqlite3_bind() are treated as NULL. The sqlite3_bind_parameter_index() interface can be used to translate a symbolic parameter name into its equivalent numeric index."	((bindings isKindOf: Collection) and: [ bindings isString not ])		ifFalse: [ SQLite3AbstractError				signal: 'Unable to execute SQL on instance of ' , bindings class displayString ].				bindings		keysAndValuesDo: [ :k :v | 			| idx |			k isInteger				ifTrue: [ idx := k ]				ifFalse: [ idx := self bindParameterIndex: k.					idx = 0						ifTrue: [ idx := self bindParameterIndex: '@' , k ].					idx = 0						ifTrue: [ idx := self bindParameterIndex: ':' , k ].					idx = 0						ifTrue: [ idx := self bindParameterIndex: '$' , k ].					(idx = 0 and: [ k allSatisfy: [ :char | char isDigit] ])						ifTrue: [ idx := k asInteger ] ].			idx > 0				ifTrue: [ v sqliteBindTo: self at: idx ] ]!

booleanAt: aColumn 	^self library booleanFrom: handle at: aColumn!

byteArrayAt: aColumn	^ self library blobFrom: handle at: aColumn!

changes 	^changes ifNil: [ changes := 0 ]!

checkOk: aValue	"These are normal conditions."		aValue = SQLITE_OK ifTrue: [ ^aValue ].		"These are error conditions."	(aValue = SQLITE_BUSY)		ifTrue: [ connection signal: SQLite3Busy with: aValue ].	(aValue = SQLITE_MISUSE)		ifTrue: [ connection signal: SQLite3Misuse with: aValue ].					"Catch any error not specifically handled above."	connection signal: SQLite3AbstractError with: aValue!

clearBindings 	^self library clearBindings: handle on: connection handle!

columnCount	^self library columnCount: handle!

columnDeclaredTypes	^columnDeclaredTypes ifNil: [columnDeclaredTypes := Array new: self columnCount]!

columnNames 	^columnNames ifNil: [ 		columnNames := Array new: self columnCount.		(1 to: columnNames size) do: [ :c | columnNames at: c put: (self nameOfColumn: c - 1) ].		columnNames	].!

connection: anObject	connection := anObject!

dataValuesAvailable	^self library dataValuesAvailable: handle!

dateAt: aColumn
	^ Date readFrom: ( self stringAt: aColumn ) readStream format: 'yyyy-MM-dd'!

dateTimeAt: aColumn		^ DateAndTime fromString: ( self stringAt: aColumn )!

dbHandle	^(self library dbHandle: handle) !

declaredTypeOfColumn: aColumn

	"aColumn is a zero-based index"

	^(self columnDeclaredTypes at: aColumn + 1) ifNil: 
		[columnDeclaredTypes at: aColumn + 1 put: 
			((self library apiColumnDeclaredType: handle atColumn: aColumn) 
				ifNil: [#undefined]
				ifNotNil: [ :type | type isEmpty ifTrue: [#undeclared] ifFalse: [type]])]!

execute: bindings 	| result |	self checkOk: self reset.	self clearBindings.	self bindParameters: bindings. 	result := self step.	changes := connection changes.	^SQLite3Cursor on: self!

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

floatAt: aColumn	^self library floatFrom: handle at: aColumn!

handle	^ handle!

initialize	super initialize.	handle := SQLite3StatementExternalObject new.	handle beFinalizable.
	library := SQLite3Library default!

integerAt: aColumn 	^self library integerFrom: handle at: aColumn!

integerBooleanAt: aColumn 	^self library integerBooleanFrom: handle at: aColumn!

isReadOnly 	^self library statementReadOnly: handle!

library 	^library!

nameOfColumn: aColumn	^ self library nameFor: handle at: aColumn!

nilAt: aColumn	^ nil  !

objectAt: aColumn
	^ Object fromBinaryStoreBytes: (self library blobFrom: handle at: aColumn)  !

prepare: anSQLText	self library prepare: handle on: connection handle with: anSQLText.!

reset	^connection reset: self!

sqlText 	^ self library sqlText: handle!

step	^ self stepOk: (self library step: handle)!

stepOk: aValue	"These are normal conditions."		(aValue = SQLITE_ROW or: [aValue = SQLITE_DONE]) ifTrue: [		changes := connection changes.		^aValue  ].	"These are error conditions."	(aValue = SQLITE_BUSY)		ifTrue: [ connection signal: SQLite3Busy with: aValue ].	(aValue = SQLITE_MISUSE)		ifTrue: [ connection signal: SQLite3Misuse with: aValue ].
	(aValue = SQLITE_CONSTRAINT)
		ifTrue:  [ connection signal: SQLite3ConstraintViolation with: aValue].		"Catch any error not specifically handled above."	connection signal: SQLite3AbstractError with: aValue!

stringAt: aColumn	 	^ self library stringFrom: handle at: aColumn!

stringBooleanAt: aColumn 	^self library stringBooleanFrom: handle at: aColumn!

timeAt: aColumn
	^ Time fromString: ( self stringAt: aColumn )!

timestampAt: aColumn
	^ DateAndTime fromString: ( self stringAt: aColumn )!

typeOfColumn: aColumn

	"aColumn is a zero-based index"

	^self library typeFor: self at: aColumn!

valueOfColumn: aColumn	^ self perform: (self typeOfColumn: aColumn) with: aColumn! !
!SQLite3PreparedStatement categoriesForMethods!
at:putBoolean:!bindings!public! !
at:putByteArray:!bindings!public! !
at:putDate:!bindings!public! !
at:putDateTime:!bindings!public! !
at:putFloat:!bindings!public! !
at:putInteger:!bindings!public! !
at:putNil:!bindings!public! !
at:putObject:!bindings!public! !
at:putScaledDecimal:!bindings!public! !
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
columnDeclaredTypes!public!public / accessing! !
columnNames!public!public / accessing! !
connection:!private / accessing!public! !
dataValuesAvailable!public!public / accessing! !
dateAt:!fetching!public! !
dateTimeAt:!fetching!public! !
dbHandle!private / accessing!public! !
declaredTypeOfColumn:!fetching!public! !
execute:!operating!public! !
finalize!initialization!public! !
floatAt:!fetching!public! !
handle!private / accessing!public! !
initialize!initialization!public! !
integerAt:!fetching!public! !
integerBooleanAt:!fetching!public! !
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
stringBooleanAt:!fetching!public! !
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

