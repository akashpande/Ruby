rails new sti
cd sti

bin/rails generate model Post name:string email:string type:string
cd app/model

touch user.rb
touch admin.rb

echo "class User < Person 
has_many :posts 
end" >> user.rb

echo "class Admin < Person 
has_many :accounts 
end" >> admin.rb 

bin/rails generate model Post content:string description:string user:references
bin/rails g model Account account_number:integer admin:references

bin/rake db:migrate

rails c

admin = Admin.create(name:'Akash',email: 'akashpande@gmail.com')

admin_account = admin.accounts.build(account_number: 98765432)
admin_account.save


user_1 = User.create(name:'Rahul',email:'rahulsingh@gmail.com')
user_2 = User.create(name:'Sudeep',email:'sudeeptarlekar@gmail.com')
user_3 = User.create(name:'Vaibhav',email:'vaibhavdhoke@gmail.com')

post_user_1 = user_1.posts.build(content:"Spectacles",description:"Usefull for even headache")
post_user_2 = user_2.posts.build(content:"Politics",description:"No comments")
post_user_3 = user_3.posts.build(content:"Sports",description:"You should try it")
post_user_1.save
post_user_2.save
post_user_3.save

