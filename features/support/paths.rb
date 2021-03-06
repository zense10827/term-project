# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  
  
  def path_to(page_name)
    case page_name
    when /^the add page/ then '/course/add'
    when /^the add instructor page/ then '/teacher/add'
    when /^all page/ then '/course/index'
    when /^view instructor page/ then '/teacher/all'
    when /^the information page/ then '/course/information/#{"@course.id"}'
    when /^the edit page/ then '/course/information/#{"@course.id"}/edit'
    when /^the add user page/ then '/user/add'
    when /^the user page/ then '/user/index'
    when /^the search page/ then '/course/search'
    when /^the login page/ then '/user/login'
    when /^the timetable page/ then '/timetable/index'
    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

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
