require './config/environment'

use UsersController
use CosmeticsController
run ApplicationController
#can only have single run method (1 application) in this file
#need workaround #use