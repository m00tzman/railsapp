class Project < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :student

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end
  
end
