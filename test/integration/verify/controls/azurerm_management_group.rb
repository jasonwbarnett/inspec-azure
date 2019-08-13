control 'azurerm_management_group' do
  describe azurerm_management_group(group_id: 'my-first-management-group', expand: 'children', recurse: true) do
    it                            { should exist }
    its('id')                     { should eq '/providers/Microsoft.Management/managementGroups/my-first-management-group' }
    its('type')                   { should eq '/providers/Microsoft.Management/managementGroups' }
    its('name')                   { should eq 'my-first-management-group' }
    its('display_name')           { should eq 'my fist management group (name)' }
    its('tenant_id')              { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('parent_name')            { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('parent_id')              { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('parent_display_name')    { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('children_display_names') { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('children_ids')           { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('children_names')         { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('children_roles')         { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('children_types')         { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
  end
end
