# OOD Exercise: Identifying Class Methods

## Learning Goals
- Identify what methods should be class methods from the provided ruby code


### Code Snippet One: Email
ruby ```

class Email
  attr_accessor :title, :message
  attr_reader :sender

  def initialize(params)
    @sender = params[:sender]
    @recipients = [] || params[:recipients]
    @title = params[:title]
    @message = params[:message]

    @date_sent
  end

  def send_email

  end

  def add_recipient

  end

  def find_email_by_id(id)

  end

  def delete_emails_from_specific_sender(sender)
    
  end


  def find_emails_by_title()
  end


end



```


### Code Snippet Two: Something
ruby ```

class Something


end



```


### Code Snippet Two: Something
ruby ```

class Something


end



```
