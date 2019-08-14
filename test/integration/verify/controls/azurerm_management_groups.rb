control 'azurerm_management_groups' do
  describe azurerm_management_groups do
    its('group_names')       { should include 'mg_parent' }
    its('group_names')       { should include 'mg_child_one' }
    its('group_names')       { should include 'mg_child_two' }
  end
end
