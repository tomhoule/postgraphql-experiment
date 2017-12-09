watch:
    watchexec \
    -r \
    -e rs,sql \
    -c cargo run

start-postgres:
    systemctl start postgresql

start-postgraphql:
    `yarn bin`/postgraphql \
        --default-role=loc_anonymous \
        --watch \
        --schema loc_api \
        --connection postgres://postgres@localhost:5432/pgql_experiment

