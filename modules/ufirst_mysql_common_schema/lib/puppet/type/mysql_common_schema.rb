Puppet::Type.newtype(:mysql_common_schema) do
  @doc = "Manage the common schema installation."

  ensurable

  newparam(:version, :namevar => true) do
    desc "The version of the common_schema framework"

    validate do |value|
      # https://dev.mysql.com/doc/refman/5.1/en/account-names.html
      # Regex should problably be more like this: /^[`'"]?[^`'"]*[`'"]?@[`'"]?[\w%\.]+[`'"]?$/
      raise(ArgumentError, "Invalid version #{value}") unless (value == '2.1' or value == '2.2')
    end
  end

  newparam(:mgmt_cnf) do
    desc "The my.cnf to use for calls."
  end

end
