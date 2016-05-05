class Link
	include DataMapper::Resource
	property :id, Serial
	property :url, String
	property :title, String

	has n, :tags, :through => Resource

	def self.filter(tag)
		all(:tags  => { :tag_name => tag})
	end
end
