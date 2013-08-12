require 'CSV'
require 'pp'

desc "Import Fitbit-exported CSVs"
command [:import] do |c|

  c.desc "Load records from Fitbit CSV"
  c.arg_name 'filename'
  c.command :fitbit do |fitbit|
    fitbit.action do |global,options,args|

      CSV.read(args[0]).each_with_index do |row, i|

        next if i <= 1

        Mathlog::API.submit({  timestamp:  row[0],  item_name:   'weight',  amount:  row[1]  })
        Mathlog::API.submit({  timestamp:  row[0],  item_name:      'bmi',  amount:  row[2]  })
        Mathlog::API.submit({  timestamp:  row[0],  item_name:  'bodyfat',  amount:  row[3]  })

      end

    end
  end

end
