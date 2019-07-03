# What is a Database?
## Learning Goals
- Define and discuss the term _database_
- Discuss how a _database_ is different from things like a csv file or spreadsheet
- Discover different _database paradigms_
- Explore key _relation database_ concepts
  - _persistence_
  - _schema_
  - _tables_, _columns_, and _rows_
  - _primary_ and _foreign keys_
- Meet _SQL: the Structured Query Language_

## What is persistence?
As defined by wikipedia:
  >persistence refers to the characteristic of state that outlives the process that created it

## What is a database?
The thing you keep your data in... or, an organized collection of data.

### Several popular paradigms:
- Relational (RDB)
- Document
- Key-Value
- Object
- Graph, etc.

### RDB
A relational database consists of structured data, organized in tables. These tables can have relationships with other tables and are _formally described_. Data is stored in _rows_ and _columns_.

#### Vocabulary
- **Schema**: A representation of the structure of a database. It may be graphical or textual.
- **Table**: A collection of closely related columns. A table consists of rows each of which shares the same columns but vary in the column values.
- **Column**: A single unit of named data that has a particular data type. Columns only exist in tables.
- **Row**: One set of related values for all of the columns declared in a given table. Also known as a record.
- **Primary Key**: A column or group of columns in a given table that uniquely identify each row of the table.
- **Foreign Key**: One or more columns in a table intended to contain only values that match the related primary/unique key column(s) in the referenced table.

## SQL: Structured Query Language
_SQL_ is a complete programming language to define, manipulate, transform, and read data within a relational database. _SQL_ is executed as _statements_. Each _statement_ is an atomic operation that either __defines__ or __manipulates__ the data or structure of the database.

_SQL Statements_ are divided into two categories:

- __DDL__: Data Definition Language
  - Create, Drop, Alter, etc.
- __DML__: Data Manipulation Language
  - Select, Insert, Update, Delete, etc.
