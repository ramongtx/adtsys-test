class Make < ActiveRecord::Base
  has_many :models

  validates :name,
    presence: true

  class << self
    def fetch_all
      fetch unless any?
      all
    end

    def fetch
      json = Webmotors.fetch('/carro/marcas')
      json.each { |make| from_json(make) }
    end

    def from_json(json)
      return if find_by(webmotors_id: json['Id'])
      create(name: json['Nome'], webmotors_id: json['Id'])
    end
  end
end
