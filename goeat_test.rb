requier 'test/unit'

class GoEatTest <Test::Unit::TestClass
  def test_search_phrase
    wroclaw = City.new
    u_macieja = Restaurant.new
    u_macieja.name = "U Macieja"
    u_leona = Restaurant.new
    u_leona.name = "U Leona"

    wroclaw.add_new_restaurant(u_macieja)
    wroclaw.add_new_restaurant(u_leona)

    assert_equels [u_macieja, u_leona], wroclaw.sreach_phrase("U")
    assert_equels [u_leona], wroclaw.sreach_phrase("Leon")
  end
  def test_search_dish
    wroclaw = City.new
    cleopatra = Restaurant.new
    cleo_menu = Menu.new
    kebab = Dish.new("Kebab", 10.00)

    cleo_menu.add_dish(kebab)
    cleopatra.add_new_menu(cleo_menu)
    wroclaw.add_new_restaurant(cleopatra)

    assert_equels [cleopatra], wroclaw.sreach_dish("kebab")
  end
  def test_search_category
    wroclaw = City.new
    fast_food = Category.new
    tawerna = Category.new

    mc_donald = Restaurant.new
    mc_donald.Category = fast_food
    roza_wiatrow = Restaurant.new
    roza_wiatrow.Category = tawerna

    wroclaw.add_new_restaurant(roza_wiatrow)
    wroclaw.add_new_restaurant(mc_donald)

    assert_equels [roza_wiatrow], wroclaw.get_restaurants_by_category(tawerna)
    assert_equels [roza_wiatrow, mc_donald], wroclaw.get_all_restaurants
  end
  def test_rating
    wroclaw = City.new
    pod_papugami = Restaurant.new
    wroclaw.add_new_restaurant(pod_papugami)
    czerwona_cebula = Restaurant.new
    wroclaw.add_new_restaurant(czerwona_cebula)

    ania = new User 
    ania.add_stars(4, pod_papugami)
    ania.add_stars(5, czerwona_cebula)

    assert_equels [czerwona_cebula, pod_papugami], wroclaw.top10
  end
  def test_favourites
    wroclaw = City.new
    smaczek = Restaurant.new
    wroclaw.add_new_restaurant(smaczek)

    ania = new User
    ania.add_favourite(smaczek)

    assert_equels [smaczek], ania.get_favourites
    assert_equels 1, smaczek.count_popularity
  end
end