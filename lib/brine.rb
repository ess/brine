require 'brine/version'
require 'brine/configuration'
require 'brine/listing_issues'
require 'github_api'

module Brine
  def self.configure(&block)
    @configuration = Configuration.new
    block.call(@configuration)
    settings
  end

  def self.user_settings
    path = File.expand_path(File.join(ENV['HOME'], '.brine.yml'))
    raise "No user settings" unless File.exist?(path)
    @user_settings = YAML.load_file(path)
  end

  def self.project_settings
    search_path = File.expand_path('.')

    path = File.expand_path(File.join(find_features_dir, 'brine.yml'))
    raise "No project settings" unless File.exist?(path)
    @project_settings = YAML.load_file(path)
  end

  def self.init
    @github = Github.new(oauth_token: settings.access_token)
  end

  def self.settings
    @configuration
  end

  def self.github
    @github
  end

  def self.list
    ListingIssues.new(settings.user, settings.repo, github).summary
  end

  class << self
    private
    def find_features_dir
      hierarchy = File.expand_path('.').split('/')
      while hierarchy.length > 0
        File.join(hierarchy + ['features']).tap do |feature_path|
          return feature_path if File.exist?(feature_path)
        end
        hierarchy = hierarchy.first(hierarchy.length - 1)
      end
      raise "Could not find features directory"
    end
  end
end
