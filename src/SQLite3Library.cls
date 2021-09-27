﻿"Filed out from Dolphin Smallalk"!

ExternalLibrary subclass: #SQLite3Library
	instanceVariableNames: ''
	classVariableNames: 'DataTypeMap DateTimeTypeMap'
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3Library guid: (GUID fromString: '{017d5f4b-e6c5-47bb-b864-2518023d5718}')!
SQLite3Library comment: 'I am the (unified) FFI interface to SQLite.'!
!SQLite3Library categoriesForClass!SQLite3-Core-UFFI! !
!SQLite3Library methodsFor!

apiBackupFinish: backupHandle
	^self invalidCall: _failureCode!

apiBackupPageCount: backupHandle
	^self invalidCall: _failureCode!

apiBackupRemaining: backupHandle

	^self invalidCall: _failureCode!

apiBackupStep:nPage via: backupHandle

	Need to invert the argument order for Dolphin"

apiBackupTo: pDest named: zDestName from: pSource named: zSourceName
	^self invalidCall: _failureCode!

apiBackupVia: backupHandle step: nPage
	^self invalidCall: _failureCode!

apiBindBlob: aStatement atColumn: aColumn with: aByteArray with: anInteger with: aPointer
	"Private - int sqlite3_bind_blob(sqlite3_stmt*, int, const void *, int, void(*)(void*))"

	<stdcall: sdword sqlite3_bind_blob SQLite3StatementExternalObject* sdword lpvoid sdword sdword>
	^self invalidCall: _failureCode!

apiBindDouble: aStatement atColumn: aColumn with: aFloat

	<stdcall: sdword sqlite3_bind_double SQLite3StatementExternalObject* sdword double>
	^self invalidCall: _failureCode!

apiBindInteger: aStatement atColumn: aColumn with: anInteger

	<stdcall: sdword sqlite3_bind_int64 SQLite3StatementExternalObject* sdword sqword>
	^self invalidCall: _failureCode!

apiBindNull: aStatement atColumn: aColumn

	<stdcall: sdword sqlite3_bind_null SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiBindParameterCount: aStatement

	<stdcall: sdword sqlite3_bind_parameter_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiBindParameterIndex: aStatement for: aName

	<stdcall: sdword sqlite3_bind_parameter_index SQLite3StatementExternalObject* lpstr>
	^self invalidCall: _failureCode!

apiBindString: aStatement atColumn: aColumn with: aString with: anInteger with: anotherInteger
	"Private - int sqlite3_bind_text(sqlite3_stmt*, int, const char*, int, void(*)(void*))"

	<stdcall: sdword sqlite3_bind_text SQLite3StatementExternalObject* sdword lpstr sdword sdword>
	^self invalidCall: _failureCode!

apiChanges: aSQLite3DatabaseExternalObject
	^self invalidCall: _failureCode!

apiClearBindings: aStatement

	<stdcall: sdword sqlite3_clear_bindings SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiClose: aSQLite3DatabaseExternalObject
	^self invalidCall: _failureCode!

apiColumnBlob: aStatement atColumn: aColumn
	^self invalidCall: _failureCode!

apiColumnBytes: aStatement atColumn: aColumn

	<stdcall: sdword sqlite3_column_bytes SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnCount: aStatement
	<stdcall: sdword sqlite3_column_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiColumnDeclaredType: aStatement atColumn: aColumn
	<stdcall: lpstr sqlite3_column_decltype SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnDouble: aStatement atColumn: aColumn
	<stdcall: double sqlite3_column_double SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnInt: aStatement atColumn: aColumn

	^self invalidCall: _failureCode!

apiColumnName: aStatement atColumn: aColumn
	<stdcall: lpstr sqlite3_column_name SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnText: aStatement atColumn: aColumn

	"Returns AnsiString based on Utf8 bytes, so may be corrupt"

	^self invalidCall: _failureCode!

apiColumnType: aStatement atColumn: aColumn
	<stdcall: sdword sqlite3_column_type SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnUtf16String: aStatement atColumn: aColumn

	"Returns Utf16String, c.f. apiColumnText:atColumn:"

	^self invalidCall: _failureCode!

apiConfigLoadExtension: dbHandle with: op with: onoff with: retpointer
	<stdcall: sdword sqlite3_db_config SQLite3DatabaseExternalObject* sdword sdword sdword>
	^self invalidCall: _failureCode	

apiDataCount: aStatement
	<stdcall: sdword sqlite3_data_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiDBHandle: statementHandle
	<stdcall: SQLite3DatabaseExternalObject* sqlite3_db_handle SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiErrorMessage: aSQLite3DatabaseExternalObject
	<stdcall: lpstr sqlite3_errmsg SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiExec: dbHandle withSQLText: anSQLText with: callback with: callbackData with: errorMessageBuffer
	<stdcall: sdword sqlite3_exec SQLite3DatabaseExternalObject* lpstr sdword lpvoid lpstr*>
	^self invalidCall: _failureCode!

apiFinalize: aStatement
	<stdcall: sdword sqlite3_finalize SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiGetAutocommit: aSQLite3DatabaseExternalObject
	<stdcall: sdword sqlite3_get_autocommit SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiLastInsertRowid: aSQLite3DatabaseExternalObject
	<stdcall: sqword sqlite3_last_insert_rowid SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiLibVersion
	<stdcall: lpstr sqlite3_libversion>

	^self invalidCall: _failureCode!

apiLoadExtension: dbHandle with: zFile with: zProc with: pzErrMsg
	<stdcall: sdword sqlite3_load_extension SQLite3DatabaseExternalObject* lpstr lpstr lpstr*>
	^self invalidCall: _failureCode	!

apiOpen: filename via: aSQLite3DatabaseExternalObject
	"Private - int sqlite3_open(const char*, sqlite3**)"
	<stdcall: sdword sqlite3_open lpstr SQLite3DatabaseExternalObject**>
	^self invalidCall: _failureCode!

apiOpen: filename  via: aSQLite3DatabaseExternalObject withFlags: flags vfs: vfs
	<stdcall: sdword sqlite3_open_v2 lpstr SQLite3DatabaseExternalObject** sdword lpstr>
	^self invalidCall: _failureCode!

apiPrepare: dbHandle withSQLText: anSQLText with: textSize with: sHandle with: tail

apiReset: aSQLite3StatementExternalObject

	^self invalidCall: _failureCode!

apiSleep: anInteger
	<stdcall: sdword sqlite3_sleep sdword>
	^self invalidCall: _failureCode!

apiSql: aStatement
	<stdcall: lpstr sqlite3_sql SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiStatementReadOnly: aStatement
	<stdcall: sdword sqlite3_stmt_readonly SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiStep: aStatement
	<stdcall: sdword sqlite3_step SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiThreadsafe
	<stdcall: sdword sqlite3_threadsafe>
	^self invalidCall: _failureCode!

apiTotalChanges: aSQLite3DatabaseExternalObject
	<stdcall: sdword sqlite3_total_changes SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiTrace: aSQLite3DatabaseExternalObject with: callback with: appdata
	<stdcall: lpvoid sqlite3_trace SQLite3DatabaseExternalObject* lpvoid ExternalAddress>
	^self invalidCall: _failureCode!

backup: backupHandle step: nPages

backupTo: dstConnection named: dstName from: srcConnection named: srcName

bindParameterCount: aStatementHandle

bindParameterIndex: aStatementHandle for: aName

blobFrom: aStatement at: aColumn

booleanFrom: aStatement at: aColumn

changes: aHandle	

checkForOk: anInteger on: aHandle

clearBindings: sHandle on: dbHandle

close: aHandle	

columnCount: aStatementHandle	

dataValuesAvailable: aStatementHandle

dbHandle: statementHandle

disableLoadExtension: aHandle

enableLoadExtension: aHandle

execute: anSQLText on: aDBHandle

finalize: aStatementHandle on: aDBHandle
	^ self checkForOk: (self apiFinalize: aStatementHandle) on: aDBHandle!

floatFrom: aStatement at: aColumn

getAutoCommit: aHandle

integerFrom: aStatement at: aColumn

lastInsertRowId: dbHandle

library 

libraryVersion

loadExtension: dbHandle with: aFilename

nameFor: aStatement at: aColumn

open: aFilename via: aHandle	

open: aFilename withFlags: flags vfs: vfs via: aHandle	

open: aFilename withFlags: flags via: aHandle	

prepare: aStatementHandle on: aDBHandle with: anSQLText

reset: aStatementHandle

signal: exceptionClass with: value on: aSQLite3ExternalObject

sqlite3ResultFor: anInteger ifNoneMatch: aBlock

sqlText: aStatementHandle	

statementReadOnly: aSQLite3StatementExternalObject

step: aStatementHandle	

stringFrom: aStatement at: aColumn
	^self apiColumnUtf16String: aStatement atColumn: aColumn!

threadsafe

totalChanges: aHandle	

trace: aSQLite3DatabaseExternalObject with: callback with: appdata

typeFor: aStatement at: aColumn
			^DateTimeTypeMap at: declared asLowercase ifAbsent: [ selector ]]].

typeFor: aStatement at: aColumn declaredType: declared
	| selector |

	declared notNil ifTrue: [

with: aStatement at: aColumn putBlob: aByteArray

with: aStatement at: aColumn putFloat: aFloat

with: aStatement at: aColumn putInteger: anInteger

with: aStatement at: aColumn putString: aString

with: aStatement putNullAt: aColumn 
!SQLite3Library categoriesForMethods!
apiBackupFinish:!private!private / api! !
apiBackupPageCount:!private!private / api! !
apiBackupRemaining:!private!private / api! !
apiBackupStep:via:!private!private / api! !
apiBackupTo:named:from:named:!private!private / api! !
apiBackupVia:step:!private!private / api! !
apiBindBlob:atColumn:with:with:with:!private!private / api! !
apiBindDouble:atColumn:with:!private!private / api! !
apiBindInteger:atColumn:with:!private!private / api! !
apiBindNull:atColumn:!private!private / api! !
apiBindParameterCount:!private!private / api! !
apiBindParameterIndex:for:!private!private / api! !
apiBindString:atColumn:with:with:with:!private!private / api! !
apiChanges:!private!private / api! !
apiClearBindings:!private!private / api! !
apiClose:!private!private / api! !
apiColumnBlob:atColumn:!private!private / api! !
apiColumnBytes:atColumn:!private!private / api! !
apiColumnCount:!private!private / api! !
apiColumnDeclaredType:atColumn:!private!private / api! !
apiColumnDouble:atColumn:!private!private / api! !
apiColumnInt:atColumn:!private!private / api! !
apiColumnName:atColumn:!private!private / api! !
apiColumnText:atColumn:!private!private / api! !
apiColumnType:atColumn:!private!private / api! !
apiColumnUtf16String:atColumn:!private!private / api! !
apiConfigLoadExtension:with:with:with:!private!private / api! !
apiDataCount:!private!private / api! !
apiDBHandle:!private!private / api! !
apiErrorMessage:!private!private / api! !
apiExec:withSQLText:with:with:with:!private!private / api! !
apiFinalize:!private!private / api! !
apiGetAutocommit:!private!private / api! !
apiLastInsertRowid:!private!private / api! !
apiLibVersion!private!private / api! !
apiLoadExtension:with:with:with:!private!private / api! !
apiOpen:via:!private!private / api! !
apiOpen:via:withFlags:vfs:!private!private / api! !
apiPrepare:withSQLText:with:with:with:!private!private / api! !
apiReset:!private!private / api! !
apiSleep:!private!private / api! !
apiSql:!private!private / api! !
apiStatementReadOnly:!private!private / api! !
apiStep:!private!private / api! !
apiThreadsafe!private!private / api! !
apiTotalChanges:!private!private / api! !
apiTrace:with:with:!private!private / api! !
backup:step:!operating!public! !
backupTo:named:from:named:!operating!public! !
bindParameterCount:!operating!public! !
bindParameterIndex:for:!operating!public! !
blobFrom:at:!accessing!public! !
booleanFrom:at:!accessing!public! !
changes:!introspection!public! !
checkForOk:on:!private!private / utilities! !
clearBindings:on:!cleaning!public! !
close:!connection handling!public! !
columnCount:!connection handling!public! !
dataValuesAvailable:!accessing!public! !
dbHandle:!connection handling!public! !
disableLoadExtension:!configuring!public! !
enableLoadExtension:!configuring!public! !
execute:on:!operating!public! !
finalize:on:!operating!public! !
floatFrom:at:!accessing!public! !
getAutoCommit:!accessing!public! !
integerFrom:at:!operating!public! !
lastInsertRowId:!accessing!public! !
library!private!private / accessing! !
libraryVersion!accessing!public! !
loadExtension:with:!private / api!public! !
nameFor:at:!accessing!public! !
open:via:!connection handling!public! !
open:withFlags:vfs:via:!accessing!public! !
open:withFlags:via:!accessing!public! !
prepare:on:with:!operating!public! !
reset:!cleaning!public! !
signal:with:on:!private!private / utilities! !
sqlite3ResultFor:ifNoneMatch:!private!private / utilities! !
sqlText:!public!stepping! !
statementReadOnly:!public!stepping! !
step:!public!stepping! !
stringFrom:at:!operating!public! !
threadsafe!public!stepping! !
totalChanges:!introspection!public! !
trace:with:with:!public!tracing! !
typeFor:at:!private!private / utilities! !
typeFor:at:declaredType:!private!private / utilities! !
with:at:putBlob:!operating!public! !
with:at:putFloat:!operating!public! !
with:at:putInteger:!operating!public! !
with:at:putString:!operating!public! !
with:putNullAt:!operating!public! !
!

!SQLite3Library class methodsFor!

booleanSQLFalseWords
	^ #('false' 'f')!

booleanSQLTrueWords
	^ #('true' 't')!

booleanTypes
	^ #('boolean' 'bool')!

current

dateTimeTypes
	^#('datetime' 'date' 'timestamp' 'time')!

fileName
	^ 'sqlite3.dll'!

initialize

	self 
		initializeDataTypeMap;
		initializeDateTimeTypeMap!

initializeDataTypeMap

	DataTypeMap :=#(#integerAt: #floatAt: #stringAt: #byteArrayAt: #nilAt:)!

initializeDateTimeTypeMap
	DateTimeTypeMap := 
		##(Dictionary new 
			at: 'datetime' put: #dateTimeAt:;
			at: 'date' put: #dateAt:;
			at: 'timestamp' put: #timestampAt:;
			at: 'time' put: #timeAt:;
			yourself)! !
!SQLite3Library class categoriesForMethods!
booleanSQLFalseWords!constants!private! !
booleanSQLTrueWords!constants!private! !
booleanTypes!constants!private! !
current!factory!public! !
dateTimeTypes!constants!private! !
fileName!public! !
initialize!initializing!public! !
initializeDataTypeMap!initializing!private! !
initializeDateTimeTypeMap!initializing!private! !
!
