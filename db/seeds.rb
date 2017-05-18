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
    description: "Features\n
    - Customer deposit money for a fixed period of time not less than 6 months.\n
    - No premature withdrawal is allowed.\n
    - Interest rate is prevailing Treasury Bill rate plus up to 7%.\n
    - Interest is paid monthly to the customers preferred account at any bank.\n
    - The deposit could be used as a collateral for a loan (the loan would be obtained within 12 hours upon receipt of request)\n
    - A certificate of deposit is issued.",
    tenure: 6*30.4167, # 6 months = 6 * avg_days_in_a_month
    minimum_principal_pesewas: 10 * 100
)