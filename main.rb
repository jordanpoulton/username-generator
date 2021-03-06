require 'sinatra'

def username_for(firstname, lastname, middlename="")
  (firstname[0] + (middlename[0]||"") + lastname[0,5]).downcase
end

get "/" do
  "To generate a username, navigate to /your_last_name/your_first_name/optional_middlename to generate a username"
end

get "/:lastname/:firstname" do
  firstname = params[:firstname]
  lastname = params[:lastname]
  username = username_for(firstname, lastname)
  "#{firstname} #{lastname}'s username is #{username}"
end

get "/:lastname/:firstname/:middlename" do
  firstname = params[:firstname]
  lastname = params[:lastname]
  middlename = params[:middlename]
  username = username_for(firstname, lastname, middlename)
  "#{firstname} #{middlename} #{lastname}'s username is #{username}"
end
