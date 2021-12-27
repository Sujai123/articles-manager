class PostAutoshowingSMS < ConfigSetting

  store :config_value, coder: JSON, accessors: [
    :is_pets,
    :is_felony,
    :is_evicted,
    :no_of_cats,
    :no_of_dogs,
    :eviction_year,
    :is_bankruptcy,
    :landlord_debt,
    :largest_breed,
    :household_income,
    :move_in
  ]

end