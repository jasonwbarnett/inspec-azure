# frozen_string_literal: true

require 'azurerm_resource'

class AzurermManagementGroup < AzurermSingularResource
  name 'azurerm_management_group'
  desc 'Verifies settings for an Azure Management Group'
  example <<-EXAMPLE
    describe azurerm_management_group(resource_group: 'example', name: 'vm-name') do
      it { should have_monitoring_agent_installed }
    end
  EXAMPLE

  ATTRS = {
    children:     :children,
    details:      :details,
    type:         :type,
    display_name: :displayName,
    id:           :id,
    name:         :name,
    roles:        :roles,
    tenant_id:    :tenantId,
    type:         :type,
  }

  attr_reader(*ATTRS.keys)

  def initialize(resource_group: nil, name: nil)
    resp = management.management_group(resource_group, name)
    return if has_error?(resp)

    assign_fields_with_map(ATTRS, resp.properties)

    @exists = true
  end

  def to_s
    "'#{name}' Management Group"
  end

  def parent_name
    properties.details.parent.name
  end

  def parent_id
    properties.details.parent.id
  end

  def parent_display_name
    properties.details.parent.displayName
  end

  def children_names
    Array(properties.children).map(&:name)
  end
end
