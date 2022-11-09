class AddEmailToSubmission < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :email, :string
  end
end
