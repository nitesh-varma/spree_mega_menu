json.array!(@mega_menus) do |mega_menu|
  json.extract! mega_menu, :id
  json.url mega_menu_url(mega_menu, format: :json)
end
