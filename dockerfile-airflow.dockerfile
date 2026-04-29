# Dockerfile-airflow
FROM apache/airflow:2.9.3

USER airflow

RUN pip install --no-cache-dir dbt-core dbt-postgres dbt-snowflake

# Remove stale PID file before starting
ENTRYPOINT ["/bin/bash", "-c", "rm -f /opt/airflow/airflow-webserver.pid && exec airflow \"$@\"", "--"]