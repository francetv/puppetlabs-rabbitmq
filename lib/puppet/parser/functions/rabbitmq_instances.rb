module Puppet::Parser::Functions
    newfunction(:rabbitmq_instances,:type => :rvalue) do |args|
        tbl=""
        listip = args[0]
        nameinstance=args[1]
        vtype = args[2]
        cpt=0
        if vtype == "full" 
            listip['ip'].each do |element|
                if cpt == 0
                  tbl=tbl+"#{nameinstance}"+"@"+"#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{listip[0]}"
                else
                  tbl=tbl+", #{nameinstance}"+"@"+"#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{listip[0]}"
                end
            cpt=cpt++
            end
        else
            listip['ip'].each do |element|
                if element == lookupvar('ipaddress') 
                    tbl = "#{nameinstance}"+"@"+"#{lookupvar('project')}-#{lookupvar('ftven_env')}-#{lookupvar('role')}-#{listip[0]}"
                end
            end
        end
        tbl
    end
end
