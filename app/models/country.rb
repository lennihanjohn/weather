# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
    # ASSOCIATIONS
    has_many :cities

    def self.save_record(params)
        return self.find_or_create_by(params)
    end
end
