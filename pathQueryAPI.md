---
title: "The Intermine API"
author: "Nicolas Coutin"
date: "May 14, 2015"
output: html_document
---

The PathQuery API
==================

InterMine installations accept queries over their data in a custom format
known as *Path-Queries*. This is a graph-based query format which inherits some
of its semantics and terminology from SQL.

Paths
------

The core concept of *Path-Queries* is naturally enough the *Path*, examples of
which are:

* `Gene`: A plain root
* `Gene.symbol`: A root and an attribute
* `Gene.chromosomeLocation`: A reference to a complex attribute (a reference)
* `Gene.organism.name`: A chain from a root to an attribute through one or more references.
* `Gene.pathways.identifier`: A path may potentially match multiple values - there may be several pathway identifiers that match this path for any given gene.
* `Protein.gene.homologues.homologue.alleles.alleleClass`: Paths may be of arbitrary length.

In the XML serialization of path-queries, all paths must be completely qualified. In the JSON format a prefix can be specified with the `from` or `root` property.


### query()

* `model` = "genomic"  
* `view` = "Organism.name Organism.taxonId"
* `name` = "the name of the query"
* `sortOrder` = "Gene.secondaryIdentifier ASC"
* `constraintLogic` = "A and B"

### join()
* `path` = "a.path"
* `style` = "OUTER"


### constraint()

* `path` = ""
* `type` = ""
* `op` = ""
* `value` = ""
* `extraValue` = ""
* `code` = ""



## data used in this study

- Refer to [this gentle intro document](https://docs.google.com/document/d/1-BQfalYIZ58POE29dnzIw903FMhrIwiTIorGOcTCQWg/edit#heading=h.5532a6744d14) over at modencode that says:

>In D. melanogaster, the Karpen group used ChIP-chip and ChIP-seq to assay the binding sites of chromatin binding and modification proteins in four fly cell lines: S2, BG3, Kc and Cl.8.

- i.e. from Gary Karpen's lab @ Lawrence Berkeley National Laboratory.

