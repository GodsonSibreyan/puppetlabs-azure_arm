require "puppet/parameter/boolean"

# Autogenic core type

Puppet::Type.newtype(:azure_device_service) do
  @doc = "The description of the Windows IoT Device Service."

  ensurable

  validate do
    required_properties = []
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[:ensure] == :present && self[property].nil? && self.provider.send(property) == :absent
        raise Puppet::Error, "In azure_device_service you must provide a value for #{property}"
      end
    end
  end
  newproperty(:etag) do
    desc "The Etag field is *not* required. If it is provided in the response body, it must also be provided as a header per the normal ETag convention."
    validate do |value|
      true
    end
  end
  newproperty(:id) do
    desc "Fully qualified resource Id for the resource"
    validate do |value|
      true
    end
  end
  newproperty(:location) do
    desc "The Azure Region where the resource lives"
    validate do |value|
      true
    end
  end
  newparam(:name) do
    isnamevar
    desc "The name of the resource"
    validate do |value|
      true
    end
  end
  newproperty(:properties) do
    desc "The properties of a Windows IoT Device Service."
    validate do |value|
      true
    end
  end
  newproperty(:tags) do
    desc "Resource tags."
    validate do |value|
      true
    end
  end
  newproperty(:type) do
    desc "The type of the resource."
    validate do |value|
      true
    end
  end
  newparam(:api_version) do
    desc "The version of the API."
    validate do |value|
      true
    end
  end
  newparam(:device_name) do
    desc "The name of the Windows IoT Device Service."
    validate do |value|
      true
    end
  end
  newparam(:device_service) do
    desc "The Windows IoT Device Service metadata and security metadata."
    validate do |value|
      true
    end
  end
  newparam(:resource_group_name) do
    desc "The name of the resource group that contains the Windows IoT Device Service."
    validate do |value|
      true
    end
  end
  newparam(:subscription_id) do
    desc "The subscription identifier."
    validate do |value|
      true
    end
  end
end
