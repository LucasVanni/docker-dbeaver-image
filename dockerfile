FROM alpine:latest

# Combine RUN commands and cleanup in single layer
RUN apk add --no-cache bash openjdk21-jre-headless curl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

ENV CLOUDBEAVER_HOME="/opt/cloudbeaver"

# TODO: Lembrar de trocar a versão quando o mantenedor atualizar a versão
COPY --from=dbeaver/cloudbeaver:ea $CLOUDBEAVER_HOME $CLOUDBEAVER_HOME

WORKDIR "/opt/cloudbeaver"

RUN rm -rf /opt/cloudbeaver/server/plugins/org.jkiss.bundle.logback_1.0.2/lib/logback-core-1.4.14.jar \ 
    && rm -rf /opt/cloudbeaver/server/plugins/com.dbeaver.jdbc.driver.libsql_1.0.3.202501040445.jar

ARG DRIVERS_TO_ELIMINATE="clickhouse_com db2 db2-jt400 duckdb h2 jaybird trino kyuubi mssql"
RUN for driver in $DRIVERS_TO_ELIMINATE; do \
    rm -rf /opt/cloudbeaver/drivers/$driver; \
    done

RUN chmod +x ./run-server.sh

ENTRYPOINT ["./run-server.sh"]
