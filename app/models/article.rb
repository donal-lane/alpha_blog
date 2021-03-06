class Article < ActiveRecord::Base
    paginates_per 5
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 500 }
    validates :description, presence: true, length: { minimum: 3, maximum: 5000 }
    validates :user_id, presence: true
end
