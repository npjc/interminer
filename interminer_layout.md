#### interminer package layout

- `/R`
	- service-regions.r
	
	|  |                    synopsis                    |          service           |      uri       |
|:----------:|:----------------------------------------------:|:--------------------------:|:--------------:|
|   `im_regions(as = "gff3")`    | Get Genomic Features overlapping given Regions | Genomic Intervals as GFF3  | /regions/gff3  |
|   `im_regions(as = "fasta")`     | Get Genomic Features overlapping given Regions | Genomic Intervals as FASTA | /regions/fasta |
|   `im_regions(as = "bed")`     | Get Genomic Features overlapping given Regions |  Genomic Intervals as BED  |  /regions/bed  |
	

		
	- service-lists.r
	
	|            |         synopsis          | service |  uri   |
	|:----------:|:-------------------------:|:-------:|:------:|
	|  `im_lists(ls_name=NULL)`  | Find lists on the server. |  Lists  | /lists |
		
	- service-list.r
		
	|  |               synopsis               |    service    |         uri         |
|:----------:|:------------------------------------:|:-------------:|:-------------------:|
|   `im_lists(as = "gff3")`    | Get the Contents of a List as GFF3.  | List as GFF3  | /list/results/gff3  |
|   `im_lists(as = "fasta")`    | Get the Contents of a List as FASTA. | List as FASTA | /list/results/fasta |
		
	- service-query.r
	
	|      interminer      |                   synopsis                    |       service       |         uri          |
|:--------------------:|:---------------------------------------------:|:-------------------:|:--------------------:|
| `im_query(as = "gff3")` | Query the Database for Sequence Annotations.  | GFF3 Query Results  | /query/results/gff3  |
| `im_query(as = "fasta")` |       Query the Database for Sequence.        | FASTA Query Results | /query/results/fasta |
| `im_query(as = "bed")` |       Query the Database for Locations.       |  BED Query Results  |  /query/results/bed  |
| `im_query(as = "tab")` | Get results for a query against the database. |    Query Results    |    /query/results    |


#### what works:

- query/service/list/result/gff3
- query/service/list/result/fasta
- query/service/lists
- query/service/query/results/gff3
- query/service/query/results/fasta
- query/service/query/results/bed
- query/service/query/results
- query/service/regions/gff3		(GET will fail if you accept `application/json` first...)
- query/service/regions/fasta		(and here...)
- query/service/regions/bed			(and here...)

#### template stuff that works?
- query/service/template/results (www.flymine.org/query/service/template/results?name=Gene_GO&start=1&columnheaders=friendly&constraint1=Gene&op1=LOOKUP&value1=Notch&code1=A&extra1=D.%20melanogaster)
- query/service/templates (www.flymine.org/query/service/templates)


#### service things that also work:

- query/service/version/release
- query/service/version
- query/service

#### data model things taht work:
- query/service/model
- query/service/summaryfields

#### widget things
- query/service/widgets



#### auth things that work:
- query/service/users (POST new user account)
- query/service/user/token (GET 24hr token) which one then sends as a query element
- query/service/user/whoami
- query/service/listswithobject (www.flymine.org/query/service/listswithobject?publicId=CG10142&type=Gene&extraValue=D.%20melanogaster)
- 


## auth things:

with a username i created on the webs:  
	- nicolas.coutin@gmail.com
	- flymine1740







