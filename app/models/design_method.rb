# == Schema Information
#
# Table name: design_methods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  overview   :text
#  process    :text
#  principle  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DesignMethod < ActiveRecord::Base
  searchable do
    text :name, :overview, :principle, :process
    text :method_categories do
      method_categories.map { |method_category| method_category.name }
    end
  end

  attr_accessible :name, :overview, :principle, :process

  has_many :categorizations, dependent: :destroy
  has_many :method_categories, through: :categorizations
  has_many :citations, dependent: :destroy
  has_many :method_citations, through: :method_citations
end