class CreateOauthTables < ActiveRecord::Migration
  def change
    create_table :oauth_applications do |t|
      t.string :name,         :null => false
      t.string :secret,       :null => false
      t.string :redirect_uri, :null => false
      t.timestamps
    end

    create_table :oauth_access_tokens do |t|
      t.references  :user,               index: true
      t.references  :oauth_application,  index: true, :null => false
      t.string      :token,                           :null => false
      t.string      :scope
      t.datetime    :expires_at
      t.datetime    :revoked_at
      t.timestamps
    end
  end
end
