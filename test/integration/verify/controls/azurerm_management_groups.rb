control 'azurerm_management_groups' do
  describe azurerm_management_groups do
    its('group_names')       { should include 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
  end
end
