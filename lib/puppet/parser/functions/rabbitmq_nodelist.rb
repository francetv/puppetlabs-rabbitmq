module Puppet::Parser::Functions
  newfunction(:rabbitmq_nodelist,:type => :rvalue) do |args|
    tbl          = []
    listip       = args[0]
    nameinstance = args[1]
    vtype        = args[2]
    Puppet.debug("VALUE = #{nameinstance} - #{vtype} - #{listip} ")
    if vtype == "full"
      listip['ip'].each do |element|
        tbl << "#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{element[0]}"
      end
     else
      listip['ip'].each do |element|
        if element[1] == lookupvar('ipaddress')
          tbl << "#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{element[0]}"
        end
      end
    end
    Puppet.debug("VALUE = #{tbl}")
    return tbl
  end
end
