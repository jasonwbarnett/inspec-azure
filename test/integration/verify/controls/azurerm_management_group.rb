control 'azurerm_management_group' do
  describe azurerm_management_group(group_id: 'mg_parent', expand: 'children', recurse: true) do
    it                            { should exist }
    its('id')                     { should eq '/providers/Microsoft.Management/managementGroups/mg_parent' }
    its('type')                   { should eq '/providers/Microsoft.Management/managementGroups' }
    its('name')                   { should eq 'mg_parent' }
    its('display_name')           { should eq 'Management Group Parent' }
    # TODO: Figure out how to fill this in dynamically
    #its('tenant_id')              { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    #its('parent_name')            { should eq 'ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    #its('parent_id')              { should eq '/providers/Microsoft.Management/managementGroups/ab98a3ac-9c20-4b66-8593-1d2d4de0acb5' }
    its('parent_display_name')    { should eq 'Tenant Root Group' }
    its('children_display_names') { should include 'Management Group Child 1' }
    its('children_display_names') { should include 'Management Group Child 2' }
    its('children_ids')           { should include '/providers/Microsoft.Management/managementGroups/mg_child_one' }
    its('children_ids')           { should include '/providers/Microsoft.Management/managementGroups/mg_child_two' }
    its('children_names')         { should include 'mg_child_one' }
    its('children_names')         { should include 'mg_child_two' }
    its('children_types')         { should include '/providers/Microsoft.Management/managementGroups' }
  end
end
