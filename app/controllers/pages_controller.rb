class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
    @showcases = Showcase.all
  end

  def about
  end

  def contact
  end
end
