 /*
 -- all terms, definitions, and instance urls
 select
  term,
  definition,
  url as instance
from
  terms
  join term_instances on (terms.id = term_instances.id)
  join instances on (term_instances.instance_id = instances.id)
\G
*/

-- all terms, definitions, citing wikipedia
/*
select
  term,
  definition,
  url as citation
from
  terms
  join citations on (terms.citation_id = citations.id)
where
  citations.name like '%wikipedia%'
\G
*/
