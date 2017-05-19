# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

legacy_capital = Institution.create(
    name: "Legacy Capital",
    description: "Legacy Capital Savings and Loans Company Limited, is a Ghanaian owned company.
It started operations on the 1st of November,2011 as a Microfinance Company. It was licensed by the Bank of Ghana on 17th August,2016 under the Non-Bank Financial Institution Law 2008 (Act 774), to operate as a savings and loans company.
It's headquarted at Kuku Hill, Osu within the capital's diverse arena. Since 2011, the trails of Legacy Capital on the financial and banking landscape of Ghana have been gradually distinct, with our fully-networked branches accross the country.
We offer attractive products, competitive interest rates; prompt service delivery and professional competence for service delivery.
Legacy Capital is dedicated to distinguishing itself through excellence. In view of this we seek to provide our valued customers with convenient, tailored and reliable banking products and services through our robust IT infastructure and dedicated team of professionals.
We offer a range of personal, business and institutional financial solutions that are designed to deliver optimum value to our customers.
With an e-business suite and a branch expansion drive, Legacy Capital gives you several reasons to patronise any of our products.
We are committed to truly understanding your business. We work as an extension of your own team-trusted,dedicated, accessible and responsive.
Legacy Capital...Banking for your Legacy"
)

cash_is_king_fixed_deposit = FixedDepositInvestment.create(
    institution: legacy_capital,
    name: "Cash is King Fixed Deposit",
    description: "Features
    - Customer deposit money for a fixed period of time not less than 6 months.
    - No premature withdrawal is allowed.
    - Interest rate is prevailing Treasury Bill rate plus up to 7%.
    - Interest is paid monthly to the customers preferred account at any bank.
    - The deposit could be used as a collateral for a loan (the loan would be obtained within 12 hours upon receipt of request)
    - A certificate of deposit is issued.",
    tenure: 182, # 6 months = 182 days
    minimum_principal_pesewas: 10 * 100
)


legacy_fixed_deposit_91_days = FixedDepositInvestment.create(
    institution: legacy_capital,
    name: "Legacy Fixed Deposit - 91 days",
    description: "These offer flexible interest payment plans for tenures of 91, 182 and 365 days respectively.
		Features
		- Minimum investment amount of GHS 1,000.00
		- Very attractive interest rate (Ranging from T –Bill + 2% to 8%) depending on the amount and the tenure.
		- All our rates are negotiable.
		- Prompt payment of investment upon maturity
		- We believe that, it is not only the rate but the security of your investment is what gives us the edge over our competitors.",
    tenure: 91,
		minimum_principal_pesewas: 1000 * 100
)


cash_is_king_interest_rate = FixedDepositRate.create(
    fixed_deposit_investment: cash_is_king_fixed_deposit,
    interest_rate: (15.3181 + 7) * 1000,
    start_date: "Monday May 15, 2017",
)


cash_is_king_interest_rate = FixedDepositRate.create(
		fixed_deposit_investment: legacy_fixed_deposit_91_days,
		interest_rate: (15.3181 + 2) * 1000,
		start_date: "Monday May 15, 2017",
)