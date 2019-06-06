print "Checking #{"RAILS_ENV".light_cyan} environment variable => #{Rails.env.green} \n"
    env_vars = [
      "OPEN_WEATHER_MAP_APP_ID",
      "DARK_SKY_SECRET_KEY",
      "GOOGLE_MAP_API_KEY",
      "BING_MAP_API_KEY"
    ]
  

  

    OPEN_WEATHER_MAP_APP_ID = ENV['OPEN_WEATHER_MAP_APP_ID']
    DARK_SKY_SECRET_KEY = ENV['DARK_SKY_SECRET_KEY']
    GOOGLE_MAP_API_KEY = ENV['GOOGLE_MAP_API_KEY']
    BING_MAP_API_KEY = ENV['BING_MAP_API_KEY']

    
    if Rails.env.development?
        # All API keys should keep in your local env_vars. 
        # I keep them here in order to let Rewind make less work before run the server.
        ENV['OPEN_WEATHER_MAP_APP_ID'] = 'fbbd8920cccc59c7f9f663cff7ff6bf3'
        ENV['DARK_SKY_SECRET_KEY'] = 'c7b5a635bbde3034e8a39316d2110cc5'
        ENV['GOOGLE_MAP_API_KEY'] = 'AIzaSyCg_yz3C-Qwbcc10OE0F4hMjb39M4vExSY'
        ENV['BING_MAP_API_KEY'] = 'As-nQIMzT0y1JjkHCZBRFQ9qVtfyQXsONtTr1AEal8Nc4IAgaKD6Hk5Yz7_Wv35T'
    end

    env_vars.each do |var|
        print "Checking #{var.light_cyan} environment variable => "
        unless ENV[var].blank?
          puts "FOUND".green
        else
          puts "MISSING".red
          raise "#{var} is missing"
        end
    end
    
    
  