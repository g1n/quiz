class Progress < ActiveRecord::Base
    validates :level, numericality: { only_integer: true }
end
