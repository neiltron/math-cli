require 'CSV'

@api = Math::API.new( accesskey: ENV['MATH_ACCESSKEY'], user_id: ENV['MATH_USERID'], math_url: ENV['MATH_URL'] || 'https://mathematics.io' )

desc "Import Fitbit-exported CSVs"
command [:import] do |c|

  c.desc "Load records from Fitbit CSV"
  c.arg_name 'filename'

  c.command :fitbit do |fitbit|
    fitbit.action do |global,options,args|

      CSV.read(args[0]).each_with_index do |row, i|

        next if i <= 1

        @api.create_records({  timestamp:  row[0],  item_name:   'weight',  amount:  row[1]  })
        @api.create_records({  timestamp:  row[0],  item_name:      'bmi',  amount:  row[2]  })
        @api.create_records({  timestamp:  row[0],  item_name:  'bodyfat',  amount:  row[3]  })

      end

    end
  end

end
