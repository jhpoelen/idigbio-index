---
---

Online digital biodiversity data platforms come and go. Natural occurring events such as scheduled maintenance, loss in funding, human error, or malicious hacking cause temporary or permanent disruption in access to online platforms.

This project builds on https://linker.bio and [preston](https://globalbioticinteractions.org/preston) to help provide access to downloading archived/tracked Darwin Core Archives associated with iDigBio collection uuids and their related GBIF dataset uuids or GBIF DOIs.  

For context, see [https://github.com/bio-guoda/preston/issues/353](https://github.com/bio-guoda/preston/issues/353).

|name|date|idigbio uuid|gbif uuid|gbif doi
|---|---|---|---|---
{%- for dataset in site.data.datasets %}
| {{ dataset.name }} | {{ dataset.modifiedDate }} | [{{ dataset.uuid_idigbio }}](https://linker.bio/urn:uuid:{{ dataset.uuid_idigbio }}) | [{{ dataset.uuid_gbif }}](https://linker.bio/urn:uuid:{{ dataset.uuid_gbif }}) | [{{ dataset.doi }}](https://linker.bio/{{ dataset.doi }})
{%- endfor %}


