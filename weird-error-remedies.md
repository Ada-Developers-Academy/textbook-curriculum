# Fantastic Errors and How to Fix Them

This is a repository for various spectacular and strange errors that don't have immeadiately obvious solutions. When you add to this doc, please include information on the following categories:
- A description of the problem and any error messaging you were given
- The process that was needed to fix the error
- Any sources you consulted to develop a solution

### PG::ConnectionBad

###### Error Message:
> PG::ConnectionBad could not connect to server something something /tmp/.s.PGSQL.1234 (can’t connect to postgres, bad pid file)

###### Solution:
```
rm /usr/local/var/postgres/postmaster.pid
brew services restart postgresql
```

###### Sauces:
https://stackoverflow.com/questions/14225038/postgresql-adapter-pg-could-not-connect-to-server


###### Error Message:
>PG::ConnectionBad could not connect to server Is the server running on host **something** and accepting
TCP/IP connections on port **something**?


###### Solution:
This may be caused by a mismatch of versions between the database and the current version of postgres.
```
brew services list

//check the plist for postgres for the logfile path usually found at
less /usr/local/var/log/postgres.log

//if the log says we have a newer version of postgres you can check to see what the right way to update the database is by checking
brew info postgresql

//look in caveats for migration instructions. currently: 
brew postgresql-upgrade-database
```
