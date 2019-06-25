# Common Google Cloud Commands

Set the Google Cloud CLI to use a specific project.

```
gcloud config set project [PROJECT-ID]
```

Create a Postgres database instance on a micro (very small) server

```
gcloud sql instances create [INSTANCE-NAME] --database-version=POSTGRES_9_6 --tier=db-f1-micro
```

Create a database on the instance

```
gcloud sql databases create [DATABASE-NAME] --instance=[INSTANCE-NAME] --charset=utf8
```

Create a user & password on the instance.

```
gcloud sql users create [USER-NAME] --instance=[INSTANCE-NAME] --password=[DATABASE-PASSWORD]
```
