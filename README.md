---
---
**this is a prototype** 

This page provides links to most recently published Darwin Core archive of collection data registered in the iDigBio network. You can get the most recent version of your collection data by [clicking below](#like-point-and-click). The reason why there are multiple links (e.g., idigbio uuid, gbif uuid, doi) is to demonstrate that biodiversity datasets registered across multiple data networks (e.g., idigbio, gbif) have more pathways to being located, accessed, used, and preserved.

This project builds on [https://linker.bio](https://linker.bio/#use-case-4-assessing-fairness-of-biodiversity-data) and [preston](https://globalbioticinteractions.org/preston) to help provide access to downloading archived/tracked Darwin Core Archives associated with iDigBio collection uuids and their related GBIF dataset uuids or GBIF DOIs.  

For context, see [https://github.com/bio-guoda/preston/issues/353](https://github.com/bio-guoda/preston/issues/353) and [https://github.com/jhpoelen/idigbio-index](https://github.com/jhpoelen/idigbio-index).

## Like data? 

Download table below as [csv](index.csv).

## Like scripting? 

Have peek at the [bash script](bin/ls-datasets.sh) that produced this data.

## Like citing data? 
This data was generated from an extensive dataset that contains tracked biodiversity datasets from period 2018/2025. 

> Preston. 2025. A digital corpus of biodiversity datasets registered with GBIF, iDigBio, and BioCASe. [hash://sha256/9dcf2e5497722e4f8184dffbf1e39daabb72a47ccbefb9c1177b17261ac337a5](https://linker.bio/hash://sha256/9dcf2e5497722e4f8184dffbf1e39daabb72a47ccbefb9c1177b17261ac337a5).

## Like command-line data access?

```bash
# get dwca associated with UCSB-IZC 
curl https://linker.bio/urn:uuid:65007e62-740c-4302-ba20-260fe68da291\
 > dwca-ucsb-izc.zip
```

or 

```bash
# first dwc record associated with UCSB-IZC in line json
preston track https://linker.bio/urn:uuid:65007e62-740c-4302-ba20-260fe68da291\
 | preston dwc-stream\
 | head -1\
 | jq .
```

## Like point-and-click? 
Please use the table below and download content associated with the collections/datasets by right clicking on the link and "save link as" - ```dwca.zip``` or similar . 

|name|date|idigbio uuid|gbif uuid|gbif doi
|---|---|---|---|---
{%- for dataset in site.data.datasets %}
| {{ dataset.name }} | {{ dataset.modifiedDate | split: 'T' | first  }} | [{{ dataset.uuid_idigbio }}](https://linker.bio/urn:uuid:{{ dataset.uuid_idigbio }}) | [{{ dataset.uuid_gbif }}](https://linker.bio/urn:uuid:{{ dataset.uuid_gbif }}) | [{{ dataset.doi }}](https://linker.bio/{{ dataset.doi }})
{%- endfor %}


