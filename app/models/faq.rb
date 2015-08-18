class Faq < ActiveRecord::Base
  acts_as_list
  attr_accessible :question, :answer, :position
  translates :question, :answer
end
