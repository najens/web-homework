# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Homework.Repo
alias Homework.Companies.Company
alias Homework.Users.User
alias Homework.Categories.Category
alias Homework.Merchants.Merchant
alias Homework.Transactions.Transaction

# Categories
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547471", name: "Bills"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547472", name: "Donations"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547473", name: "Education"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547474", name: "Entertainment"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547475", name: "Fast Food"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547476", name: "Fees"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547477", name: "Fitness"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547478", name: "Groceries"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547479", name: "Kids"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547480", name: "Medical"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547481", name: "Paycheck"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547482", name: "Personal Care"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547483", name: "Pets"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547484", name: "Restaurant"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547485", name: "Shopping"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547486", name: "Travel"} |> Repo.insert!
%Category{id: "7c80ca0e-e92a-428a-8583-a0455d547487", name: "Uncategorized"} |> Repo.insert!

# Companies
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547471", name: "Ogre Enterprises"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547472", name: "White Wolf Softwares"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547473", name: "Surge Entertainment"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547474", name: "Phantomedia"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547475", name: "Imaginetworks"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547476", name: "Beedlectrics"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547477", name: "Ironavigation"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547478", name: "Stormhive"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547479", name: "Lionesspaw"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547480", name: "Woodwood"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547481", name: "Hound Softwares"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547482", name: "Fortune Sports"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547483", name: "Jupitelligence"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547484", name: "Labyrintelligence"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547485", name: "Whirlpoolutions"} |> Repo.insert!
%Company{available_credit: 6000000, credit_line: 6000000, id: "7b80ca0e-e92a-428a-8583-a0455d547486", name: "Wonderprises"} |> Repo.insert!

# Users
%User{dob: "01011990", first_name: "Bob", id: "7a80ca0e-e92a-428a-8583-a0455d547471", last_name: "Johnson", company_id: "7b80ca0e-e92a-428a-8583-a0455d547471"} |> Repo.insert! 
%User{dob: "01011991", first_name: "Ryan", id: "7a80ca0e-e92a-428a-8583-a0455d547472", last_name: "Sinatra", company_id: "7b80ca0e-e92a-428a-8583-a0455d547472"} |> Repo.insert!
%User{dob: "01011992", first_name: "Susie", id: "7a80ca0e-e92a-428a-8583-a0455d547473", last_name: "Knowles", company_id: "7b80ca0e-e92a-428a-8583-a0455d547473"} |> Repo.insert!
%User{dob: "01011993", first_name: "Jennifer", id: "7a80ca0e-e92a-428a-8583-a0455d547474", last_name: "Richardson", company_id: "7b80ca0e-e92a-428a-8583-a0455d547474"} |> Repo.insert!     
%User{dob: "01011994", first_name: "Jimmy", id: "7a80ca0e-e92a-428a-8583-a0455d547475", last_name: "Hughes", company_id: "7b80ca0e-e92a-428a-8583-a0455d547475"} |> Repo.insert!
%User{dob: "01011995", first_name: "Howard", id: "7a80ca0e-e92a-428a-8583-a0455d547476", last_name: "Mayfield", company_id: "7b80ca0e-e92a-428a-8583-a0455d547476"} |> Repo.insert!
%User{dob: "01011980", first_name: "Leslie", id: "7a80ca0e-e92a-428a-8583-a0455d547477", last_name: "Grover", company_id: "7b80ca0e-e92a-428a-8583-a0455d547477"} |> Repo.insert!
%User{dob: "01011970", first_name: "Frank", id: "7a80ca0e-e92a-428a-8583-a0455d547478", last_name: "Jackson", company_id: "7b80ca0e-e92a-428a-8583-a0455d547478"} |> Repo.insert!
%User{dob: "01011981", first_name: "George", id: "7a80ca0e-e92a-428a-8583-a0455d547479", last_name: "Lyman", company_id: "7b80ca0e-e92a-428a-8583-a0455d547479"} |> Repo.insert!
%User{dob: "01011982", first_name: "Bill", id: "7a80ca0e-e92a-428a-8583-a0455d547480", last_name: "Clews", company_id: "7b80ca0e-e92a-428a-8583-a0455d547480"} |> Repo.insert!
%User{dob: "01011983", first_name: "David", id: "7a80ca0e-e92a-428a-8583-a0455d547481", last_name: "Lawrence", company_id: "7b80ca0e-e92a-428a-8583-a0455d547481"} |> Repo.insert!
%User{dob: "01011984", first_name: "Mary", id: "7a80ca0e-e92a-428a-8583-a0455d547482", last_name: "Shapiro", company_id: "7b80ca0e-e92a-428a-8583-a0455d547482"} |> Repo.insert!
%User{dob: "01011985", first_name: "Kimberly", id: "7a80ca0e-e92a-428a-8583-a0455d547483", last_name: "Isaacson", company_id: "7b80ca0e-e92a-428a-8583-a0455d547483"} |> Repo.insert!
%User{dob: "01011986", first_name: "Emily", id: "7a80ca0e-e92a-428a-8583-a0455d547484", last_name: "Rasmussen", company_id: "7b80ca0e-e92a-428a-8583-a0455d547484"} |> Repo.insert!
%User{dob: "01011987", first_name: "Francess", id: "7a80ca0e-e92a-428a-8583-a0455d547485", last_name: "Butler", company_id: "7b80ca0e-e92a-428a-8583-a0455d547485"} |> Repo.insert!
%User{dob: "01011988", first_name: "Dwight", id: "7a80ca0e-e92a-428a-8583-a0455d547486", last_name: "Guyman", company_id: "7b80ca0e-e92a-428a-8583-a0455d547486"} |> Repo.insert!

# Merchants
%Merchant{description: "Taco place", id: "7d80ca0e-e92a-428a-8583-a0455d547471", name: "Taco Bell"} |> Repo.insert!
%Merchant{description: "Sandwich place", id: "7d80ca0e-e92a-428a-8583-a0455d547472", name: "Jimmy Johns"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547473", name: "Cubbies"} |> Repo.insert!
%Merchant{description: "Wing place", id: "7d80ca0e-e92a-428a-8583-a0455d547474", name: "Wingers"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547475", name: "Burger King"} |> Repo.insert!
%Merchant{description: "Fast food", id: "7d80ca0e-e92a-428a-8583-a0455d547476", name: "Wendy's"} |> Repo.insert!
%Merchant{description: "Fried chicken", id: "7d80ca0e-e92a-428a-8583-a0455d547477", name: "Popeye's"} |> Repo.insert!
%Merchant{description: "Fried chicken", id: "7d80ca0e-e92a-428a-8583-a0455d547478", name: "Slim Chickens"} |> Repo.insert!
%Merchant{description: "Fried chicken", id: "7d80ca0e-e92a-428a-8583-a0455d547479", name: "Zaxby's"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547480", name: "Smash Burger"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547481", name: "Five Guys"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547482", name: "Burger Bar"} |> Repo.insert!
%Merchant{description: "Burgers and custard", id: "7d80ca0e-e92a-428a-8583-a0455d547483", name: "Culver's"} |> Repo.insert!
%Merchant{description: "Cookie place", id: "7d80ca0e-e92a-428a-8583-a0455d547484", name: "Crumbl"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547485", name: "Red Robin"} |> Repo.insert!
%Merchant{description: "Burger place", id: "7d80ca0e-e92a-428a-8583-a0455d547486", name: "Habit"} |> Repo.insert!

# Transactions
%Transaction{amount: 2000, category_id: "7c80ca0e-e92a-428a-8583-a0455d547471", company_id: "7b80ca0e-e92a-428a-8583-a0455d547471", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547471", user_id: "7a80ca0e-e92a-428a-8583-a0455d547471"} |> Repo.insert!
%Transaction{amount: 2100, category_id: "7c80ca0e-e92a-428a-8583-a0455d547472", company_id: "7b80ca0e-e92a-428a-8583-a0455d547472", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547472", user_id: "7a80ca0e-e92a-428a-8583-a0455d547472"} |> Repo.insert!
%Transaction{amount: 2001, category_id: "7c80ca0e-e92a-428a-8583-a0455d547473", company_id: "7b80ca0e-e92a-428a-8583-a0455d547473", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547473", user_id: "7a80ca0e-e92a-428a-8583-a0455d547473"} |> Repo.insert!
%Transaction{amount: 2002, category_id: "7c80ca0e-e92a-428a-8583-a0455d547474", company_id: "7b80ca0e-e92a-428a-8583-a0455d547474", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547474", user_id: "7a80ca0e-e92a-428a-8583-a0455d547474"} |> Repo.insert!
%Transaction{amount: 2003, category_id: "7c80ca0e-e92a-428a-8583-a0455d547475", company_id: "7b80ca0e-e92a-428a-8583-a0455d547475", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547475", user_id: "7a80ca0e-e92a-428a-8583-a0455d547475"} |> Repo.insert!
%Transaction{amount: 2004, category_id: "7c80ca0e-e92a-428a-8583-a0455d547476", company_id: "7b80ca0e-e92a-428a-8583-a0455d547476", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547476", user_id: "7a80ca0e-e92a-428a-8583-a0455d547476"} |> Repo.insert!
%Transaction{amount: 2005, category_id: "7c80ca0e-e92a-428a-8583-a0455d547477", company_id: "7b80ca0e-e92a-428a-8583-a0455d547477", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547477", user_id: "7a80ca0e-e92a-428a-8583-a0455d547477"} |> Repo.insert!
%Transaction{amount: 2006, category_id: "7c80ca0e-e92a-428a-8583-a0455d547478", company_id: "7b80ca0e-e92a-428a-8583-a0455d547478", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547478", user_id: "7a80ca0e-e92a-428a-8583-a0455d547478"} |> Repo.insert!
%Transaction{amount: 2007, category_id: "7c80ca0e-e92a-428a-8583-a0455d547479", company_id: "7b80ca0e-e92a-428a-8583-a0455d547479", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547479", user_id: "7a80ca0e-e92a-428a-8583-a0455d547479"} |> Repo.insert!
%Transaction{amount: 2008, category_id: "7c80ca0e-e92a-428a-8583-a0455d547480", company_id: "7b80ca0e-e92a-428a-8583-a0455d547480", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547480", user_id: "7a80ca0e-e92a-428a-8583-a0455d547480"} |> Repo.insert!
%Transaction{amount: 2009, category_id: "7c80ca0e-e92a-428a-8583-a0455d547481", company_id: "7b80ca0e-e92a-428a-8583-a0455d547481", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547481", user_id: "7a80ca0e-e92a-428a-8583-a0455d547481"} |> Repo.insert!
%Transaction{amount: 2010, category_id: "7c80ca0e-e92a-428a-8583-a0455d547482", company_id: "7b80ca0e-e92a-428a-8583-a0455d547482", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547482", user_id: "7a80ca0e-e92a-428a-8583-a0455d547482"} |> Repo.insert!
%Transaction{amount: 2011, category_id: "7c80ca0e-e92a-428a-8583-a0455d547483", company_id: "7b80ca0e-e92a-428a-8583-a0455d547483", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547483", user_id: "7a80ca0e-e92a-428a-8583-a0455d547483"} |> Repo.insert!
%Transaction{amount: 2012, category_id: "7c80ca0e-e92a-428a-8583-a0455d547484", company_id: "7b80ca0e-e92a-428a-8583-a0455d547484", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547484", user_id: "7a80ca0e-e92a-428a-8583-a0455d547484"} |> Repo.insert!
%Transaction{amount: 2013, category_id: "7c80ca0e-e92a-428a-8583-a0455d547485", company_id: "7b80ca0e-e92a-428a-8583-a0455d547485", credit: false, debit: true, description: "Credit Card Charge", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547485", user_id: "7a80ca0e-e92a-428a-8583-a0455d547485"} |> Repo.insert!
%Transaction{amount: 2014, category_id: "7c80ca0e-e92a-428a-8583-a0455d547486", company_id: "7b80ca0e-e92a-428a-8583-a0455d547486", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547486", user_id: "7a80ca0e-e92a-428a-8583-a0455d547486"} |> Repo.insert!
%Transaction{amount: 2015, category_id: "7c80ca0e-e92a-428a-8583-a0455d547471", company_id: "7b80ca0e-e92a-428a-8583-a0455d547471", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547471", user_id: "7a80ca0e-e92a-428a-8583-a0455d547471"} |> Repo.insert!
%Transaction{amount: 2016, category_id: "7c80ca0e-e92a-428a-8583-a0455d547472", company_id: "7b80ca0e-e92a-428a-8583-a0455d547472", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547472", user_id: "7a80ca0e-e92a-428a-8583-a0455d547472"} |> Repo.insert!
%Transaction{amount: 2017, category_id: "7c80ca0e-e92a-428a-8583-a0455d547473", company_id: "7b80ca0e-e92a-428a-8583-a0455d547473", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547473", user_id: "7a80ca0e-e92a-428a-8583-a0455d547473"} |> Repo.insert!
%Transaction{amount: 2018, category_id: "7c80ca0e-e92a-428a-8583-a0455d547474", company_id: "7b80ca0e-e92a-428a-8583-a0455d547474", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547474", user_id: "7a80ca0e-e92a-428a-8583-a0455d547474"} |> Repo.insert!
%Transaction{amount: 2019, category_id: "7c80ca0e-e92a-428a-8583-a0455d547475", company_id: "7b80ca0e-e92a-428a-8583-a0455d547475", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547475", user_id: "7a80ca0e-e92a-428a-8583-a0455d547475"} |> Repo.insert!
%Transaction{amount: 2020, category_id: "7c80ca0e-e92a-428a-8583-a0455d547476", company_id: "7b80ca0e-e92a-428a-8583-a0455d547476", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547476", user_id: "7a80ca0e-e92a-428a-8583-a0455d547476"} |> Repo.insert!
%Transaction{amount: 2021, category_id: "7c80ca0e-e92a-428a-8583-a0455d547477", company_id: "7b80ca0e-e92a-428a-8583-a0455d547477", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547477", user_id: "7a80ca0e-e92a-428a-8583-a0455d547477"} |> Repo.insert!
%Transaction{amount: 2022, category_id: "7c80ca0e-e92a-428a-8583-a0455d547478", company_id: "7b80ca0e-e92a-428a-8583-a0455d547478", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547478", user_id: "7a80ca0e-e92a-428a-8583-a0455d547478"} |> Repo.insert!
%Transaction{amount: 2023, category_id: "7c80ca0e-e92a-428a-8583-a0455d547479", company_id: "7b80ca0e-e92a-428a-8583-a0455d547479", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547479", user_id: "7a80ca0e-e92a-428a-8583-a0455d547479"} |> Repo.insert!
%Transaction{amount: 2024, category_id: "7c80ca0e-e92a-428a-8583-a0455d547480", company_id: "7b80ca0e-e92a-428a-8583-a0455d547480", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547480", user_id: "7a80ca0e-e92a-428a-8583-a0455d547480"} |> Repo.insert!
%Transaction{amount: 2025, category_id: "7c80ca0e-e92a-428a-8583-a0455d547481", company_id: "7b80ca0e-e92a-428a-8583-a0455d547481", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547481", user_id: "7a80ca0e-e92a-428a-8583-a0455d547481"} |> Repo.insert!
%Transaction{amount: 2026, category_id: "7c80ca0e-e92a-428a-8583-a0455d547482", company_id: "7b80ca0e-e92a-428a-8583-a0455d547482", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547482", user_id: "7a80ca0e-e92a-428a-8583-a0455d547482"} |> Repo.insert!
%Transaction{amount: 2027, category_id: "7c80ca0e-e92a-428a-8583-a0455d547483", company_id: "7b80ca0e-e92a-428a-8583-a0455d547483", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547483", user_id: "7a80ca0e-e92a-428a-8583-a0455d547483"} |> Repo.insert!
%Transaction{amount: 2028, category_id: "7c80ca0e-e92a-428a-8583-a0455d547484", company_id: "7b80ca0e-e92a-428a-8583-a0455d547484", credit: true, debit: false, description: "Credit Card Refund", merchant_id: "7d80ca0e-e92a-428a-8583-a0455d547484", user_id: "7a80ca0e-e92a-428a-8583-a0455d547484"} |> Repo.insert!
