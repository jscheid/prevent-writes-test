# `ActionController::Live` vs. `prevent_writes`

WIP trying to create a reproducible test case for an issue we're seeing in our
environment, when combining `ActionController::Live` with
`ActiveRecord::Base.connected_to`.

Run using `docker compose up`. Probably needs a recent Docker version.

The main test is in `test.bash`, which should expose the following behaviour:

- First it issues a GET to the `/ping` endpoint, which works.
- Then it GETs a `ActionController::Live` streaming endpoint and disconnects early.
- Then it issues another GET to the `/ping` endpoint again, which fails with the following error:
  `No connection pool for 'ActiveRecord::Base' found for the 'reading' role.`

Most of the files in this repository are just Rails scaffolding, the main
interesting files are the ones in `app/controllers`.
