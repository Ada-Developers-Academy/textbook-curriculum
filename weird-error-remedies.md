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
