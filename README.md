Easily query flymine, yestmine, and modmine data. Wraps the intermine PathQuery
API.

Eg.

```r
im("flymine") %>% 
    im_query("Gene.symbol Gene.name Gene.secondaryIdentifier Gene.id ") %>% 
    im_constrain("Gene","LOOKUP","top2",extraValue="D. melanogaster") %>%
    im_get()
#>     V1              V2      V3        V4
#> 1 Top2 Topoisomerase 2 CG10223 113024122
```
