require "sinatra"
require "dotenv/load"
require_relative "./controllers/register_controller"
require_relative "./controllers/login_controller"
require_relative "./controllers/post_controller"

enable :sessions

set :session_secret, ENV['SESSION_SECRET']

use RegisterController
use LoginController
use PostController
