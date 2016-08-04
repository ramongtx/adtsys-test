class Model < ActiveRecord::Base
  belongs_to :make

  validates :name,
    presence: true

  class << self
    def fetch_all(make)
      fetch(make) unless exists?(make_id: make.id)
      where(make_id: make.id)
    end

    def fetch(make)
      json = Webmotors.fetch('/carro/modelos', marca: make.webmotors_id)
      json.each { |model| from_json(make, model) }
    end

    def from_json(make, json)
      return if find_by(name: json['Nome'], make_id: make.id)
      create(make_id: make.id, name: json['Nome'])
    end
  end
end
