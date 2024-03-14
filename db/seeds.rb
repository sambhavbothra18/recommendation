# db/seeds.rb
# Create some sample users and items
User.create(name: 'User 1')
User.create(name: 'User 2')

Item.create(name: 'Item 1')
Item.create(name: 'Item 2')

# Create some sample interactions between users and items
UserItemInteraction.create(user_id: 1, item_id: 1, rating: 5)
UserItemInteraction.create(user_id: 1, item_id: 2, rating: 4)
UserItemInteraction.create(user_id: 2, item_id: 1, rating: 3)
UserItemInteraction.create(user_id: 2, item_id: 2, rating: 2)

# Add more interactions as needed

