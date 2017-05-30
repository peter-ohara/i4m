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
  name: '91 day Fixed Deposit',
  period_in_days: 91,
  minimum_principal_pesewas: 10000,
  risk_rating: 1,
  links: 'http://legacycapital.com.gh/products_services',
  email: 'info@legacycapital.com.gh',
  phone_number: '027-7506509/027-7508773/050-1339522',
  description: "Short term investment product offered by the Bank of Ghana on behalf of the Government. Purchasing a treasury bill is lending money to the Government. This is a common method used by governments to borrow money from citizens for development purposes."
)


fixed_deposit2 = FixedDepositInvestment.create(
  institution: institution1,
  name: '182 day Fixed Deposit',
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

fixed_deposit_rate = FixedDepositRate.create(
  fixed_deposit_investment: fixed_deposit1,
  interest_rate: 157892,
  effective_date: '2017-05-19'
)

fixed_deposit_rate2 = FixedDepositRate.create(
  fixed_deposit_investment: fixed_deposit2,
  interest_rate: 167892,
  effective_date: '2017-05-19'
)

mutual_fund1 = MutualFund.create(
  institution: institution2,
  name: 'Mfund',
  minimum_principal_pesewas: 5000,
  debit_order_pesewas: 1000,
  management_fee_rate: 30000,
  min_days_before_withdrawal: 91,
  risk_rating: 1,
  links: 'http://bit.ly/2databank',
  email: 'info@databankgh.com',
  phone_number: '(+233) 302 610610',
  description: "MFund is a low-risk mutual fund that operates as an investment alternative to a savings account to help you meet your short-term financial needs."
)

mutual_fund2 = MutualFund.create(
    institution: institution2,
    name: 'Student Investment Account',
    minimum_principal_pesewas: 2500,
    debit_order_pesewas: 2000,
    management_fee_rate: 30000,
    min_days_before_withdrawal: 365,
    risk_rating: 1,
    links: 'http://bit.ly/2databank',
    email: 'info@databankgh.com',
    phone_number: '(+233) 302 610610',
    description: "This investment package designed specifically for tertiary students. DSIA combines a Databank mutual fund with other benefits such as investment seminars, career planning advice, rewards for staying invested, as well as a membership card that offers discounts at a variety of retail outlets nationwide.

GHS10 management fees"
)

mutual_fund_rate1 = MutualFundRate.create(
  mutual_fund: mutual_fund1,
  unit_price_pesewas: 9392,
  yield_to_date: 1988,
  effective_date: '2017-05-19'
)

mutual_fund_rate2 = MutualFundRate.create(
  mutual_fund: mutual_fund2,
  unit_price_pesewas: 1578,
  yield_to_date: 534,
  effective_date: '2017-05-19'
)

mutual_fund_purchase_attempt1 = MutualFundPurchaseAttempt.create(
  user: user1,
  mutual_fund: mutual_fund1,
  principal_pesewas: 500000
)

mutual_fund_purchase_attempt2 = MutualFundPurchaseAttempt.create(
  user: user1,
  mutual_fund: mutual_fund2,
  principal_pesewas: 100000
)

fixed_deposit_purchase_attempt1 = FdPurchaseAttempt.create(
  user: user1,
  fixed_deposit_investment: fixed_deposit1,
  principal_pesewas: 180000
)

mutual_fund_purchase_attempt2 = FdPurchaseAttempt.create(
  user: user1,
  fixed_deposit_investment: fixed_deposit2,
  principal_pesewas: 560000
)

