# frozen_string_literal: true

require 'azurerm_resource'

class AzurermManagementGroup < AzurermSingularResource
  name 'azurerm_management_group'
  desc 'Verifies settings for an Azure Management Group'
  example <<-EXAMPLE
    describe azurerm_management_group(group_id: 'example-group') do
      it { should exist }
    end
  EXAMPLE

  ATTRS = [
    :id,
    :type,
    :name,
  ].freeze

  PROPERTY_ATTRS = {
    children:     :children,
    details:      :details,
    display_name: :displayName,
    roles:        :roles,
    tenant_id:    :tenantId,
  }.freeze

  attr_reader(*ATTRS, *PROPERTY_ATTRS.keys)

  def initialize(group_id:, expand: false, recurse: false, filter: nil)
    resp = management.management_group(group_id, expand: expand, recurse: recurse, filter: filter)
    return if has_error?(resp)

    @id = resp.id
    @type = resp.type
    @name = resp.name

    assign_fields_with_map(PROPERTY_ATTRS, resp.properties)

    @exists = true
  end

  def to_s
    "'#{name}' Management Group"
  end

  def parent_name
    details.parent.name
  end

  def parent_id
    details.parent.id
  end

  def parent_display_name
    details.parent.displayName
  end

  def children_names
    Array(properties.children).map(&:name)
  end
end
