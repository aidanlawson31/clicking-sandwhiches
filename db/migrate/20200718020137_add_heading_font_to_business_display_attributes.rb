class AddHeadingFontToBusinessDisplayAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :heading_font_id, :integer

    reversible do |change|
      change.up do
        execute "update business_display_attributes set heading_font_id = 4"
      end
    end
  end
end
