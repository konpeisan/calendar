class Yen < ActiveHash::Base
  self.data = [
    { id: 1, name: "円" },
    { id: 2, name: "玉(4.00円)" },
    { id: 3, name: "玉(3.57円)" },
    { id: 4, name: "玉(3.33円)" },
    { id: 5, name: "玉(3.00円)" }
  ]

  include ActiveHash::Associations
  has_many :budgets

end