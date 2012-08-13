class CreateGalleryExtensionSchema < ActiveRecord::Migration

  def self.up     

	  create_table "galleries", :force => true do |t|
		t.string   "name"
		t.string   "slug"
		t.string   "path"
		t.text     "description"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.boolean  "hidden",         :default => false, :null => false
		t.integer  "parent_id"
		t.boolean  "external",       :default => false
		t.integer  "children_count", :default => 0,     :null => false
		t.integer  "created_by"
		t.integer  "updated_by"
		t.integer  "position"
		t.string   "location"
	  end
	  
	  create_table "galleries_keywords", :id => false, :force => true do |t|
		t.integer "gallery_id"
		t.integer "keyword_id"
	  end

	  create_table "gallery_importings", :force => true do |t|
		t.integer  "gallery_id"
		t.string   "path"
		t.datetime "created_at"
		t.datetime "updated_at"
	  end

	  create_table "gallery_item_infos", :force => true do |t|
		t.integer  "gallery_item_id"
		t.string   "name"
		t.string   "value_string"
		t.text     "value_text"
		t.integer  "value_integer"
		t.datetime "value_datetime"
	  end

	  create_table "gallery_items", :force => true do |t|
		t.string   "filename"
		t.string   "content_type"
		t.text     "description"
		t.integer  "gallery_id"
		t.integer  "position"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "name"
		t.string   "extension"
		t.integer  "size"
		t.integer  "height"
		t.integer  "width"
		t.integer  "parent_id"
		t.string   "thumbnail"
		t.integer  "created_by"
		t.integer  "updated_by"
		t.string   "url"
		t.string   "credits"
	  end

	  create_table "gallery_items_keywords", :id => false, :force => true do |t|
		t.integer "gallery_item_id"
		t.integer "keyword_id"
	  end

	  create_table "gallery_keywords", :force => true do |t|
		t.string   "keyword"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.text     "description"
	  end
	  
	  add_column :pages, :base_gallery_id, :integer
  end
  
  def self.down
  	drop_table "galleries"
  	drop_table "galleries_keywords"
  	drop_table "gallery_importings"
  	drop_table "gallery_item_infos"
  	drop_table "gallery_items"
  	drop_table "gallery_items_keywords"
  	drop_table "gallery_keywords"
  	
  	remove_column :pages, :base_gallery_id
  end
  
end

#### Todo's
# Eleminate dependency to attachment_fu
# The following is the original definition
# Maybe, we need a new definition and/or new models

#class AddAttachmentFuFieldsToGalleryItems < ActiveRecord::Migration
#  def self.up     
#    add_column :gallery_items, :size,       :integer  
#    add_column :gallery_items, :height,     :integer  
#    add_column :gallery_items, :width,      :integer  
#    add_column :gallery_items, :parent_id,  :integer  
#    add_column :gallery_items, :thumbnail,  :string
#  end
#  
#  def self.down
#    remove_column :gallery_items, :size
#    remove_column :gallery_items, :height
#    remove_column :gallery_items, :width
#    remove_column :gallery_items, :parent_id
#    remove_column :gallery_items, :thumbnail
#  end
#end
