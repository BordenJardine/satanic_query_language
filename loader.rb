require 'active_record'
require 'mysql2'
require 'pry'
require 'csv'
Dir["./app/**/*.rb"].each { |file| require file }

# Load Up The Satanic Glossary Database
#
# Load access_notes
# load citations
# load instances
# load term_instances
# load terms
#
#
#
# for each row
# create term
#   - if citation_url found use that one
#     - otherwise create one
#   - if citation_url found use that one
#     - otherwise create one

def process_csv(csv)
  puts("start #{csv}")
  CSV.foreach(csv, headers: true) do |row|
    process_row(row.to_hash)
  end
end

def process_row(row)
  access_note = create_access_notes(row)
  citation = create_citation(row)
  instance = create_instance(row)
  term = create_term(row, access_note, citation)
  term_instance = create_term_instance(term, instance)
  related_term = create_related_terms(term, row)
end

def create_access_notes(row)
  text = row['Access Notes']
  return unless text
  access_notes = AccessNote.find_by(access_notes: text)
  attrs = { access_notes: text }
  if access_notes
    access_notes.update_attributes(attrs)
    return access_notes
  else
    return AccessNote.create(attrs)
  end
end

def create_citation(row)
  url = row['Citation']
  return unless url
  name = url.split('/')[2]
  attrs = {
    url: url,
    name: name,
  }
  citation = Citation.find_by(url: url)
  if citation
    citation.update_attributes(attrs)
    return citation
  else
    return Citation.create(attrs)
  end
end

def create_instance(row)
  url = row['Citation']
  return unless url
  name = url.split('/')[2]
  attrs = {
    url: url,
    name: name,
  }
  instance = Instance.find_by(url: url)
  if instance
    instance.update_attributes(attrs)
    return instance
  else
    return Instance.create(attrs)
  end
end

def create_term(row, access_note, citation)
  term = Term.find_by(term: row['Term'])
  attrs = {
    term: row['Term'],
    definition: row['Definition'],
    citation: citation,
    access_note: access_note
  }
  if term
    term.update_attributes(attrs)
    return term
  else
    return Term.create(attrs)
  end
end

def create_term_instance(term, instance)
  return unless term && instance
  TermInstance.create(term:term, instance:instance)
end

def create_related_terms(term, row)
  other_term = Term.find_by(term: row['Related Terms'])
  return unless term && other_term
  rt = RelatedTerm.find_by(master_term: term, other_term: other_term)
  return rt if rt
  RelatedTerm.create(master_term: term, other_term: other_term)
end

def db_connect
  config = {
    adapter: 'mysql2',
    encoding: 'utf8',
    database: 'tst_glossary',
    username: 'root',
    password: 'newpassword',
    host: 'localhost',
  }
  ActiveRecord::Base.establish_connection(config)
end

db_connect()
process_csv('./tst_glossary.csv')
