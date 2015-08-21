#!/usr/bin/env bash
GRAPHITE_URL=$1

COUNT=$(sqlite3 {{ grafana_data }}/{{ grafana_path }} "SELECT count(0) FROM data_source WHERE url = '$GRAPHITE_URL'")

if [ "$COUNT" -eq 0 ]; then
  sqlite3 {{ grafana_data }}/{{ grafana_path }} "INSERT INTO data_source VALUES (null,1,0,'graphite','graphite - $GRAPHITE_URL','proxy','$GRAPHITE_URL','','','',0,'','',1,'null',date('now'),date('now'));"
fi