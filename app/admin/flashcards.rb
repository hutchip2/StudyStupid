ActiveAdmin.register Flashcard do

  menu :priority => 4

  controller { with_role :admin }

  index do
    column :front
    column :back
    column :deck
    default_actions
  end

  filter :front
  filter :back
  filter :deck

  form do |f|
    f.inputs "Flashcard Details" do
      f.input :front
      f.input :back
      f.input :deck
    end
    f.actions
  end

end
  