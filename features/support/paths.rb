module NavigationHelpers
   
    def path_to(page)
      case page
        
      when 'Requests'
        '/requests'
      when 'new_request'
        '/requests/new'
      when 'Claims'
        '/claims'
      when 'Show'
        'requests/4'
      when 'Home'
        '/'
  
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
