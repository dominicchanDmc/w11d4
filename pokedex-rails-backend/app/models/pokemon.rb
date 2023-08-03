# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
      ].sort.freeze

    validates :image_url, presence: true
    validates :captured, inclusion: {in: [true, false],message: "Captured must be true or false"}
    validates :name, length: { in: 3..255 }, uniqueness: { message: "'%{value}' is already in use 1" }
    validates :attack,:defense, inclusion: 0..100, numericality: { only_integer: true }
    validates :number ,inclusion: 0..151, numericality: { only_integer: true },uniqueness: { message: "'%{value}' is already in use 2" }
    validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }

    has_many :items,
    dependent: :destroy
    
    has_many :poke_moves,
    dependent: :destroy

    has_many :moves,
    through: :poke_moves,
    source: :move

end
