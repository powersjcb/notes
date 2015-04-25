# SQL Assessment Practice

## Instructions

Take 35min to write SQL queries for the following questions.

Fill in the required SQL in the `lib/movie_sql.rb` file. The spec file
(run with `bundle exec rspec`) will check your work (go for the
green!). You may wish to use the command-line sqlite3 program to
interactively experiment with SQL, but this is not required. Please do
not use the internet.

Run the following command within this directory to create the
database:

    ./import_db.sh

If your DB gets borked somehow, you can always rerun `./import_db.sh`
to restore the DB.

In `sqlite3` you can list all tables with `.tables` and view the
database schema with `.schema`.

After 35 minutes (or upon completion), we (very strongly) suggest you
move on to the Associations part. You may of course return to the SQL
part after the Associations part..

## Notes

0. The tables in this dataset come from a third party and, regrettably, do not
   follow the Rails conventions for table names and foreign keys. You will find
   many such datasets in the wild, and it is in your interest to get comfortable
   navigating them. All that said, the structure here should be fairly clear.
0. Result ordering matters; the spec will enforce this.
0. Make sure to terminate sqlite3 commands with semicolons, otherwise
   they don't execute.
0. Good luck!
