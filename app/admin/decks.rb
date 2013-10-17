ActiveAdmin.register Deck do

  menu :priority => 3

  controller { with_role :admin }

  index do
    column :title
    column :account
    default_actions
  end

  filter :title
  filter :account

  form do |f|
    f.inputs "Deck Details" do
      f.input :title
      f.input :account
    end
    f.actions
  end

end
