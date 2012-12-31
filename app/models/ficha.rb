class Ficha < ActiveRecord::Base
  validates :nome, presence: true
  validates :numero_ordem, presence: true
end
