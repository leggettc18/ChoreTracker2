Parent.create!([
  {email: "newuser@gmail.com", encrypted_password: "$2a$11$S1E5mwmlTGzxHUy1DMgtb.WVxYU1vStTEa7spImZNlhByKN.OtSRK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-02 03:19:00", last_sign_in_at: "2017-02-02 03:19:00", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
  {email: "xerranort@gmail.com", encrypted_password: "$2a$11$6Fj5L7ZT7.dYAd/2s8MFs.itDBVyWHYo7o1RaiEuD9zWflhwxAYQ6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2017-02-02 16:38:26", sign_in_count: 6, current_sign_in_at: "2017-02-02 16:38:26", last_sign_in_at: "2017-02-02 05:36:48", current_sign_in_ip: "150.216.127.68", last_sign_in_ip: "75.110.31.209", pincode: "0000"},
  {email: "asdf@asdf", encrypted_password: "$2a$11$6VUsjup9StwnivS5vlwnuOJ5fjiynE.wpQnG9.szE3zdDO9QLh6eC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-02 04:55:13", last_sign_in_at: "2017-02-02 04:55:13", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
  {email: "geno8702@gmail.com", encrypted_password: "$2a$11$SRtAQLuFsvjniuT4WH9OHOYADlAYxzxfZQve/5hmr6fhGc3iQXOu2", reset_password_token: "e3db770637627ee47f4d8007022a90ed2207a996aba6c65942c08ff8a214998a", reset_password_sent_at: "2017-02-02 05:38:32", remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2017-02-03 02:53:17", last_sign_in_at: "2017-02-03 02:19:25", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
  {email: "test@test.com", encrypted_password: "$2a$11$09W59N80twoJUeENra7z7.QTK89O5iG/BIIK20ZRVwj2jCtJdEEOq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2017-02-04 03:04:14", last_sign_in_at: "2017-02-04 02:37:59", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
  {email: "geno@gmail.com", encrypted_password: "$2a$11$E1Pa7TE9pmUCo6N0c.4AZuQi9LLy52.FbhF7oOtvS726P7dGbLadC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-03 12:15:08", last_sign_in_at: "2017-02-03 12:15:08", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"},
  {email: "test@tester.com", encrypted_password: "$2a$11$f5jsGElR1FpzSeUOxJKAn..mT9rxoCw4oajU.Hd2wWOaifTaXEHKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-04 02:58:21", last_sign_in_at: "2017-02-04 02:58:21", current_sign_in_ip: "74.196.85.71", last_sign_in_ip: "74.196.85.71", pincode: "0000"}
])
Child.create!([
  {parent_id: 5, name: "Joey", frozen?: false, balance: 50},
  {parent_id: 5, name: "Steve", frozen?: false, balance: 30},
  {parent_id: 5, name: "JoJO", frozen?: false, balance: 444},
  {parent_id: 0, name: "Joey", frozen?: false, balance: 0},
  {parent_id: 7, name: "Reginald", frozen?: false, balance: 0},
  {parent_id: 6, name: "Reggie", frozen?: false, balance: 0},
  {parent_id: 6, name: "Bae1", frozen?: false, balance: 0},
  {parent_id: 6, name: "Ron", frozen?: false, balance: 0}
])
