#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
<<<<<<< HEAD
=======

>>>>>>> 347e8ce6131e25dd974d1564be2dc6cb31386734
