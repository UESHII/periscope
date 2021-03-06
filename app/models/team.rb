class Team < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Acconting' },
    { id: 2, name: 'Customer Service' },
    { id: 3, name: 'General' },
    { id: 4, name: 'IT' },
    { id: 5, name: 'Logistics' },
    { id: 6, name: 'Manufacturing' },
    { id: 7, name: 'Sales' }
  ]

  private

  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end
end
