require 'json'

module Brine
  class Issue
    def self.consume_api(response = {})
      new(
        response['number'],
        response['title'],
        response['body'],
        'github',
        response['labels'].map {|label| label['name']}
      )
    end

    attr_reader :id, :title, :description, :storage, :labels

    def initialize(id, title, description, storage, labels)
      @id = id
      @title = title
      @description = description
      @storage = storage
      @labels = labels
    end

    def summary
      [id, title]
    end
  end
end
