# User Auth Notes

# General Notes
- Any bad data inputs will be mentioned in the spec
- Don't waste time with indexing, specs will catch bad validations
- Comment views can all be handled within views/links/show.html.erb


## User Model
### Attributes
- username
- password_digest
- session_token
- @password [minimum: 6, allow_nil: true]

### Class Methods
- ::find_by_credentials(username, password)
- ::generate_session_token  [optional]
- ::attr_reader :password

### Instance Methods
- password=(password)
- valid_password?(password)
- reset_token!
- ensure_session_token [private]

## Application Controller
- helper_method
  - :current_user
  - :signed_in?
- current_user [@current_user ||= User.find_by(...)]
- signed_in?
- log_in_user!(user)
- sign_out
- require_signed_in! [redirect unless signed_in?]


## Sessions Controller
- new [empty unless persistence required]
- create [ User.find_by_credentials, custom error if @user.nil? ]
- destroy [ sign_out & redirect]

## Session status buttons
Located in application.html.erb (emphasis on less new files)
- if signed_in?
  - current_user.username
  - button_to "Sign Out"
- else
  - link_to "Sign In"
  - link_to "Sign Out"
- end


## Controllers General
```
class LinksController < ApplicationController
  before_filter :require_signed_in!

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to links_url
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
```


## Forms
```
#/views/users/new.html.erb
<form action="<%= users_url %>" method="post">
  <input
    type=hidden
    name="authenticity_token"
    value="<%= form_authenticity_token %>">

  <label>
    Username
    <input type="text" name="user[username]" value="">
  </label>

  <label>
    Password
    <input type="password" name="user[password]" value="">
  </label>

  <input type="submit" value="Sign Up">
</form>
```

## flash
```
#/views/layouts/_errors.html.erb
 <%= flash[:errors].join("<br>").html_safe if flash[:errors] %>
```


## Comments
- dodn't use partials, keep code readable and in one place(for now)
-
