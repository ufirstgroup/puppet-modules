Puppet::Type.type(:mysql_common_schema).provide(:mysql) do

  desc "Use mysql as database."

  defaultfor :kernel => 'Linux'

  optional_commands :mysql => 'mysql'
  optional_commands :mysqladmin => 'mysqladmin'

  def mysql_args(*args)
    if @resource[:mgmt_cnf].is_a?(String)
      args.insert(0, "--defaults-file=#{@resource[:mgmt_cnf]}")
    elsif File.file?("#{Facter.value(:root_home)}/.my.cnf")
      args.insert(0, "--defaults-file=#{Facter.value(:root_home)}/.my.cnf")
    end
    args
  end

  def mysql_flush
    mysqladmin(mysql_args("flush-privileges"))
  end

  def create
    mysql(mysql_args("-e", "SOURCE /tmp/common_schema-#{@resource[:version]}.sql"))
    mysql_flush
  end

  def destroy
    mysql(mysql_args("-e", "drop schema 'common_schema'"))
    mysql_flush
  end

  def exists?
    not mysql(mysql_args("-NBe", "SHOW DATABASES LIKE 'common_schema'" )).empty?
  end

end

