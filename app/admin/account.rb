ActiveAdmin.register Account do     

  menu :priority => 2

  controller { with_role :admin }

  index do
    column :email
    column :first_name
    column :last_name
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :role

  form do |f|
    f.inputs "Account Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def set_current_deck
      self.current_deck_id = params[:deck_id]
      self.update_attribute(:current_deck_id, params[:deck_id])
      self.save
    end
  end

end
