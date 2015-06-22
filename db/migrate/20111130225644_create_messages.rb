class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string   :who
      t.text     :what
      t.datetime :when
      t.string   :channel
    end
    add_index :messages, [:channel, :when]
  end
end
