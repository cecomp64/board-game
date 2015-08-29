class AddColorToGeographies < ActiveRecord::Migration
  def change
    add_column :geographies, :color, :string

    colors = [
      "#001f3f",
      "#FF851B",
      "#0074D9",
      "#FF4136",
      "#2ECC40",
      "#DDDDDD"
    ]
    Geography.all.each_with_index do |geo, i|
      geo.color = colors[i]
      geo.save
    end
  end
end
