class Task < ApplicationRecord
  belongs_to :todolist

  TODOLIST_BASE = ['passeport', 'valise']
end
