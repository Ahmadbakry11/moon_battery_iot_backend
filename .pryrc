# frozen_string_literal: true

include FactoryBot::Syntax::Methods

Pry.hooks.add_hook(:before_session, 'reload-the-history-hook') do |_output, _binding, _pry|
  Pry.history.load
end

def self.reload
  reload!
  Dir['./lib/**/*.rb'].sort.each { |f| load f }
  FactoryBot.reload
  puts 'Reloaded!'
  true
end

$logger = ActiveRecord::Base.logger

def sql_off
  ActiveRecord::Base.logger = nil
  puts 'SQL off!'
  puts 'To enable SQL: sql_on'
end

def sql_on
  ActiveRecord::Base.logger = $logger
  puts 'SQL on!'
end

sql_off
