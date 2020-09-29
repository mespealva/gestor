class Proyect < ApplicationRecord
    enum estados: { propuesta: 0, en_proceso: 1, terminado: 2 }
    validates :nombre, presence: true
    validates :desc, presence: true
    validates :estado, presence: true
end
