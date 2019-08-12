control 'azurerm_management_group' do
  describe azurerm_management_group(group_id: 'my-first-management-group', expand: true, recurse: true) do
    it                       { should exist }
    its('display_name')      { should eq 'my fist management group (name)' }
    its('id')                { should eq '/providers/Microsoft.Management/managementGroups/my-first-management-group' }
    its('name')              { should eq 'my-first-management-group' }
    its('tenant_id')         { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('type')              { should eq '/providers/Microsoft.Management/managementGroups' }
    its('parent_name')       { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
  end
end
