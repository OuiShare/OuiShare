class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['User.fname', 'User.name', 'User.email']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['User.fname', 'User.name', 'User.email']
  end

  private

  def data
    records.map do |record|
      [
        record.fname,
        record.name,
        record.email
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
