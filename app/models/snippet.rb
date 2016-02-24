class Snippet < ActiveRecord::Base
  belongs_to :kind
  belongs_to :user
end
