class AddAttachableToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :attachable, polymorphic: true
  end
end
