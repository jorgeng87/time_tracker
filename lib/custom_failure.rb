class CustomFailure < Devise::FailureApp
    def http_auth 
      super 
      self.response_body = {}
      self.content_type = 'json' 
    end 
 end
