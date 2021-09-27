"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3BaseConnection
	instanceVariableNames: 'dbFilename dbHandle isOpen library statementClass'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3BaseConnection guid: (GUID fromString: '{23c112b5-fbc5-4b31-8044-a13ba835a8f9}')!
SQLite3BaseConnection comment: 'I represent a connection to an SQLite database. I provide a thin wrapper over the SQLite C API.'!
!SQLite3BaseConnection categoriesForClass!SQLite3-Core-Connections! !
!SQLite3BaseConnection methodsFor!

backupDatabaseNamed: sName to: aConnection named: dName	"database name is either 'main' or 'temp' or the name given to ATTACH DATABASE	See article at https://www.oreilly.com/library/view/using-sqlite/9781449394592/re225.html"	^SQLite3Backup to: aConnection handle named: dName from: dbHandle named: sName!

backupTo: aConnection	^self backupTo: aConnection named: 'main'!

backupTo: aConnection named: aName	^SQLite3Backup to: aConnection handle named: aName from: dbHandle named: 'main'!

basicExecute: anSQLText 	^ (self prepare: anSQLText) step; finalize"20190302, pierce: This used to invoke sqlite3_exec() which is an SQLite-internal convenience wrapper around prepare/step/finalize. It is now rewritten as seen to handle UTF8-encoded input properly. Rewriting this method breaks the Bobby Tables test which relies on naive SQL string construction to work."	!

beginTransaction	^ self basicExecute: 'begin'	!

changes	^ library changes: dbHandle!

clearBindings: aStatement	library clearBindings: aStatement handle on: dbHandle	!

close	dbHandle ifNotNil: 
		[dbHandle beUnfinalizable.
		library close: dbHandle ].	dbHandle := nil.	isOpen := false.!

columnNamesFor: aTableName		self isOpen		ifFalse: [ SQLite3NotOpen signal ]		ifTrue: [ 			| s tableExists |			s := self prepare: 'select count(*) from sqlite_master where type = "table" and tbl_name = ?'.			s at: 1 putString: aTableName.	  		s basicExecute: [ :row | tableExists := ((row integerAt: 0) = 1) ].	  		s finalize.			tableExists ifTrue: [ 				| columns |				columns := OrderedCollection new.				s := self prepare: 'pragma table_info(', aTableName, ')'.				s basicExecute: [ :row | columns add: (row stringAt: 1) ].				s finalize.				^ columns ].			^ nil ]		!

commitTransaction	^ self basicExecute: 'commit'	!

declaredColumnTypesFor: aTableName		self isOpen		ifFalse: [ SQLite3NotOpen signal ]		ifTrue: [ 			| s tableExists |			s := self prepare: 'select count(*) from sqlite_master where type = "table" and tbl_name = ?'.			s at: 1 putString: aTableName.	  		s basicExecute: [ :row | tableExists := ((row integerAt: 0) = 1) ].	  		s finalize.			tableExists ifTrue: [ 				| columns |				columns := OrderedCollection new.				s := self prepare: 'pragma table_info(', aTableName, ')'.				s basicExecute: [ :row | columns add: (row stringAt: 2) ].				s finalize.				^ columns ].			^ nil ]		!

disableExtensions	^ library disableLoadExtension: dbHandle !

enableExtensions	^ library enableLoadExtension: dbHandle !

filename	^ dbFilename !

finalize: aStatementHandle
	library finalize: aStatementHandle on: dbHandle!

getAutoCommit	^library getAutoCommit: dbHandle!

handle	^dbHandle!

initialize	super initialize.	isOpen := false.	library := SQLite3Library current.	dbHandle := SQLite3DatabaseExternalObject new.	dbHandle beFinalizable.	statementClass := SQLite3PreparedStatement.	!

isOpen	^ isOpen!

loadExtension: aFilename	^ library loadExtension: dbHandle with: aFilename !

on: aFilename	dbFilename := aFilename.	^ self!

open

	"Allow reopening"
	dbHandle isNil ifTrue: [self initialize].
	library open: dbFilename via: dbHandle.	isOpen := true!

prepare: anSQLText 	| s |		s := self statementClass new.	s connection: self.	s prepare: anSQLText.	^ s	!

reset: aStatement 	^library reset: aStatement handle	!

rollbackTransaction	^ self basicExecute: 'rollback'	!

signal: exceptionClass with: value	library signal: exceptionClass with: value on: dbHandle!

statementClass	^ statementClass!

tableNames	| tables s |		self isOpen		ifFalse: [ SQLite3NotOpen signal ]		ifTrue: [ 			tables := OrderedCollection new.			s := self prepare: 'select tbl_name from sqlite_master where type = "table"'.	  		s basicExecute: [ :row |				(row dataValuesAvailable > 0) ifTrue: [ tables add: (row stringAt: 0) ]].	  		s finalize.			^ tables ]!

totalChanges	^ library totalChanges: dbHandle!

traceUsing: callback with: appdata	library trace: dbHandle with: callback with: appdata	! !
!SQLite3BaseConnection categoriesForMethods!
backupDatabaseNamed:to:named:!public!public API / backups! !
backupTo:!public!public API / backups! !
backupTo:named:!public!public API / backups! !
basicExecute:!public!public API / operating! !
beginTransaction!public!public API / transactional! !
changes!public!public API / introspection! !
clearBindings:!public!public API / operating! !
close!public!public API / open/close! !
columnNamesFor:!public!public API / introspection! !
commitTransaction!public!public API / transactional! !
declaredColumnTypesFor:!public!public API / introspection! !
disableExtensions!public!public API / extensions! !
enableExtensions!public!public API / extensions! !
filename!accessing!public! !
finalize:!public!public API / operating! !
getAutoCommit!public!public API / introspection! !
handle!accessing!public! !
initialize!initialization!public! !
isOpen!public!testing! !
loadExtension:!public!public API / extensions! !
on:!private! !
open!public!public API / open/close! !
prepare:!public!public API / operating! !
reset:!public!public API / cleaning! !
rollbackTransaction!public!public API / transactional! !
signal:with:!private! !
statementClass!accessing!public! !
tableNames!public!public API / introspection! !
totalChanges!public!public API / introspection! !
traceUsing:with:!public!public API / tracing! !
!

!SQLite3BaseConnection class methodsFor!

libraryVersion	"Native Library Version http://sqlite.org/c3ref/libversion.html sqlite3_libversion"	^SQLite3Library current apiLibVersion !

memory	^self on: ':memory:'!

new
	^super new initialize!

on: aFilename	^(self new) 		on: aFilename;		yourself!

openOn: aFilename	^(self new) 		on: aFilename; 		open; 		yourself!

threadsafe	"Native Library Version http://sqlite.org/c3ref/libversion.html sqlite3_libversion"	^SQLite3Library current threadsafe ~= 0 ! !
!SQLite3BaseConnection class categoriesForMethods!
libraryVersion!instance creation!public! !
memory!examples!public! !
new!instance creation!public! !
on:!instance creation!public! !
openOn:!instance creation!public! !
threadsafe!instance creation!public! !
!

