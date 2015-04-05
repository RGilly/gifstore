class ImagesTable < TableCloth::Base
    column :file do |image|
      image_tag image.file, size: '150x150'
    
    end

    column :title

    column :categories

    actions separator: ' - ' do
      action do |image|
        link_to 'Edit Gif', edit_image_path(image)
      end
      action do |image|
        link_to 'Delete Gif', edit_image_path(image)
      end
  end

  config.table.class = "table table-bordered"   

  # Define columns with the #column method
  # column :name, :email

  # Columns can be provided a block
  #
  # column :name do |object|
  #   object.downcase
  # end
  #
  # Columns can also have conditionals if you want.
  # The conditions are checked against the table's methods.
  # As a convenience, the table has a #view method which will return the current view context.
  # This gives you access to current user, params, etc...
  #
  # column :email, if: :admin?
  #
  # def admin?
  #   view.current_user.admin?
  # end
  #
  # Actions give you the ability to create a column for any actions you'd like to provide.
  # Pass a block with an arity of 2, (object, view context).
  # You can add as many actions as you want.
  # Make sure you include the actions extension.
  #
  # actions do
  #   action {|object| link_to "Edit", edit_object_path(object) }
  #   action(if: :valid?) {|object| link_to "Invalidate", invalidate_object_path(object) }
  # end
  #
  # If action provides an "if:" option, it will call that method on the object. It can also take a block with an arity of 1.
end
