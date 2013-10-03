# == Schema Information
#
# Table name: method_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MethodCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :categorizations, dependent: :destroy
  has_many :design_methods, through: :categorizations
end