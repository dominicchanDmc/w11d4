# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint
#  name       :string           not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string           not null
#
class Item < ApplicationRecord
    validates :name, length: { in: 3..255 }
    # , uniqueness: { message: "'%{value}' is already in use 3" }
    validates :price, numericality: { greater_than: 0 }

    belongs_to :pokemon
end
