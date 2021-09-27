### SQLite3
Native (non-ODBC) [SQLite3](https://www.sqlite.org) database binding for [Dolphin Smalltalk](https://github.com/dolphinsmalltalk).

Based on [Pharo-SQLite3](https://github.com/pharo-rdbms/Pharo-SQLite3) - refer here for further info and documentation.

## Getting Started
* Install [Dolphin Smalltalk 7.1](https://github.com/dolphinsmalltalk/Dolphin)
* Ensure the 32-bit `sqlite3.dll` is available on your system path (download [here](https://www.sqlite.org/download.html))
* Download and install [GitHub Package Manager](https://github.com/rko281/GitHub)
* Evaluate:
```smalltalk
GitHubPackageManager install: 'rko281/SQLite3'.
```
* Example usage:
```smalltalk
"Inspect it"
sqlite := SQLite3Connection memory.
sqlite open; execute: 'create table test_table(id integer,name varchar(64))'.

insertStmt := sqlite prepare: 'insert into test_table(id,name) values(?,?)'.
#(#(1 'Adele') #(2 'Alan')) do: [ :values | insertStmt execute: values].

(sqlite execute: 'select * from test_table') asArray.
```
