#!/bin/bash
#
#

set -x

GIB_VERSION="hash://sha256/9dcf2e5497722e4f8184dffbf1e39daabb72a47ccbefb9c1177b17261ac337a5"

INDEX_IDIGBIO="hash://sha256/bc8df0f4b726d1a8ccd7d4f8f4438a63f3bbabfd2681c1693635eda8aa0584dc"
INDEX_GBIF="hash://sha256/891b97ea80b9567da6864364ae5f35b016a0e27f63825b184d4b084a5b641a71"

# "https://search.idigbio.org/v2/search/recordsets?limit=10000"\

preston cat\
 --remote https://linker.bio\
 --anchor "${GIB_VERSION}"\
 ${INDEX_IDIGBIO}\
 | jq -c '.items[]["indexTerms"]["indexData"] | select(has("collection_name")) | { "name": .collection_name, "uuid_idigbio": .["idigbio:uuid"], modifiedDate: .["idigbio:dateModified"] }'\
 | duckdb index.duckdb -c "DROP TABLE IF EXISTS idigbio; CREATE TABLE idigbio AS SELECT * FROM read_json('/dev/stdin');"

preston cat\
 --remote https://linker.bio\
 --anchor "${GIB_VERSION}"\
 ${INDEX_GBIF}\
 | mlr --tsvlite --ojsonl cat\
 | jq -c '{ name: .title, uuid_gbif: .dataset_key, doi: .doi}'\
 | duckdb index.duckdb -c "DROP TABLE IF EXISTS gbif; CREATE TABLE gbif AS SELECT * FROM read_json('/dev/stdin');"

duckdb index.duckdb\
 --csv\
 -c "SELECT idigbio.name,idigbio.modifiedDate,idigbio.uuid_idigbio,gbif.uuid_gbif,gbif.doi FROM idigbio LEFT OUTER JOIN gbif ON gbif.name = idigbio.name ORDER BY idigbio.name ASC;"



