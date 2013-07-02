ActiveAdmin.register Deck do
  menu :priority => 3

  index do
    column :title
    default_actions
  end

  filter :title

  form do |f|
    f.inputs "Deck Details" do
      f.input :title
    end
    f.actions
  end

end
