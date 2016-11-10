class Task < ApplicationRecord
  belongs_to :delegations, :class_name => 'User', :foreign_key => 'assigned_by'
  belongs_to :obligations, :class_name => 'User', :foreign_key => 'assigned_to'
end
