# frozen_string_literal: true

require 'azurerm_resource'

class AzurermManagementGroup < AzurermSingularResource
  name 'azurerm_management_group'
  desc 'Verifies settings for an Azure Management Group'
  example <<-EXAMPLE
    describe azurerm_management_group(name: 'group-name') do
      it { should exist }
    end
  EXAMPLE

  ATTRS = {
    children:     :children,
    details:      :details,
    display_name: :displayName,
    id:           :id,
    name:         :name,
    roles:        :roles,
    tenant_id:    :tenantId,
    type:         :type,
  }.freeze

  attr_reader(*ATTRS.keys)

  def initialize(group_id:, expand: false, recurse: false, filter: nil)
    resp = management.management_group(group_id, expand: expand, recurse: recurse, filter: filter)
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
