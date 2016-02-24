class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :destroy
end
