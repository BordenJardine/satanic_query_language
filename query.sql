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

-- 1/4ly update form
/*
select * from terms where term = 'Quarterly Update Form'\G
*/

-- all terms, relating to Quarterly Updates
/*
select
  master_term.term,
  master_term.definition
from
  related_terms
  join terms as master_term on (related_terms.master_term_id = master_term.id)
  join terms as other_term on (related_terms.other_term_id = other_term.id)
where
  other_term.term = 'Quarterly Update Form'
\G
*/
