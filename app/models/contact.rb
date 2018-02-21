class Contact < ApplicationRecord

validates :name, presence: true, length: { maximum: 30 }
validates :email, presence: true, length: { maximum: 250 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
validates :content, presence: true

end
