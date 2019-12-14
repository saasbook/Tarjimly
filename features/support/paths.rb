module NavigationHelpers
   
    def path_to(page)
      case page
        
      when 'Requests'
        '/requests'
      when 'requests'
        '/requests'
      when '/requests'
        '/requests'
      when 'new_request'
        '/requests/new'
      when 'Claims'
        '/claims'
      when 'Translator Requests'
        '/translators/requests'
      when 'Show'
        'requests/4'
      when 'Home'
        '/'
      when 'translators/requests'
        '/translators/requests'
  
      else
        begin
          page_name =~ /^the (.*) page$/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue NoMethodError, ArgumentError
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
            "Now, go and add a mapping in #{__FILE__}"
        end
      end
    end
  end

  World(NavigationHelpers)
