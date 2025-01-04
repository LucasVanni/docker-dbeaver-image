[Go to English documentation](README.md)

# DBeaver Cloud Docker Image

Esta imagem Docker é baseada no DBeaver Cloud e foi otimizada para reduzir o custo computacional. A imagem utiliza o `alpine:latest` como base, garantindo uma pegada leve e eficiente. Para mais informações, visite o [Docker Hub](https://hub.docker.com/r/lucasvanni/dbeaver-more-cleaning) do projeto.

## Características

- **Base Leve**: Utiliza a imagem `alpine:latest` para garantir uma base mínima e segura.
- **Java Runtime**: Inclui o `openjdk21-jre-headless` para executar aplicações Java sem a sobrecarga de uma interface gráfica.
- **Limpeza de Cache**: Remove caches e arquivos temporários para reduzir o tamanho da imagem.
- **Eliminação de Drivers**: Remove drivers de banco de dados desnecessários para otimizar o desempenho.
- **Script de Inicialização**: Configurado para executar o script `run-server.sh` na inicialização.

## Drivers Removidos

Os seguintes drivers de banco de dados foram removidos para otimizar o desempenho da imagem Docker:

- clickhouse_com
- db2
- db2-jt400
- duckdb
- h2
- jaybird
- trino
- kyuubi
- mssql

## Drivers que estão na imagem

- postgresql
- mariadb
- oracle
- mysql

## Plugins Removidos

Os seguintes plugins foram removidos do servidor CloudBeaver para otimizar o desempenho da imagem Docker e torná-la mais segura:

- org.jkiss.bundle.logback_1.0.2/lib/logback-core-1.4.14.jar
- com.dbeaver.jdbc.driver.libsql_1.0.3.202501040445.jar

## Instruções de Uso

1. **Construir a Imagem**: 
   ```bash
   docker build --build-arg DRIVERS_TO_ELIMINATE="clickhouse_com db2 db2-jt400 duckdb h2 jaybird trino kyuubi mssql" -t dbeaver-cloud-optimized .
   ```
   Você pode adicionar ou remover drivers da lista `DRIVERS_TO_ELIMINATE` conforme necessário e os que existem na imagem original do DBeaver Cloud.

2. **Executar o Container**:
   ```bash
   docker run -d dbeaver-cloud-optimized
   ```

## Detalhes Técnicos

- **Variáveis de Ambiente**:
  - `CLOUDBEAVER_HOME`: Define o diretório de instalação do CloudBeaver.
  - `DRIVERS_TO_ELIMINATE`: Lista de drivers de banco de dados a serem removidos para otimização.

- **Otimizações**:
  - Combinação de comandos `RUN` para reduzir o número de camadas na imagem.
  - Remoção de arquivos de log e drivers desnecessários para melhorar o desempenho.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorias.
