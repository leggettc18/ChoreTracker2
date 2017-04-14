# Parent.create!([
#   {email: "newuser@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-02 03:19:00", last_sign_in_at: "2017-02-02 03:19:00", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
#   {email: "xerranort@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-02-02 16:38:26", sign_in_count: 6, current_sign_in_at: "2017-02-02 16:38:26", last_sign_in_at: "2017-02-02 05:36:48", current_sign_in_ip: "150.216.127.68", last_sign_in_ip: "75.110.31.209", pincode: "0000"},
#   {email: "asdf@asdf", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-02 04:55:13", last_sign_in_at: "2017-02-02 04:55:13", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
#   {email: "geno8702@gmail.com", password: "password", reset_password_token: "e3db770637627ee47f4d8007022a90ed2207a996aba6c65942c08ff8a214998a", reset_password_sent_at: "2017-02-02 05:38:32", remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2017-02-03 02:53:17", last_sign_in_at: "2017-02-03 02:19:25", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
#   {email: "test@test.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2017-02-04 03:04:14", last_sign_in_at: "2017-02-04 02:37:59", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
#   {email: "geno@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-03 12:15:08", last_sign_in_at: "2017-02-03 12:15:08", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
#   {email: "test@tester.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-04 02:58:21", last_sign_in_at: "2017-02-04 02:58:21", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"}
# ])
# Child.create!([
#   {parent_id: 5, name: "Joey", frozen?: false, balance: 50},
#   {parent_id: 5, name: "Steve", frozen?: false, balance: 30},
#   {parent_id: 5, name: "JoJO", frozen?: false, balance: 444},
#   {parent_id: 0, name: "Joey", frozen?: false, balance: 0},
#   {parent_id: 7, name: "Reginald", frozen?: false, balance: 0},
#   {parent_id: 6, name: "Reggie", frozen?: false, balance: 0},
#   {parent_id: 6, name: "Bae1", frozen?: false, balance: 0},
#   {parent_id: 6, name: "Ron", frozen?: false, balance: 0}
# ])

Reward.create!([
  {cost: 50, auto_approve?: false, parent_id: 5, name: "Jordans",child_id: 1 ,redeemed: false},
  {cost: 20, auto_approve?: true, parent_id: 5, name: "Hoodie",child_id: 1 ,redeemed: false},
  {cost: 100, auto_approve?: true, parent_id: 5, name: "Wayne Concert",child_id: 1 ,redeemed: false},
  {cost: 200, auto_approve?: false, parent_id: 5, name: "PS3",child_id: 1 ,redeemed: false},
  {cost: 5, auto_approve?: true, parent_id: 5, name: "Ice Cream",child_id: 1 ,redeemed: false},
  {cost: 10, auto_approve?: false, parent_id: 5, name: "Mall",child_id: 1 ,redeemed: false},
  {cost: 1, auto_approve?: true, parent_id: 5, name: "A Hug :)",child_id: 1 ,redeemed: false},
  {cost: 75, auto_approve?: false, parent_id: 5, name: "Headphones",child_id: 1 ,redeemed: false},
  {cost: 99, auto_approve?: false, parent_id: 5, name: "49 bucks",child_id: 1 ,redeemed: false},
])
