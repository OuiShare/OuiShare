class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  # either define them one-by-one
  # def_delegator :@view, :link_to
  # def_delegator :@view, :h
  # def_delegator :@view, :mail_to

  # or define them in one pass
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path, :other_method, :resource_path



  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['User.fname', 'User.name', 'User.email', 'User.created_at', 'User.profile_type']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['User.fname', 'User.name', 'User.email', 'User.created_at', 'User.profile_type']
  end

  private

  def data
    records.map do |record|
      [
        record.fname,
        record.name,
        record.email,
        record.created_at,
        record.profile_type,
        link_to('Edit', edit_resource_path(record)),
        link_to('Delete', resource_path(record.id), :method => :delete, :confirm => "Are you sure you want to delete this user?")
      ]
    end
  end

  def get_raw_records
    # suppose we need all User records
    # Rails 4+
    User.all
    # Rails 3.x
    # User.scoped
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
