# frozen_string_literal: true

module Config
  # Inject database configurations in Sinatra modular application.
  module Database
    def self.extended(base)
      base.instance_eval do
        register Sinatra::ActiveRecordExtension

        configure(:test) { setup_test_database }
        configure(:development) { setup_development_database }
        configure(:production) { setup_production_database }
      end
    end

    def setup_test_database
      set :database,
          :adapter => 'postgresql',
          :encoding => 'unicode',
          :database => 'one_bit_bot_test',
          :pool => 5,
          :username => ENV.fetch('POSTGRES_USER') { 'postgres' },
          :host => ENV.fetch('POSTGRES_HOST') { 'localhost' }
    end

    def setup_development_database
      set :database,
          :adapter => 'postgresql',
          :encoding => 'unicode',
          :database => 'one_bit_bot_dev',
          :pool => 5,
          :username => ENV.fetch('POSTGRES_USER') { 'postgres' },
          :host => ENV.fetch('POSTGRES_HOST') { 'localhost' }
    end

    def setup_production_database
      db_url = 'postgres:///postgres/one_bit_bot_production'
      db = URI.parse(ENV.fetch('DATABASE_URL') { db_url })

      set :database, {
        :adapter => 'postgresql',
        :host => db.host,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
      }
    end
  end
end
