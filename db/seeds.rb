# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


UserClassfication.create!(user_classfication_name: '一般ユーザー')

User.create!(
  password: 'pass1234',
  last_name: '山田',
  first_name: '太郎',
  zipcode: '1230123',
  prefecture: '東京都',
  municipality: '江東区',
  address: '辰巳1丁目1-1',
  apartments: '101',
  email: 'user01@example.com',
  phone_number: '09012345678',
  user_classfication_id: '1',
  company_name: '株式会社山田建設',
  delete_flag: 'true'
)

User.create!(
  password: "1234word",
  last_name: "鈴木",
  first_name: "花子",
  zipcode: "4560456",
  prefecture: "神奈川県",
  municipality: "横浜市",
  address: "東神奈川2丁目2-2",
  apartments: "202",
  email: "user02@example.com",
  phone_number: "08011112222",
  user_classfication_id: "1",
  company_name: "株式会社鈴木工業",
  delete_flag: "true"
)