require "puppet/parameter/boolean"

# Autogenic core type

Puppet::Type.newtype(:azure_table) do
  @doc = "An Azure Cosmos DB Table."

  ensurable

  validate do
    required_properties = []
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[:ensure] == :present && self[property].nil? && self.provider.send(property) == :absent
        raise Puppet::Error, "In azure_table you must provide a value for #{property}"
      end
    end
  end
  newproperty(:id) do
    desc "The unique resource identifier of the database account."
    validate do |value|
      true
    end
  end
  newproperty(:location) do
    desc "The location of the resource group to which the resource belongs."
    validate do |value|
      true
    end
  end
  newparam(:name) do
    isnamevar
    desc "The name of the database account."
    validate do |value|
      true
    end
  end
  newproperty(:properties) do
    desc "The properties of an Azure Cosmos DB Table"
    validate do |value|
      true
    end
  end
  newproperty(:tags) do
    desc ""
    validate do |value|
      true
    end
  end
  newproperty(:type) do
    desc "The type of Azure resource."
    validate do |value|
      true
    end
  end
  newparam(:account_name) do
    desc "Cosmos DB database account name."
    validate do |value|
      true
    end
  end
  newparam(:api_version) do
    desc "Version of the API to be used with the client request. The current version is 2015-04-08."
    validate do |value|
      true
    end
  end
  newparam(:create_update_table_parameters) do
    desc "The parameters to provide for the current Table."
    validate do |value|
      true
    end
  end
  newparam(:resource_group_name) do
    desc "Name of an Azure resource group."
    validate do |value|
      true
    end
  end
  newparam(:subscription_id) do
    desc "Azure subscription ID."
    validate do |value|
      true
    end
  end
end
