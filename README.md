---
---
**this is a prototype** 

Online digital biodiversity data platforms come and go. Naturally occurring events such as scheduled maintenance, loss in funding, human error, or malicious hacking cause temporary or permanent disruption in access to online platforms.

This project builds on [https://linker.bio](https://linker.bio/#use-case-4-assessing-fairness-of-biodiversity-data) and [preston](https://globalbioticinteractions.org/preston) to help provide access to downloading archived/tracked Darwin Core Archives associated with iDigBio collection uuids and their related GBIF dataset uuids or GBIF DOIs.  

For context, see [https://github.com/bio-guoda/preston/issues/353](https://github.com/bio-guoda/preston/issues/353) and [https://github.com/jhpoelen/idigbio-index](https://github.com/jhpoelen/idigbio-index).

To download content associated with the collections/datasets right click on the link and "save as" - ```dwca.zip``` or similar . Download table as [csv](index.csv).

|name|date|idigbio uuid|gbif uuid|gbif doi
|---|---|---|---|---
{%- for dataset in site.data.datasets %}
| {{ dataset.name }} | {{ dataset.modifiedDate }} | [{{ dataset.uuid_idigbio }}](https://linker.bio/urn:uuid:{{ dataset.uuid_idigbio }}) | [{{ dataset.uuid_gbif }}](https://linker.bio/urn:uuid:{{ dataset.uuid_gbif }}) | [{{ dataset.doi }}](https://linker.bio/{{ dataset.doi }})
{%- endfor %}


