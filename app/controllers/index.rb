get '/' do
  @html = generate_single_page
  erb :index
end

post '/' do
  redirect '/'
end
