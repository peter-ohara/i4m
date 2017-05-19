# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(
  first_name: 'Kwaku',
  last_name: 'Bako',
  phone_number: '0244199900',
  email: 'kwaku.baku@gmail.com'
)

user2 = User.create(
  first_name: 'Andrew',
  last_name: 'Adom',
  phone_number: '0501191603',
  email: 'andrew.adom@gmail.com'
)

institution1 = Institution.create(
  name: 'Legacy Capital'
)

institution2 = Institution.create(
    name: 'Databank'
)


fixed_deposit1 = FixedDepositInvestment.create(
  institution: institution1,
  name: 'Legacy Fixed Deposit - 91 days',
  period_in_days: 91,
  minimum_principal_pesewas: 10000,
  risk_rating: 1,
  links: 'http://legacycapital.com.gh/products_services',
  email: 'info@legacycapital.com.gh',
  phone_number: '027-7506509/027-7508773/050-1339522',
  description: "These offer flexible interest payment plans for tenures of 91, 182 and 365 days respectively.
      Features
  - Minimum investment amount of GHS 1,000.00
  - Very attractive interest rate (Ranging from T –Bill + 2% to 8%) depending on the amount and the tenure.
      - All our rates are negotiable.
          - Prompt payment of investment upon maturity
  - We believe that, it is not only the rate but the security of your investment is what gives us the edge over our competitors."
)


fixed_deposit2 = FixedDepositInvestment.create(
    institution: institution1,
    name: 'Legacy Fixed Deposit - 182 days',
    period_in_days: 182,
    minimum_principal_pesewas: 10000,
    risk_rating: 1,
    links: 'http://legacycapital.com.gh/products_services',
    email: 'info@legacycapital.com.gh',
    phone_number: '027-7506509/027-7508773/050-1339522',
    description: "These offer flexible interest payment plans for tenures of 91, 182 and 365 days respectively.
      Features
  - Minimum investment amount of GHS 1,000.00
  - Very attractive interest rate (Ranging from T –Bill + 2% to 8%) depending on the amount and the tenure.
      - All our rates are negotiable.
          - Prompt payment of investment upon maturity
  - We believe that, it is not only the rate but the security of your investment is what gives us the edge over our competitors."
)