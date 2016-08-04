class Webmotors
  class << self
    def fetch(path, options = {})
      uri = URI("#{::WEBMOTORS_URI}#{path}")
      JSON.parse(Net::HTTP.post_form(uri, options).body)
    end
  end
end
