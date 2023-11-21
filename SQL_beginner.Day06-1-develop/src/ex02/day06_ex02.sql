select person.name , menu.pizza_name,menu.price, (menu.price - (menu.price * pd.discount/100)) as discount_price,
                                                 pizzeria.name as pizzeria_name
                                                     from person_order inner join menu on menu.id =
                                                     person_order.menu_id
                                                     inner join person on person.id = person_order.person_id
                                                     inner join person_discounts pd on person.id = pd.person_id and pd.pizzeria_id = menu.pizzeria_id
                                                     inner join pizzeria on menu.pizzeria_id = pizzeria.id
order by 1,2