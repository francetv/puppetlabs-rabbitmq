module Puppet::Parser::Functions
  newfunction(:rabbitmq_instances,:type => :rvalue) do |args|
    tbl          = ''
    listip       = args[0]
    nameinstance = args[1]
    vtype        = args[2]
    node         = []
    Puppet.debug("VALUE = #{nameinstance} - #{vtype} - #{listip[0]} ")
    if vtype == "full"
      listip['ip'].each do |element|
        node.push("#{nameinstance}"+"@"+"#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{listip[0]}")
      end
      tbl = node.join(', ')
     else
      listip['ip'].each do |element|
        if element == lookupvar('ipaddress')
          tbl = "#{nameinstance}"+"@"+"#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{listip[0]}"
        end
      end
    end
    Puppet.debug("VALUE = #{tbl}")
    return tbl
  end
end
