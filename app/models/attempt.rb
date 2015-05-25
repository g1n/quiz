class Attempt < ActiveRecord::Base

	def self.save_matches(level, user, matches)
		for match in matches
			# save only if not present
			attempt = Attempt.new(:level => level, :value => match, :who => user, :when => Time.now)
			attempt.save
		end
	end
end
