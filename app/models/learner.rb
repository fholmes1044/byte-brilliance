class Learner < ApplicationRecord
    has_secure_password

    has_many :posts 
    has_many :learner_to_tutors
    has_many :tutors, through: :learner_to_tutors

    validates :username, :full_name, :age, :email, :password, :password_confirmation, :learning_goals, :location,  presence: true
    validates :age, numericality: {greater_than_or_equal_to: 18}
    validates :username, length: { minimum: 3, maximum: 50 }
    validates :password_digest, length: { minimum: 8 }
    validates :email, uniqueness: { case_sensitive: true }
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, format: { with: /\A(?=.*[!@#\$%^&*()\-_=+{}\[\]|\\:;"'<>,.?\/])(?=.*[0-9]).{8,}\z/}
end
