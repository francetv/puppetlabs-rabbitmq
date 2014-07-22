module Puppet::Parser::Functions
    newfunction(:rabbitmq_instances,:type => :rvalue) do |args|

        tbl=[]
        listip = args[0]
        nameinstance=args[1]
        vtype = args[2]
        cpt=0
        listip['ip'].each do |element|
                tbl << "#{element[1]}"
        end
    tbl
    end
end
