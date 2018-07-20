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
  CSV.parse(csv, headers: true) do |row|
    process(row.to_hash)
  end
end

def process_row(row)
  data = {}
  row.each_pair do |k,v|
    next unless k
    data[k.downcase] = v
  end

  attrs = {
    term: row['term']
    definition: row['definition']
  }
  term = Term.find_by(term: term_txt)
  if term
    term.update_attributes(attrs)
  else
    Term.create(attrs)
  end
end

def db_connect(env)
  config = {
    adapter: 'mysql2',
    encoding: 'utf8',
    database: 'webapp_test',
    username: 'root',
    password: 'newpassword',
    host: 'localhost',
  }
  ActiveRecord::Base.establish_connection(config)
end

