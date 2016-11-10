class User < ApplicationRecord
  has_many :delegations, :class_name => 'Task', :foreign_key => 'assigned_by'
  has_many :obligations, :class_name => 'Task', :foreign_key => 'assigned_to'
end
