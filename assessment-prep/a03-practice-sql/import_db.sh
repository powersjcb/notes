#!/usr/bin/env sh

rm movie.db
cat ./data/import_db.sql | sqlite3 movie.db
