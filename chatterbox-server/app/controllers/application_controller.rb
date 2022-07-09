class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.all.order('created_at ASC').to_json
  end

  post '/messages' do 
    new_message = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    new_message.to_json
  end

  patch '/messages/:id' do
    pat_mess = Message.find(params[:id])
    pat_mess.update(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    pat_mess.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end

end
