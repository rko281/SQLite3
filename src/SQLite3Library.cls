"Filed out from Dolphin Smallalk"!

ExternalLibrary subclass: #SQLite3Library
	instanceVariableNames: ''
	classVariableNames: 'DataTypeMap DateTimeTypeMap'
	poolDictionaries: 'SQLite3Constants'
	classInstanceVariableNames: ''!
SQLite3Library guid: (GUID fromString: '{017d5f4b-e6c5-47bb-b864-2518023d5718}')!
SQLite3Library comment: 'I am the (unified) FFI interface to SQLite.'!
!SQLite3Library categoriesForClass!SQLite3-Core-UFFI! !
!SQLite3Library methodsFor!

apiBackupFinish: backupHandle	"Private - int sqlite3_backup_finish(sqlite3_backup *p)"	<stdcall: sdword sqlite3_backup_finish SQLite3BackupExternalReference*>
	^self invalidCall: _failureCode!

apiBackupPageCount: backupHandle	"Private - int sqlite3_backup_pagecount(sqlite3_backup *p)"	<stdcall: sdword sqlite3_backup_pagecount SQLite3BackupExternalReference>
	^self invalidCall: _failureCode!

apiBackupRemaining: backupHandle	"Private - int sqlite3_backup_remaining(sqlite3_backup *p)"
	<stdcall: sdword sqlite3_backup_remaining SQLite3BackupExternalReference>
	^self invalidCall: _failureCode!

apiBackupStep:nPage via: backupHandle	"Private - int sqlite3_backup_step(sqlite3_backup *p, int nPage)

	Need to invert the argument order for Dolphin"	 	^ self apiBackupVia: backupHandle step: nPage!

apiBackupTo: pDest named: zDestName from: pSource named: zSourceName	"Private - sqlite3_backup *sqlite3_backup_init(  sqlite3 *pDest,                        /* Destination database handle */  const char *zDestName,                 /* Destination database name */  sqlite3 *pSource,                      /* Source database handle */  const char *zSourceName                /* Source database name */)"	<stdcall: SQLite3BackupExternalReference* sqlite3_backup_init SQLite3DatabaseExternalObject* lpstr SQLite3DatabaseExternalObject* lpstr>
	^self invalidCall: _failureCode!

apiBackupVia: backupHandle step: nPage	"Private - int sqlite3_backup_step(sqlite3_backup *p, int nPage)"	<stdcall: sdword sqlite3_backup_step SQLite3BackupExternalReference* sdword>
	^self invalidCall: _failureCode!

apiBindBlob: aStatement atColumn: aColumn with: aByteArray with: anInteger with: aPointer
	"Private - int sqlite3_bind_blob(sqlite3_stmt*, int, const void *, int, void(*)(void*))"

	<stdcall: sdword sqlite3_bind_blob SQLite3StatementExternalObject* sdword lpvoid sdword sdword>
	^self invalidCall: _failureCode!

apiBindDouble: aStatement atColumn: aColumn with: aFloat	"Private - int sqlite3_bind_double(sqlite3_stmt*, int, double)"

	<stdcall: sdword sqlite3_bind_double SQLite3StatementExternalObject* sdword double>
	^self invalidCall: _failureCode!

apiBindInteger: aStatement atColumn: aColumn with: anInteger	"Private - int sqlite3_bind_int64(sqlite3_stmt*, int, sqlite_int64)"

	<stdcall: sdword sqlite3_bind_int64 SQLite3StatementExternalObject* sdword sqword>
	^self invalidCall: _failureCode!

apiBindNull: aStatement atColumn: aColumn	"Private - int sqlite3_bind_null(sqlite3_stmt*, int)"

	<stdcall: sdword sqlite3_bind_null SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiBindParameterCount: aStatement	"Private - int sqlite3_bind_parameter_count(sqlite3_stmt*)"

	<stdcall: sdword sqlite3_bind_parameter_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiBindParameterIndex: aStatement for: aName	"Private - int sqlite3_bind_parameter_index(sqlite3_stmt*, const char* zName)"

	<stdcall: sdword sqlite3_bind_parameter_index SQLite3StatementExternalObject* lpstr>
	^self invalidCall: _failureCode!

apiBindString: aStatement atColumn: aColumn with: aString with: anInteger with: anotherInteger
	"Private - int sqlite3_bind_text(sqlite3_stmt*, int, const char*, int, void(*)(void*))"

	<stdcall: sdword sqlite3_bind_text SQLite3StatementExternalObject* sdword lpstr sdword sdword>
	^self invalidCall: _failureCode!

apiChanges: aSQLite3DatabaseExternalObject	"Private - int sqlite3_changes(sqlite3*)"	<stdcall: sdword sqlite3_changes SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiClearBindings: aStatement	"Private - int sqlite3_clear_bindings(sqlite3_stmt*)"

	<stdcall: sdword sqlite3_clear_bindings SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiClose: aSQLite3DatabaseExternalObject	"Private - int sqlite3_close(sqlite3*)"	<stdcall: sdword sqlite3_close SQLite3DatabaseExternalObject*> 
	^self invalidCall: _failureCode!

apiColumnBlob: aStatement atColumn: aColumn	"Private - const void *sqlite3_column_blob(sqlite3_stmt*, int)"	<stdcall: lpvoid sqlite3_column_blob SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnBytes: aStatement atColumn: aColumn	"Private - int sqlite3_column_bytes(sqlite3_stmt*, int)"

	<stdcall: sdword sqlite3_column_bytes SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnCount: aStatement	"Private - int sqlite3_column_count(sqlite3_stmt *pStmt)"
	<stdcall: sdword sqlite3_column_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiColumnDeclaredType: aStatement atColumn: aColumn	"Private - const char *sqlite3_column_decltype(sqlite3_stmt*, int)"
	<stdcall: lpstr sqlite3_column_decltype SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnDouble: aStatement atColumn: aColumn	"Private - double sqlite3_column_double(sqlite3_stmt*, int)"
	<stdcall: double sqlite3_column_double SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnInt: aStatement atColumn: aColumn	"Private - int sqlite3_column_int(sqlite3_stmt*, int)"
	<stdcall: sqword sqlite3_column_int64 SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnName: aStatement atColumn: aColumn	"Private - const char *sqlite3_column_name(sqlite3_stmt*, int)"
	<stdcall: lpstr sqlite3_column_name SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnText: aStatement atColumn: aColumn	"Private - const unsigned char *sqlite3_column_text(sqlite3_stmt*, int)"

	"Returns AnsiString based on Utf8 bytes, so may be corrupt"
	<stdcall: lpstr sqlite3_column_text SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnType: aStatement atColumn: aColumn	"Private - int sqlite3_column_type(sqlite3_stmt*, int)"
	<stdcall: sdword sqlite3_column_type SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiColumnUtf16String: aStatement atColumn: aColumn	"Private - const unsigned char *sqlite3_column_text(sqlite3_stmt*, int)"

	"Returns Utf16String, c.f. apiColumnText:atColumn:"
	<stdcall: lpwstr sqlite3_column_text16 SQLite3StatementExternalObject* sdword>
	^self invalidCall: _failureCode!

apiConfigLoadExtension: dbHandle with: op with: onoff with: retpointer	"Private - This is a specific invocation of sqlite3_db_config(sqlite3*, int, ...)."
	<stdcall: sdword sqlite3_db_config SQLite3DatabaseExternalObject* sdword sdword sdword>
	^self invalidCall: _failureCode	"Notes from https://www.sqlite.org/c3ref/c_dbconfig_enable_fkey.html:op == SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSIONThis option is used to enable or disable the sqlite3_load_extension() interface independently of the load_extension() SQL function. The sqlite3_enable_load_extension() API enables or disables both the C-API sqlite3_load_extension() and the SQL function load_extension(). There should be two additional arguments. When the first argument to this interface is 1, then only the C-API is enabled and the SQL function remains disabled. If the first argument to this interface is 0, then both the C-API and the SQL function are disabled. If the first argument is -1, then no changes are made to state of either the C-API or the SQL function. The second parameter is a pointer to an integer into which is written 0 or 1 to indicate whether sqlite3_load_extension() interface is disabled or enabled following this call. The second parameter may be a NULL pointer, in which case the new setting is not reported back. "!

apiDataCount: aStatement	"Private - int sqlite3_data_count(sqlite3_stmt*)"
	<stdcall: sdword sqlite3_data_count SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiDBHandle: statementHandle	"Private - sqlite3 *sqlite3_db_handle(sqlite3_stmt*);"
	<stdcall: SQLite3DatabaseExternalObject* sqlite3_db_handle SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiErrorMessage: aSQLite3DatabaseExternalObject	"Private - const char *sqlite3_errmsg(sqlite3*)"
	<stdcall: lpstr sqlite3_errmsg SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiExec: dbHandle withSQLText: anSQLText with: callback with: callbackData with: errorMessageBuffer	"Private - int sqlite3_exec(sqlite3*, const char*, int (*callback), void*, char **)"
	<stdcall: sdword sqlite3_exec SQLite3DatabaseExternalObject* lpstr sdword lpvoid lpstr*>
	^self invalidCall: _failureCode!

apiFinalize: aStatement	"Private - int sqlite3_finalize(sqlite3_stmt*)"	 
	<stdcall: sdword sqlite3_finalize SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiGetAutocommit: aSQLite3DatabaseExternalObject	"Private - int sqlite3_get_autocommit(sqlite3*);"
	<stdcall: sdword sqlite3_get_autocommit SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiLastInsertRowid: aSQLite3DatabaseExternalObject	"Private - sqlite3_int64 sqlite3_last_insert_rowid(sqlite3*)"
	<stdcall: sqword sqlite3_last_insert_rowid SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiLibVersion	"Private - const char *sqlite3_libversion(void)"
	<stdcall: lpstr sqlite3_libversion>

	^self invalidCall: _failureCode!

apiLoadExtension: dbHandle with: zFile with: zProc with: pzErrMsg	"Private - int sqlite3_load_extension(sqlite3*, const char*, const char*, char **)."
	<stdcall: sdword sqlite3_load_extension SQLite3DatabaseExternalObject* lpstr lpstr lpstr*>
	^self invalidCall: _failureCode	!

apiOpen: filename via: aSQLite3DatabaseExternalObject
	"Private - int sqlite3_open(const char*, sqlite3**)"
	<stdcall: sdword sqlite3_open lpstr SQLite3DatabaseExternalObject**>
	^self invalidCall: _failureCode!

apiOpen: filename  via: aSQLite3DatabaseExternalObject withFlags: flags vfs: vfs	"Private - int sqlite3_open_v2(  const char *filename,   /* Database filename (UTF-8) */  sqlite3 **ppDb,         /* OUT: SQLite db handle */  int flags,              /* Flags */  const char *zVfs        /* Name of VFS module to use */)"
	<stdcall: sdword sqlite3_open_v2 lpstr SQLite3DatabaseExternalObject** sdword lpstr>
	^self invalidCall: _failureCode!

apiPrepare: dbHandle withSQLText: anSQLText with: textSize with: sHandle with: tail	"Private - int sqlite3_prepare_v2(sqlite3*, const char*, int, sqlite3_stmt**, const char **)"	<stdcall: sdword sqlite3_prepare_v2 SQLite3DatabaseExternalObject* lpstr sdword SQLite3StatementExternalObject** lpstr*>	^self invalidCall: _failureCode!

apiReset: aSQLite3StatementExternalObject	"Private - int sqlite3_reset(sqlite3_stmt*)"
	<stdcall: sdword sqlite3_reset SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiSleep: anInteger	"Private - int sqlite3_sleep(int)"
	<stdcall: sdword sqlite3_sleep sdword>
	^self invalidCall: _failureCode!

apiSql: aStatement	"Private - const char *sqlite3_sql(sqlite3_stmt*)"
	<stdcall: lpstr sqlite3_sql SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiStatementReadOnly: aStatement	"Private - int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)"
	<stdcall: sdword sqlite3_stmt_readonly SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiStep: aStatement	"Private - int sqlite3_step(sqlite3_stmt*)"
	<stdcall: sdword sqlite3_step SQLite3StatementExternalObject*>
	^self invalidCall: _failureCode!

apiThreadsafe	"Private - int sqlite3_threadsafe(void)"
	<stdcall: sdword sqlite3_threadsafe>
	^self invalidCall: _failureCode!

apiTotalChanges: aSQLite3DatabaseExternalObject	"Private - int sqlite3_total_changes(sqlite3*)"
	<stdcall: sdword sqlite3_total_changes SQLite3DatabaseExternalObject*>
	^self invalidCall: _failureCode!

apiTrace: aSQLite3DatabaseExternalObject with: callback with: appdata"	^ self ffiCall: #(void* sqlite3_trace (sqlite3* handle, FFICallback callback, ExternalAddress appdata)) "
	<stdcall: lpvoid sqlite3_trace SQLite3DatabaseExternalObject* lpvoid ExternalAddress>
	^self invalidCall: _failureCode!

backup: backupHandle step: nPages	^self apiBackupStep: nPages via: backupHandle!

backupTo: dstConnection named: dstName from: srcConnection named: srcName	^self apiBackupTo: dstConnection named: dstName from: srcConnection named: srcName!

bindParameterCount: aStatementHandle	^ self apiBindParameterCount: aStatementHandle!

bindParameterIndex: aStatementHandle for: aName	^ self apiBindParameterIndex: aStatementHandle for: aName	!

blobFrom: aStatement at: aColumn	| address size array |		address := self apiColumnBlob: aStatement atColumn: aColumn.	size := self apiColumnBytes: aStatement atColumn: aColumn.	array := address copyFrom: 1 to: size.	^array 	 !

booleanFrom: aStatement at: aColumn	| declared selector value |		declared := self apiColumnDeclaredType: aStatement atColumn: aColumn.	(self class booleanTypes includes: declared asLowercase) ifFalse: [ 		SQLite3AbstractError signal: 'Column is not declared as a boolean.' ].	selector := DataTypeMap at: (self apiColumnType: aStatement atColumn: aColumn).	(selector = #nilAt:) ifTrue: [ ^ nil ].	(selector = #stringAt:) 		ifTrue: [			value := self apiColumnText: aStatement atColumn: aColumn.			(self class booleanSQLTrueWords includes: value asLowercase) 				ifTrue: [ ^ true ]				ifFalse: [					(self class booleanSQLFalseWords includes: value asLowercase)						ifTrue: [ ^ false ]						ifFalse: [ SQLite3AbstractError signal: 'Column value cannot be read as a boolean.' ]]].	(selector = #integerAt:) 		ifTrue: [			value := self apiColumnInt: aStatement atColumn: aColumn.			(value = 1)				ifTrue: [ ^ true ]				ifFalse: [ 					(value = 0) 						ifTrue: [ ^ false ]						ifFalse: [ SQLite3AbstractError signal: 'Column value cannot be read as a boolean.' ]]]	  !

changes: aHandle		^ self apiChanges: aHandle	!

checkForOk: anInteger on: aHandle	^ self sqlite3ResultFor: anInteger ifNoneMatch: [ :exc | exc resignalAs: (SQLite3NativeError forNativeErrorCode: anInteger messageText: (self apiErrorMessage: aHandle))]	!

clearBindings: sHandle on: dbHandle		^ self checkForOk: (self apiClearBindings: sHandle) on: dbHandle	!

close: aHandle		^ self apiClose: aHandle!

columnCount: aStatementHandle		^ self apiColumnCount: aStatementHandle!

dataValuesAvailable: aStatementHandle	^ self apiDataCount: aStatementHandle	!

dbHandle: statementHandle	^self apiDBHandle: statementHandle!

disableLoadExtension: aHandle	^ self checkForOk: (self apiConfigLoadExtension: aHandle with: 1005 with: 0 with: ExternalAddress new) 		on: aHandle		"Magic number 1005 = SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION.See comment in #apiConfigLoadExtension:with:with:with:."!

enableLoadExtension: aHandle	^ self checkForOk: (self apiConfigLoadExtension: aHandle with: 1005 with: 1 with: ExternalAddress new) 		on: aHandle		"Magic number 1005 = SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION.See comment in #apiConfigLoadExtension:with:with:with:."!

execute: anSQLText on: aDBHandle	| null |		null := ExternalAddress new.	^ self checkForOk: (self apiExec: aDBHandle 							withSQLText: anSQLText							with: null							with: null							with: null)		 on: aDBHandle	!

finalize: aStatementHandle on: aDBHandle
	^ self checkForOk: (self apiFinalize: aStatementHandle) on: aDBHandle!

floatFrom: aStatement at: aColumn	^ self apiColumnDouble: aStatement atColumn: aColumn!

getAutoCommit: aHandle	^ (self apiGetAutocommit: aHandle) ~= 0!

integerFrom: aStatement at: aColumn	^ self apiColumnInt: aStatement atColumn: aColumn!

lastInsertRowId: dbHandle	^ self apiLastInsertRowid: dbHandle!

library 	^##(self) fileName!

libraryVersion	"See http://sqlite.org/c3ref/libversion.html"	^self apiLibVersion !

loadExtension: dbHandle with: aFilename	^ self checkForOk: (self apiLoadExtension: dbHandle 										with: aFilename										with: ExternalAddress new										with: ExternalAddress new)		on: dbHandle!

nameFor: aStatement at: aColumn	^ self apiColumnName: aStatement atColumn: aColumn!

open: aFilename via: aHandle		^ self checkForOk: (self apiOpen: aFilename via: aHandle) on: aHandle!

open: aFilename withFlags: flags vfs: vfs via: aHandle		^ self checkForOk: (self apiOpen: aFilename via: aHandle withFlags: flags vfs: vfs) on: aHandle!

open: aFilename withFlags: flags via: aHandle		^ self checkForOk: (self apiOpen: aFilename via: aHandle withFlags: flags vfs: nil ) on: aHandle!

prepare: aStatementHandle on: aDBHandle with: anSQLText	^ self checkForOk: (self apiPrepare: aDBHandle 							withSQLText: anSQLText							with: anSQLText size							with: aStatementHandle							with: (ExternalAddress new))		 on: aDBHandle	!

reset: aStatementHandle		^ aStatementHandle 		ifNil: [ 0 ]		ifNotNil: [ self apiReset: aStatementHandle ]	!

signal: exceptionClass with: value on: aSQLite3ExternalObject	(exceptionClass new)		resultCode: value; 		signal: (self apiErrorMessage: aSQLite3ExternalObject)!

sqlite3ResultFor: anInteger ifNoneMatch: aBlock	^[ 		SQLite3Result forNativeResultCode: anInteger	] on: NotFoundError do: aBlock!

sqlText: aStatementHandle		^ self apiSql: aStatementHandle	!

statementReadOnly: aSQLite3StatementExternalObject	"int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)"	^((self apiStatementReadOnly: aSQLite3StatementExternalObject) = 0) not!

step: aStatementHandle		^ self apiStep: aStatementHandle	!

stringFrom: aStatement at: aColumn
	^self apiColumnUtf16String: aStatement atColumn: aColumn!

threadsafe	"http://sqlite.org/c3ref/threadsafe.html"	^self apiThreadsafe 	!

totalChanges: aHandle		^ self apiTotalChanges: aHandle	!

trace: aSQLite3DatabaseExternalObject with: callback with: appdata	^ self apiTrace: aSQLite3DatabaseExternalObject with: callback with: appdata!

typeFor: aStatement at: aColumn	| selector declared |		declared := (self apiColumnDeclaredType: aStatement atColumn: aColumn).	declared notNil ifTrue: [		"Handle column type of boolean as a special case."		(self class booleanTypes includes: declared) ifTrue: [ ^ #booleanAt: ]].		selector := DataTypeMap at: (self apiColumnType: aStatement atColumn: aColumn).	(selector = #stringAt:) ifTrue: [		declared notNil ifTrue: [ 			"Handle column type of date/time as a special case."
			^DateTimeTypeMap at: declared asLowercase ifAbsent: [ selector ]]].	^ selector!

typeFor: aStatement at: aColumn declaredType: declared	
	| selector |

	declared notNil ifTrue: [		"Handle column type of boolean as a special case."		(self class booleanTypes includes: declared) ifTrue: [ ^ #booleanAt: ]].		selector := DataTypeMap at: (self apiColumnType: aStatement atColumn: aColumn).	(selector = #stringAt:) ifTrue: [		declared notNil ifTrue: [ 			"Handle column type of date/time as a special case."			(self class dateTimeTypes includes: declared) ifTrue: [ ^ #dateTimeAt: ]]].	^ selector!

with: aStatement at: aColumn putBlob: aByteArray	^ self apiBindBlob: aStatement atColumn: aColumn with: aByteArray with: aByteArray size with: -1 !

with: aStatement at: aColumn putFloat: aFloat	^ self apiBindDouble: aStatement atColumn: aColumn with: aFloat!

with: aStatement at: aColumn putInteger: anInteger	^ self apiBindInteger: aStatement atColumn: aColumn with: anInteger   !

with: aStatement at: aColumn putString: aString	^self apiBindString: aStatement atColumn: aColumn with: aString with: aString size with: -1!

with: aStatement putNullAt: aColumn 	^ self apiBindNull: aStatement atColumn: aColumn! !
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

current	^self default!

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

