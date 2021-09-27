"Filed out from Dolphin Smallalk"!

TestCase subclass: #SQLite3RowTest
	instanceVariableNames: 'filledRow emptyRow'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3RowTest guid: (GUID fromString: '{6ba029a6-be7d-47e9-a7a3-f31e4affedf3}')!
SQLite3RowTest comment: ''!
!SQLite3RowTest categoriesForClass!SQLite3-Core-Tests-Database! !
!SQLite3RowTest methodsFor!

setUp	super setUp.	emptyRow := SQLite3Row new.	filledRow := SQLite3Row new columnNames: {'foo'. 'bar'. 'pi'}; yourself.	filledRow		at: 'foo' put: 1;		at: 'bar' put: true;		at: 'pi' put: '3.14'!

testAsArray	self assert: emptyRow asArray equals: #().		self assert: filledRow asArray equals: #(1 true '3.14')!

testAsDictionary	| dict  |	dict := Dictionary new.	dict at: 'foo' put: 1.	dict at: 'bar' put: true.	dict at: 'pi' put: '3.14'.		self assert: emptyRow asDictionary equals: Dictionary new.		self assert: filledRow asDictionary equals: dict!

testColumnAccessingIfAbsent	|blockExecutedFlag|	blockExecutedFlag := false.		filledRow at: 'foo' ifAbsent: [ blockExecutedFlag := true ].		self deny: blockExecutedFlag.		filledRow at: 'nope' ifAbsent: [ blockExecutedFlag := true ].		self assert: blockExecutedFlag.!

testColumnAccessingOnEmptyRow	self assert: (emptyRow at: 'foo') equals: nil!

testColumnAccessingOnFilledRow	self assert: (filledRow at: 'foo') equals: 1.	self assert: (filledRow at: 'bar') equals: true.	self assert: (filledRow at: 'pi') equals: '3.14'.		self assert: (filledRow at: 'nope') equals: nil!

testColumnNamesOnEmptyRow	self assert: emptyRow columnNames equals: #()!

testColumnNamesOnFilledRow			self assert: filledRow columnNames equals: #('foo' 'bar' 'pi')!

testColumnPuttingOnEmptyRow 	self assert: (emptyRow at: 'foo') equals: nil.		emptyRow at: 'foo' put: 42.		self assert: (emptyRow at: 'foo') equals: 42.!

testColumnPuttingOnFilledRow 	self assert: (filledRow at: 'foo') equals: 1.		filledRow at: 'foo' put: 2.		self assert: (filledRow at: 'foo') equals: 2! !
!SQLite3RowTest categoriesForMethods!
setUp!public!running! !
testAsArray!public!tests! !
testAsDictionary!public!tests! !
testColumnAccessingIfAbsent!public!tests! !
testColumnAccessingOnEmptyRow!public!tests! !
testColumnAccessingOnFilledRow!public!tests! !
testColumnNamesOnEmptyRow!public!tests! !
testColumnNamesOnFilledRow!public!tests! !
testColumnPuttingOnEmptyRow!public!tests! !
testColumnPuttingOnFilledRow!public!tests! !
!

