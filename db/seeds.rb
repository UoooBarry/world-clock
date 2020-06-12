data = ActiveSupport::JSON.decode(File.read("db/zone.json"))
data.each do |attributes|
    puts attributes["value"]
    @timezone = TimeZone.create!(
        value: attributes["value"],
        abbr: attributes["abbr"],
        offset: attributes["offset"],
        isdst: attributes["isdst"],
        text: attributes["text"],
    )
    attributes["utc"].each do |value|
        puts value
        @timezone.utcs.create!(
            value: value
        )
    end
end