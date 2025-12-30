

= Quantitative Analyst (Quant) Roles in Sales and Trading

== Overview

Quantitative Analysts ("Quants") in Sales and Trading divisions develop and maintain the mathematical models, pricing systems, and risk analytics that underpin derivatives trading. In Australia, quant teams exist at global banks (UBS, Goldman Sachs, J.P. Morgan, Morgan Stanley) and local institutional banks (Macquarie Group, major ADIs' institutional divisions).

Quants bridge mathematics, computer science, and finance - building models for exotic derivatives, developing risk systems, and creating trading tools. The role has become increasingly critical with market complexity, regulatory requirements (CVA, capital calculations), and electronic trading evolution.

#pagebreak()

== 1. Junior Quant / Quantitative Analyst

=== Hierarchy Level
Entry-level, typically requiring advanced quantitative degree (Masters or PhD)

=== Key Activities and Responsibilities
- *Model Implementation*: Coding pricing models developed by senior quants into production systems
- *Model Validation*: Testing models against market data, identifying discrepancies
- *Calibration*: Fitting model parameters to market prices (e.g., volatility surfaces)
- *Documentation*: Writing technical specifications for models and systems
- *Support*: Assisting traders with pricing questions and model usage
- *Research*: Investigating new methodologies from academic literature
- *Tool Development*: Building spreadsheets and scripts for traders' use

=== Required Skills

*Technical:*
- Strong mathematical foundation (stochastic calculus, PDEs, numerical methods)
- Programming proficiency (C++, Python, R; increasingly Python for prototyping)
- Understanding of derivatives pricing theory (Black-Scholes, term structure models, etc.)
- Numerical methods (Monte Carlo, finite difference, tree methods)
- Statistical analysis and time series econometrics
- Version control (Git) and software development practices

*Interpersonal:*
- Ability to communicate complex mathematics to traders
- Collaborative approach to problem-solving
- Attention to detail and rigorous testing mindset
- Ability to handle multiple competing priorities
- Intellectual humility and willingness to learn

*Regulatory:*
- Understanding of model risk management frameworks
- Awareness of capital regulations (CVA, VaR models)
- Familiarity with OTC derivatives regulatory reforms
- Knowledge of model validation requirements

=== Typical Work Modes

*Model Development & Implementation (60-70%):*
- Coding pricing models and risk analytics
- Testing and debugging quantitative systems
- Calibrating models to market data
- Running performance analysis

*Research & Learning (15-20%):*
- Reading academic papers on derivatives pricing
- Investigating new methodologies
- Studying market instruments and conventions
- Learning new programming techniques

*Collaboration (10-15%):*
- Working with traders on pricing issues
- Meetings with senior quants on model design
- Coordination with technology team on system integration
- Model validation discussions

*Documentation (5-10%):*
- Writing technical specifications
- Documenting code and methodologies
- Creating user guides for traders

=== A Day in the Life

*8:00am - 8:30am*: Arrive and check overnight batch runs. Your team (Rates Quants) supports interest rate derivatives trading desk. Overnight: calibration of swaption vol surface completed successfully, but USD curve build failed due to data issue. Investigate: missing LIBOR fixing from data feed. Fix by manually entering rate from Bloomberg, restart curve build. Make note to improve error handling in production code.

*8:30am - 9:00am*: Daily quant team meeting. Senior quant reviews priorities: 1) Continue work on SABR stochastic volatility model for AUD swaptions (your project), 2) Support urgent trader request for exotic barrier option pricer, 3) Begin CVA (Credit Valuation Adjustment) system upgrade for new regulation. You're assigned to SABR model continuation + support barrier option work.

*9:00am - 10:30am*: Deep work on SABR model implementation. You're building a production-quality pricer for AUD interest rate swaptions using SABR (Stochastic Alpha Beta Rho) stochastic volatility model. Current system uses simpler Black-Scholes with flat volatility assumption - inadequate for exotic swaptions traders want to price.

Code the SABR model PDE (partial differential equation) solver using finite difference method. Implement calibration routine that fits SABR parameters (alpha, beta, rho, nu) to market swaption prices. Challenge: calibration is unstable for some parameter sets - optimizer diverges. Investigate numerically stable calibration approaches from recent paper. Implement constrained optimization with parameter bounds.

*10:30am - 11:00am*: Trader calls: "Can you help price this barrier swaption? Client wants to buy AUD 500mm notional receiver swaption with knock-in barrier if 10yr swap rate rises above 4%." This is outside standard models. You discuss with senior quant - can be priced using Monte Carlo simulation with barrier monitoring. Senior quant asks you to build quick prototype pricer in Python.

*11:00am - 12:30pm*: Build barrier swaption pricer in Python. Implement Monte Carlo engine: 1) Simulate interest rate paths using SABR dynamics, 2) Check barrier condition on each path, 3) Calculate payoff if barrier triggered, 4) Discount and average. Run 100k paths - price converges to 34bp premium. Sensitivity analysis: barrier level very important (30bp if barrier at 4.25% vs 34bp at 4%). Send results to trader with caveats about model assumptions.

Trader responds: "Price looks reasonable vs dealer quotes. Can you also calculate Greeks (delta, gamma, vega)?" Implement finite difference method to calculate sensitivities by bumping underlying factors. Send full pricing report with Greeks to trader.

*12:30pm - 1:30pm*: Lunch while reading recent paper from Journal of Computational Finance on efficient Monte Carlo for barrier options. Interesting variance reduction technique using importance sampling. Could improve pricer performance. Bookmark for future implementation.

*1:30pm - 3:00pm*: Return to SABR implementation. Run calibration tests on historical swaption market data. Good fit for most dates but some dates show poor calibration quality. Investigate: these dates coincide with major market stress (March 2020 COVID, September 2022 UK pension crisis). During stress, simple SABR model insufficient - need term structure of volatility.

Discuss with senior quant: decision to implement term structure extension (time-dependent SABR parameters) but defer for v2 - current implementation adequate for normal markets. Document limitations in technical spec. Write unit tests for calibration routine, achieve 95% code coverage.

*3:00pm - 4:00pm*: Model validation meeting with middle office risk team. They're performing independent validation of exotic derivatives pricing models. Present your barrier swaption prototype model: methodology, assumptions, calibration approach, limitations. Risk team questions: 1) How sensitive is price to barrier monitoring frequency (daily vs continuous)? 2) What's model risk if volatility smile is mispriced? 3) How do you handle barrier breaches near expiry?

You work through each question with supporting analysis. They're satisfied with methodology but request: 1) More extensive calibration testing on historical data, 2) Documentation of model limitations, 3) Comparison with external dealer prices on sample trades. Agree to deliver these within 2 weeks before model approved for production use.

*4:00pm - 5:00pm*: Code review session with senior quant and another junior quant. You're reviewing their work on CVA calculation engine. Walk through their code for calculating counterparty credit exposure via Monte Carlo. Identify potential issue: they're using simple Euler discretization for diffusion which can have large numerical errors for long-dated exposures. Suggest Richardson extrapolation or Milstein scheme for better accuracy. Good discussion on trade-offs between accuracy and performance.

They appreciate feedback - will implement Milstein scheme. This collaborative code review culture is valuable learning environment.

*5:00pm - 6:00pm*: Update SABR project documentation. Write technical specification document describing: 1) Mathematical model formulation, 2) Numerical methods used (PDE solver specs), 3) Calibration procedure and parameter constraints, 4) Validation results against market data, 5) Known limitations and planned enhancements. This doc will be used by traders, risk managers, model validators, auditors - needs to be clear and complete.

Also update user guide for traders: how to use SABR pricer, what inputs required, how to interpret outputs, what sensitivities are calculated. Include screenshots and example workflows.

*6:00pm - 6:30pm*: Wrap-up tasks. Commit day's code to Git repository with detailed commit messages. Update project tracker (Jira) with progress on SABR implementation - now 75% complete, on track for target delivery in 3 weeks. Send email to senior quant summarizing barrier swaption work and model validation meeting outcomes.

*Evening*: Leave around 6:30pm most days. Take home reading: academic paper on stochastic volatility models, chapters from "Interest Rate Models - Theory and Practice" textbook. Weekend often includes thinking through complex modelling problems, but no formal work expected.

=== Career Progression Pathways

*Within 2-4 years:*
- *Quantitative Analyst (Mid-level)*: Taking ownership of model development projects, less supervision
- *Specialist Quant*: Focus on specific domain (vol surface modelling, credit models, FX exotics)

*Within 4-7 years:*
- *Senior Quant*: Leading major projects, designing model frameworks, strategic model selection
- *Quant Strategist*: More research-focused role, publishing external research

*Within 7+ years:*
- *Head of Quant Team*: Managing team, setting research priorities
- *Global Quant Lead*: Leading quants across multiple offices for product area

*Alternative paths:*
- Move to larger bank with more sophisticated quant problems
- Join hedge fund as quant researcher or portfolio manager
- Transition to fintech (quantitative trading platform, algorithmic trading)
- Move to risk management (market risk modelling, model validation)
- Academic research or teaching (sometimes combined with industry role)
- Data science / ML role at tech company

#pagebreak()

== 2. Quantitative Analyst (Mid-level)

=== Hierarchy Level
3-6 years of experience, independent model development

=== Key Activities and Responsibilities
- *Model Design*: Leading design of pricing and risk models for derivatives products
- *Production Systems*: Building robust, high-performance systems for trading desks
- *Research*: Investigating cutting-edge methods from academic literature
- *Problem Solving*: Troubleshooting complex pricing and risk issues for traders
- *Methodology Selection*: Choosing appropriate numerical methods for different problems
- *Code Quality*: Writing maintainable, well-tested production code
- *Cross-Functional*: Working with technology, risk, and compliance teams

=== Required Skills

*Technical:*
- Expert-level derivatives mathematics (stochastic calculus, optimal stopping, measure theory)
- Advanced programming (C++ for performance, Python for prototyping, possibly Julia/R)
- Deep understanding of numerical methods and their trade-offs
- Knowledge of market conventions across asset classes
- Experience with production systems architecture
- Machine learning techniques increasingly important (calibration, hedging optimization)

*Interpersonal:*
- Translating trader needs into technical requirements
- Defending model choices under scrutiny
- Teaching/mentoring junior quants
- Collaborating with non-technical stakeholders
- Managing expectations on model capabilities/limitations

*Regulatory:*
- Deep understanding of model risk management (SR 11-7 in US, equivalent frameworks)
- Familiarity with capital calculations (CVA, VaR, stressed VaR)
- Knowledge of FRTB (Fundamental Review of Trading Book) requirements
- Understanding of model validation and governance

=== Typical Work Modes

*Model Development (50-60%):*
- Designing and implementing complex models
- Building production pricing and risk systems
- Performance optimization and refactoring
- Model calibration and validation

*Research & Innovation (20-25%):*
- Reading academic papers and implementing new methods
- Prototyping novel approaches
- Benchmarking different methodologies
- Contributing to model selection decisions

*Collaboration (15-20%):*
- Supporting traders with complex pricing
- Working with risk team on validation
- Coordinating with technology on infrastructure
- Educating stakeholders on models

*Documentation & Communication (5-10%):*
- Writing technical papers and specifications
- Presenting to traders and risk committees
- Creating user documentation

=== Career Progression Pathways

*Within 3-5 years:*
- *Senior Quant*: Leading major model development initiatives, making strategic model architecture decisions
- *Quant Strategist*: More research-focused, less implementation
- *Model Validation*: Transition to independent review role

*Within 5-8 years:*
- *Head of Quant Team*: Leading team of quants for specific asset class or product
- *Quant Portfolio Manager*: Using quant skills in investment decision-making
- *Risk Quant Lead*: Leading market risk modeling or model validation function

*Within 8+ years:*
- *Global Head of Quants*: Leading quant function across all asset classes/regions
- *CRO or Deputy CRO*: Transition to risk management leadership

*Alternative paths:*
- Hedge fund quant researcher or PM (systematic strategies)
- Proprietary trading firm (quantitative trading strategies)
- Fintech quantitative role (algorithmic trading, pricing engines)
- Academic position (professor/researcher, often combined with industry)
- Data science / ML engineering at tech company
- Startup founder (quant-focused fintech)

#pagebreak()

== 3. Senior Quant / Quant Team Lead

=== Hierarchy Level
7-12+ years of experience, strategic leadership of quantitative function

=== Key Activities and Responsibilities
- *Strategic Model Direction*: Selecting frameworks and approaches for complex products
- *Team Leadership*: Managing 3-8 quants, setting research priorities, hiring
- *Model Governance*: Ensuring models meet regulatory requirements and best practices
- *Innovation*: Driving adoption of new methodologies (ML, advanced numerics)
- *Risk Partnership*: Working closely with market risk, model validation, and trading
- *Regulatory Interface*: Responding to regulator inquiries about models
- *External Engagement*: Publishing research, attending conferences, academic collaboration
- *Business Development*: Supporting new product launches with quantitative capabilities

=== Required Skills

*Technical:*
- Deep expertise across multiple quantitative domains (pricing, risk, optimization)
- Strategic thinking about model architecture and technology choices
- Understanding of computational infrastructure and high-performance computing
- Knowledge of regulatory frameworks for model risk management
- Awareness of industry best practices and emerging techniques

*Interpersonal:*
- Leadership and people management
- Influencing senior stakeholders (traders, risk managers, executives)
- Building collaborative culture among competitive quants
- External representation of firm's quant capabilities
- Managing conflicts between model sophistication and practical constraints

*Regulatory:*
- Expert understanding of model risk management frameworks
- Deep knowledge of capital regulations (CVA, VaR, FRTB)
- Familiarity with regulatory examination processes
- Understanding of model validation requirements and governance

=== Typical Work Modes

*Strategic Leadership (40-50%):*
- Setting research priorities and model development roadmap
- Making key architectural decisions for model frameworks
- Resource allocation and hiring
- Building team culture and capabilities

*Technical Work (25-35%):*
- Leading most complex model development projects
- Reviewing and validating critical models
- Researching cutting-edge methodologies
- Troubleshooting most difficult pricing/risk issues

*Stakeholder Management (20-25%):*
- Working with trading desks on strategy and new products
- Partnering with risk and compliance on governance
- Regulatory examinations and responses
- Senior management reporting on model capabilities

*External Engagement (5-10%):*
- Publishing research and presenting at conferences
- Academic collaborations and recruiting
- Industry forums and standard-setting bodies

=== Career Progression Pathways

*Within Firm:*
- *Global Head of Quantitative Research*: Leading all quants across trading divisions
- *Chief Risk Officer (CRO)*: Transition to risk management leadership
- *Head of Trading / Markets*: Moving into trading leadership with quant background
- *Chief Data Officer or Chief Analytics Officer*: Leading firm's data/analytics strategy

*External Opportunities:*
- *CRO at Major Bank*: Head of market risk or model risk at large institution
- *Hedge Fund CIO*: Leading quantitative hedge fund (Two Sigma, D.E. Shaw, Citadel)
- *Fintech Leadership*: CTO or Chief Scientist at quant-focused fintech
- *Academic Position*: Professorship at top university (finance/math department)
- *Consulting*: Partner at quant-focused consulting firm
- *Regulatory Role*: APRA/ASIC role in quantitative risk or model oversight

#pagebreak()

== Australian Sales & Trading Quant Context

=== Major Employers

*Global Banks (Strong Quant Teams in Australia):*
- UBS (large Australian quant group covering rates, FX, commodities)
- Macquarie Group (biggest Australian quant function, broad coverage)
- Goldman Sachs, J.P. Morgan, Morgan Stanley (smaller Australian quant presence)

*Australian Banks (Growing Quant Capabilities):*
- NAB, ANZ, CBA, Westpac (rates and FX quants for institutional business)

=== Regulatory Considerations

*APRA Prudential Standards:*
- APS 115: Capital Adequacy - Model Governance
- APS 116/180: Market Risk Capital Requirements (internal models)
- APS 113: Capital Adequacy - Internal Ratings-Based Approach (credit risk models)
- Model validation and backtesting requirements

*Model Risk Management:*
- Increasing regulatory focus on model governance
- Independent validation requirements
- Documentation and transparency expectations
- Regular model review and backtesting

*FRTB (Fundamental Review of Trading Book):*
- New capital framework for market risk (global implementation ongoing)
- Australian banks implementing FRTB standards
- Requires sophisticated risk factor modelling and stress testing

=== Key Quantitative Challenges in Australian Market

*Interest Rates:*
- Modelling Bank Bill Swap Rate (BBSW) dynamics post-reform
- Australian government bond market liquidity and curve construction
- Cross-currency basis and FX/rates correlation
- Inflation derivatives linked to Australian CPI

*FX:*
- AUD as commodity currency - correlation modelling with iron ore, coal, LNG
- China linkages and CNH/CNY impact on AUD
- Asian timezone execution and market microstructure
- Emerging market FX (NDFs for Indonesia, India, Philippines)

*Commodities:*
- Iron ore and coal curve modeling (Australian exports)
- LNG derivatives and Asian spot market dynamics
- Basis risk between physical and financial markets
- Weather derivatives for Australian climate patterns

=== Compensation (Australian Quant Market)

*Junior Quant*: AU\$100,000 - AU\$140,000 base + AU\$20,000-50,000 bonus

*Quant Analyst (3-6 years)*: AU\$140,000 - AU\$200,000 base + AU\$40,000-100,000 bonus

*Senior Quant (6-10 years)*: AU\$190,000 - AU\$280,000 base + AU\$80,000-200,000+ bonus

*Quant Team Lead (10+ years)*: AU\$250,000 - AU\$400,000+ base + AU\$150,000-500,000+ bonus

*Head of Quants*: AU\$350,000 - AU\$600,000+ base + AU\$300,000-1,000,000+ bonus

_Note: Top-tier US/European banks and hedge funds pay significantly more (30-100% premium). Quantitative hedge funds (Citadel, Two Sigma, D.E. Shaw) pay even higher, often 2-3x these ranges._

=== Academic Pathways into Quant Roles

*Preferred Degrees:*
- PhD in Mathematics, Physics, Statistics, Engineering (most common)
- Masters in Financial Engineering, Computational Finance, Quantitative Finance
- Strong undergraduate in math/physics/CS + Masters in Quant Finance

*Key Universities Producing Australian Quants:*
- University of Sydney (Applied Mathematics, Quantitative Finance)
- UNSW (Financial Mathematics, School of Mathematics and Statistics)
- ANU (Mathematical Sciences, Computational Physics)
- University of Melbourne (Mathematics and Statistics)
- UTS (Quantitative Finance, Mathematical Sciences)

*Critical Skills to Develop:*
- Stochastic calculus (essential - Brownian motion, Itô's lemma, martingales, Girsanov)
- Numerical methods (PDEs, Monte Carlo, finite difference, trees)
- Programming (C++ for performance, Python for prototyping, increasingly Julia)
- Probability and statistics (measure theory, time series, statistical inference)
- Optimization (convex optimization, nonlinear programming)

=== Key Industry Resources

*Academic Journals:*
- Journal of Computational Finance
- Quantitative Finance
- Mathematical Finance
- Risk Magazine (industry-focused)
- Journal of Derivatives

*Textbooks (Essential Reading):*
- Hull, "Options, Futures, and Other Derivatives"
- Shreve, "Stochastic Calculus for Finance" (Vols I & II)
- Wilmott, "Paul Wilmott on Quantitative Finance"
- Glasserman, "Monte Carlo Methods in Financial Engineering"
- Björk, "Arbitrage Theory in Continuous Time"
- Brigo & Mercurio, "Interest Rate Models: Theory and Practice"

*Online Resources:*
- Quantlib (open-source derivatives pricing library)
- Wilmott forums (quant finance discussions)
- arXiv quantitative finance section (preprints)
- QuantConnect, Quantopian (algorithmic trading platforms)
- SSRN (Social Science Research Network - finance papers)

*Professional Organizations:*
- CQF Institute (Certificate in Quantitative Finance)
- PRMIA (Professional Risk Managers' International Association)
- International Association of Financial Engineers (IAFE)

#pagebreak()

== Conclusion

Quant roles in Sales & Trading combine deep mathematical expertise with practical problem-solving for derivatives trading. The Australian market offers excellent opportunities for quantitative professionals, particularly at global banks and Macquarie Group, with growing capabilities at major Australian banks.

Success as a quant requires balancing theoretical rigor with practical constraints - models must be mathematically sound but also implementable, maintainable, and explainable to non-technical stakeholders. The best quants bridge the gap between academic mathematics and trading floor reality, creating models that traders trust and regulators accept.

Career progression typically follows: Junior Quant → Quant Analyst → Senior Quant → Quant Team Lead → Global Head of Quants, with alternative paths into hedge funds, risk management, fintech, or academia. Compensation can be very attractive, particularly for those combining strong technical skills with business understanding and communication ability.

The role has evolved significantly with increased regulatory scrutiny (model validation, capital calculations), technological advances (machine learning, high-performance computing), and market changes (electronic trading, increased transparency). Modern quants need broader skillsets including programming, data science, and regulatory knowledge alongside core mathematical finance expertise.

For students considering quant careers, pursuing advanced quantitative education (Masters or PhD), building strong programming skills, and gaining practical experience through internships are essential. The work is intellectually challenging and impactful - quant models underpin billions of dollars of derivatives trading globally.
