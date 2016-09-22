
export ROOT_DIR=$SCRIPT_DIR/..
export BIN_DIR=$ROOT_DIR/bin

export DIGDAGDB_USER=digdag
export DIGDAGDB_PASS=digdag
export DIGDAGDB_HOST=digdag_db
export DIGDAGDB_PORT=5432
export DIGDAGDB_DATABASE=digdagdb

# digdag server
export DIGDAG_SERVER_DOCKERFILE_DIR=$ROOT_DIR/digdag_server/docker

# digdag client
export DIGDAG_CLIENT_DOCKERFILE_DIR=$ROOT_DIR/digdag_client/docker
export DIGDAG_CLIENT_WORKFLOW_DIR=$ROOT_DIR/digdag_client/workflows

# digdag db
export DB_BUILD_DOCKERFILE_DIR=$ROOT_DIR/postgresql/docker
