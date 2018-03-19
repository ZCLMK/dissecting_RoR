class Showcase < ApplicationRecord
  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react
    where(subtitle:"React")
  end

  scope :rails, ->{where(subtitle: "Ruby on Rails")}
#------------------------------------------------------------
  #déclarer une VALEUR PAR DEFAULT lors de la création d'un object showcase (initialisation = 'new', pas 'create' )

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:600, width:400) # '||= ' veut dire si aucune valeur n'est fournie.
    self.thumb_image ||= Placeholder.image_generator(height:350, width:200)
  end
end
#------------------------------------------------------------
