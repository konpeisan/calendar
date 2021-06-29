class Yen < ActiveHash::Base
  self.data = [
    { id: 1, name: "円" },
    { id: 2, name: "玉(4.00円/25玉)" },
    { id: 3, name: "玉(3.57円/28玉)" },
    { id: 4, name: "玉(3.33円/30玉)" },
    { id: 5, name: "玉(3.00円/33玉)" }
  ]

  include ActiveHash::Associations
  has_many :budgets

end