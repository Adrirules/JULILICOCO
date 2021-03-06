include RailsAdminTagList::SuggestionsHelper
RailsAdmin.config do |config|
  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user && current_user.admin
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  config.model Article do
    edit do
     configure :content, :ck_editor
    end
  end
  ## == Cancan ==
  # config.authorize_with :cancan





  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Article do
    edit do
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'

        # the option sets max count of suggestions (default is 100); set -1 to abolish the limit
        ratl_max_suggestions -1
      end
    end
  end
   #   config.model Article do
   #   list do
   #     field :title
   #     field :chapo
   #     field :content
   #     field :photo
   #     field :tag_list
   #     field :slug
   #     field :user
   #   end

   #   edit do
   #     field :title
   #     field :chapo
   #     field :content
   #     field :photo

   #     field :tag_list do
   #       html_attributes do
   #         {:style => "width:90%"}
   #       end
   #     end
   #     field :slug
   #     field :user
   #   end
   # end
end
