class ApplicationController < ActionController::API

  def authentication
    puts "Your secret: #{secret}"
    decode_data = decode_user_data(request.headers["token"])
    user_data = decode_data[0]["user_data"] unless !decode_data
    user = User.find(user_data)

    if user
      return true
    else
      render json: { message: "invalid credentials" }
    end
  end

  def encode_user_data(payload)
    token = JWT.encode payload, secret, "HS256"
    return token
  end

  def decode_user_data(token)
    begin
      data = JWT.decode token, secret, true, { algorithm: "HS256" }
      return data
    rescue => e
      puts e
    end
  end

  def decode_user_data(token)
    begin
      JWT.decode token, secret, true, { algorithm: "HS256" }
    rescue => e
      puts e
    end
  end

  def secret
    ENV['SECRET']
  end
end
