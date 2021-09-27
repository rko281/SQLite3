﻿"Filed out from Dolphin Smallalk"!

Object subclass: #SQLite3BaseConnection
	instanceVariableNames: 'dbFilename dbHandle isOpen library statementClass'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SQLite3BaseConnection guid: (GUID fromString: '{23c112b5-fbc5-4b31-8044-a13ba835a8f9}')!
SQLite3BaseConnection comment: 'I represent a connection to an SQLite database. I provide a thin wrapper over the SQLite C API.'!
!SQLite3BaseConnection categoriesForClass!SQLite3-Core-Connections! !
!SQLite3BaseConnection methodsFor!

backupDatabaseNamed: sName to: aConnection named: dName

backupTo: aConnection

backupTo: aConnection named: aName

basicExecute: anSQLText 

beginTransaction

changes

clearBindings: aStatement

close
		[dbHandle beUnfinalizable.
		library close: dbHandle ].

columnNamesFor: aTableName

commitTransaction

declaredColumnTypesFor: aTableName

disableExtensions

enableExtensions

filename

finalize: aStatementHandle
	library finalize: aStatementHandle on: dbHandle!

getAutoCommit

handle

initialize

isOpen

loadExtension: aFilename

on: aFilename

open

	"Allow reopening"
	dbHandle isNil ifTrue: [self initialize].


prepare: anSQLText 

reset: aStatement 

rollbackTransaction

signal: exceptionClass with: value

statementClass

tableNames

totalChanges

traceUsing: callback with: appdata
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

libraryVersion

memory

new
	^super new initialize!

on: aFilename

openOn: aFilename

threadsafe
!SQLite3BaseConnection class categoriesForMethods!
libraryVersion!instance creation!public! !
memory!examples!public! !
new!instance creation!public! !
on:!instance creation!public! !
openOn:!instance creation!public! !
threadsafe!instance creation!public! !
!
