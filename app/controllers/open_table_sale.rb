register_instance_option :controller do
  Proc.new do
    # Note: This is dummy code. The thing to note is that we aren't
    # rendering a view, just redirecting after taking an action on @object, which
    # will be the user instance in this case.
    @object.open_table
    redirect_to back_or_index
  end
end