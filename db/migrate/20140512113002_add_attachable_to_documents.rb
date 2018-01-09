class AddAttachableToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :attachable, polymorphic: true
  end
end
