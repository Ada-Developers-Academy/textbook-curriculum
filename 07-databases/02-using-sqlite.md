# Using SQLite
## Learning Goals
- Install SQLite
- Learn how to access SQLite and how to interact with it
- Write our first _query_
- Write a bunch more _queries_

## Installing SQLite
Let's use Brew! `$ brew install sqlite3`

That's it!

## What is SQLite?
[SQLite](http://sqlite.org/) is a tiny relational database engine. It keeps all of the data and schema it knows about in a single file. We can then access and manipulate that data by communicating with SQLite using _SQL_.


### Our First Query
A _query_ is a question or statement we make to the database. We might be asking for a piece of data, or to create a new collection of data, or many other things.

_SQLite_ provides a REPL for us to interact with it. Let's start the REPL and run a _query_:

```sql
$ sqlite3
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> select current_date;
2016-04-10
sqlite>
```

__Question: what is `current_date` in the _query_ above?__

### Creating a _table_
Now that we have a connection to the database, let's describe our _schema_ to SQLite by creating a _table_. To do this, we must use the [_CREATE TABLE_ command](https://www.sqlite.org/lang_createtable.html).

```sql
sqlite> CREATE TABLE posts (
id INTEGER PRIMARY KEY,
title TEXT NOT NULL,
body TEXT NOT NULL
);
```

Each column has a **type** (integer, text...) and optionally **constraints** (primary/unique key, default value, not null...)

[SQLite Data Types](https://www.sqlite.org/datatype3.html):
Each value stored in an SQLite database (or manipulated by the database engine) has one of the following storage classes:

- **NULL**: The value is a NULL value.
- **INTEGER**: The value is a signed integer, stored in 1, 2, 3, 4, 6, or 8 bytes depending on the magnitude of the value.
- **REAL**: The value is a floating point value, stored as an 8-byte IEEE floating point number.
- **TEXT**: The value is a text string, stored using the database encoding (UTF-8, UTF-16BE or UTF-16LE).
- **BLOB**: The value is a blob of data, stored exactly as it was input.


__Question: Where does this schema live?__

### Inserting a record
Now that we've got a _table_, let's use an [_INSERT_ statement](https://www.sqlite.org/lang_insert.html) to put some data into it:

```sql
sqlite> INSERT INTO posts (title, body) VALUES ('hello', 'world');
sqlite> INSERT INTO posts (title, body) VALUES ('I love lunch', 'and bunch!');
```

### Seeing our data
We can get data out of our database using [_SELECT_ statments](https://www.sqlite.org/lang_select.html). Before we do, though, let's tell SQLite how we'd like to format our output. These statements are special REPL commands; we won't need to do this when our Ruby programs are interacting with SQLite:

```sql
sqlite> .headers on
sqlite> .mode tabs
```

Now we're ready to use a _SELECT_:

```sql
sqlite> SELECT * FROM posts;
id      title           body
1       hello           world
2       I love lunch    and brunch!
```

__Question: What does * mean in a _SELECT_ statement?__

### Updating and Deleting a record
We use [_UPDATE_ statements](https://www.sqlite.org/lang_update.html) to change exsisting data. When we need to remove data from our database, we leverage the [_DELETE_ statement](https://www.sqlite.org/lang_delete.html).

Both **UPDATE** and **DELETE** require significant caution. ALWAYS be sure you're specifying which rows to change or remove with care! When you're writing an **UPDATE or DELETE always specify a WHERE clause!** Otherwise you'll change every row in the table.

Let's change the title of our first post:

```sql
sqlite> UPDATE posts SET title="goodbye" WHERE id = 1;
sqlite> SELECT * FROM posts WHERE id = 1;
id      title   body
1       goodbye world
```

__Question: What is the _WHERE_ clause doing in the above _query_?__

Finally, let's delete the row from the table:
```sql
sqlite> DELETE FROM posts WHERE id = 1;
sqlite> select * from posts;
id      title           body
2       I love lunch    and brunch!
```

These four operations--_SELECT_, _INSERT_, _UPDATE_, _DELETE_--mirror the ideas we talked about last week around HTTP verbs. We used the acronym __CRUD__ to describe how a web application interacts with data. These core SQL operations map very well to __CRUD__ and form the foundation of how persistance is acheived in a web application that leverages a relational database.
