class Institution < ActiveRecord::Base
	paginates_per 50

	def self.to_csv
	    attributes = %w{id name officer_name enabled facebook_url facebook_username}

	    CSV.generate(headers: true) do |csv|
	      csv << attributes

	      all.each do |user|
	        csv << attributes.map{ |attr| user.send(attr) }
	      end
	    end
  end
end
