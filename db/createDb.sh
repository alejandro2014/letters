#!/bin/bash
DATABASE=./infojobs.db

for migration in `find ./migrations/add`; do
    sqlite3 ${DATABASE} < ${migration}
done
