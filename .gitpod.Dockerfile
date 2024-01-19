FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql postgresql-contrib

# Initialize PostgreSQL data directory and start PostgreSQL service
RUN sudo service postgresql start && \
    sudo service postgresql stop

# Create a PostgreSQL role named `gitpod` with `gitpod` as the password and then create a database `gitpod` owned by the `gitpod` role.
RUN sudo service postgresql start && \
    sudo -u postgres psql -c "CREATE ROLE gitpod WITH LOGIN SUPERUSER PASSWORD 'gitpod';" && \
    sudo -u postgres createdb gitpod -O gitpod && \
    sudo service postgresql stop

# Start PostgreSQL service
CMD sudo service postgresql start && tail -f /dev/null
