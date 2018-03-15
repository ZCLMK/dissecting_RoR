class Skill < ApplicationRecord
  include Placeholder # this activate our concern module PlaceHolder
  validates_presence_of :title, :level

  after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(height:250, width:250) # '||= ' veut dire si aucune valeur n'est fournie.
  end
end
