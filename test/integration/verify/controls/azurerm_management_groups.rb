control 'azurerm_management_groups' do
  describe azurerm_management_groups do
    it                       { should exist }
    its('group_names')       { should include 'first' }
  end
end
