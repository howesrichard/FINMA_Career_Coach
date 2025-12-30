

= Structurer Roles in Sales and Trading

== Overview

Structurers in Sales and Trading divisions design customized financial products and solutions for institutional clients, combining derivatives, structured notes, and complex financing arrangements to meet specific investment objectives or risk management needs. In Australia, structurer roles exist primarily at global investment banks (Goldman Sachs, J.P. Morgan, Morgan Stanley, UBS, Citi) and major Australian banks with sophisticated derivatives capabilities (Macquarie Group, NAB, CBA, ANZ, Westpac).

Structurers bridge quantitative finance, client advisory, and product development. Unlike traders who execute and manage risk, or salespeople who maintain relationships, structurers focus on product innovation - designing bespoke solutions that address client-specific problems. The role requires deep technical knowledge of derivatives pricing, strong understanding of client needs, creativity in product design, and ability to work across sales, trading, and legal/compliance teams.

Post-GFC, the structuring landscape has evolved significantly with increased regulatory scrutiny (particularly around structured products sold to retail investors), greater client sophistication demanding transparency, and shift from complex proprietary structures toward more standardized, exchange-traded solutions. Modern structurers must balance innovation with regulatory compliance, risk management, and economic substance.

#pagebreak()

== 1. Junior Structurer / Structuring Analyst

=== Hierarchy Level
Entry-level to 2 years of experience, typically requiring quantitative finance degree

=== Key Activities and Responsibilities
- *Product Documentation*: Preparing term sheets, pitch materials, and product specifications
- *Pricing Support*: Running pricing models and calculating indicative terms for structured products
- *Analysis & Modeling*: Analyzing client portfolios, risk exposures, and hedging requirements
- *Market Data*: Gathering market data (volatility surfaces, credit spreads, correlations) for pricing
- *Client Materials*: Creating presentations and materials for sales to use with clients
- *Deal Support*: Assisting senior structurers on live transactions and product launches
- *Regulatory Compliance*: Ensuring products comply with disclosure and suitability requirements
- *Back-Testing*: Analyzing performance of existing structures and client outcomes

=== Required Skills

*Technical:*
- Strong foundation in derivatives pricing (Black-Scholes, binomial models, Monte Carlo)
- Understanding of options theory (Greeks, volatility, hedging)
- Excel modeling (complex structured product payoffs, scenario analysis)
- Knowledge of fixed income mathematics (duration, convexity, credit spreads)
- Bloomberg proficiency (derivatives pricing, market data, comparables)
- Increasingly: Python/MATLAB for quantitative analysis and pricing
- Understanding of accounting treatment for derivatives (hedge accounting, fair value)

*Interpersonal:*
- Clear written communication (term sheets, pitch materials must be precise)
- Ability to explain complex products to non-technical audiences
- Attention to detail (errors in term sheets can be costly)
- Collaborative approach (working with sales, trading, legal, compliance, risk)
- Client service orientation (supporting sales and addressing client questions)
- Time management (multiple deals running simultaneously with tight deadlines)

*Regulatory:*
- Understanding of derivatives regulation in Australia (ASIC market conduct rules)
- Knowledge of product disclosure requirements (particularly for retail products)
- Awareness of suitability obligations (ensuring products appropriate for clients)
- Familiarity with ISDA documentation and legal terms
- Understanding of market manipulation and insider trading rules

=== Typical Work Modes

*Analytical Work (50-60%):*
- Building pricing models and running scenarios
- Analyzing client portfolios and hedging needs
- Calculating terms and payoffs for proposed structures
- Back-testing performance of existing products
- Researching market precedents and comparable structures

*Documentation & Materials (25-30%):*
- Drafting term sheets and product specifications
- Creating client presentations and pitch materials
- Preparing internal approval documents
- Writing product descriptions and risk disclosures
- Updating pricing sheets and market data

*Meetings & Collaboration (15-20%):*
- Supporting senior structurers in client meetings
- Working with trading desks on hedging strategies
- Coordinating with legal and compliance on documentation
- Attending product development discussions
- Learning from senior structurers on deal execution

*Other (5-10%):*
- Training on new products and market developments
- Maintaining product databases and pricing libraries
- Responding to ad-hoc requests from sales and trading
- Regulatory and compliance training

=== A Day in the Life

*7:30am - 8:30am*: Arrive early to prepare for busy day. Overnight market moves: Australian equity volatility (ASX 200 VIX) ticked up to 16% from 14% (implies higher option premiums), 10-year bond yields rose 8bp to 3.85% (affects structured note pricing), AUD weakened to 0.6520 (impacts FX-linked structures).

Update morning pricing sheet for sales team with latest indicative terms on standard structured products:
- Principal-protected notes linked to ASX 200: 5-year, 100% capital protection, 80% participation in upside (down from 85% yesterday due to higher vol)
- Growth notes (autocallables): ASX 200 linked, 10% pa coupon if index above 90% of initial level, 5-year maturity
- FX-linked deposits: AUD/USD range accrual notes, enhanced yield if AUD stays in 0.64-0.68 range

Check overnight emails: Sales has client inquiry about structured solution for superannuation fund concerned about equity downside but wanting upside participation. Flag for discussion in morning meeting.

*8:30am - 9:00am*: Morning structuring team meeting with senior structurers and head of structuring. Review pipeline of active deals:

Deal 1: Large corporate (BHP) looking to hedge commodity price risk via structured derivative - pricing presentation due Friday
Deal 2: Superannuation fund wants principal-protected equity participation note (AU\$50m) - term sheet in negotiation
Deal 3: Bank treasury desk exploring structured funding via callable range accrual notes - feasibility analysis ongoing

You're assigned to work on Deal 2 (super fund protected note). Senior structurer briefs: "Client wants equity upside but nervous about drawdowns. Board mandate requires 100% capital protection. They've seen 5-year structure from competitor offering 70% participation - we need to beat that. Run scenarios with different structures: vanilla call option vs Asian average vs digital payoffs. Also check if adding modest downside participation (first 5% of losses) improves participation rate."

*9:00am - 11:00am*: Deep work on superannuation fund principal-protected note. Client details:
- Investment amount: AU\$50 million
- Underlying: ASX 200 index
- Term: 5 years
- Must have 100% capital protection at maturity
- Want maximum equity upside participation
- No leverage or complex payoffs (trustee restrictions)

Build comprehensive pricing model in Excel:

*Structure 1: Vanilla European Call*
- Zero-coupon bond (5yr, 3.85% yield) costs ~82.5% of notional → provides capital protection
- Remaining 17.5% buys call options on ASX 200
- Current ASX 200 level: 7,200
- 5-year ATM call option (using Black-Scholes with 16% vol, 3.5% dividend yield, 4% risk-free rate)
- Implied participation: ~75%

*Structure 2: Asian Average (Path-Dependent)*
- Same capital protection (82.5%)
- Buy Asian-style options (payoff based on average ASX 200 level over final year)
- Asian options cheaper than vanilla (less volatility exposure)
- Implied participation: ~82% (better than vanilla!)

*Structure 3: Capped Participation*
- Cap maximum upside at 50% (so if ASX rallies >50%, client doesn't get excess)
- Selling cap (short call at 150% strike) funds higher participation on core option
- Implied participation up to cap: ~100% (full participation up to 50% gain)

Run comprehensive scenario analysis across all structures showing client outcomes if ASX returns: -30%, -20%, -10%, 0%, +10%, +20%, +30%, +50%, +100% over 5 years.

*11:00am - 12:00pm*: Present preliminary analysis to senior structurer. He reviews:

"Good work on comparing structures. Asian average is interesting - 82% vs competitor's 70% vanilla is compelling. Few things to refine:

1. Check if super fund trustees comfortable with path-dependent payoff (Asian averaging) - some prefer simplicity of vanilla even at lower participation
2. Run sensitivity analysis: if equity vol drops to 14%, does participation improve to 85%+?
3. Calculate break-even: if ASX returns X% over 5 years, what's the equivalent simple investment return?
4. Think about marketing story: Why is this structure attractive NOW?
5. Legal check: Confirm ASIC compliance for super fund investment in structured notes"

*12:00pm - 1:00pm*: Lunch at desk while researching climate-linked bonds assignment. Find recent deals:
- Enel (Italian utility): €1.5bn bond with coupon step-up if emissions targets missed
- Novartis: USD bond with coupon linked to access-to-medicine scorecard
- CBA: sustainability-linked bond with margin ratchet tied to sustainability goals

Read term sheets. Key features:
- Coupon adjustment mechanism (typically +25-50bp if target missed)
- Independent verification of metrics
- Pricing: sustainability bonds typically price 5-10bp through vanilla comparables

*1:00pm - 2:30pm*: Refine superannuation fund analysis based on feedback.

*Sensitivity Analysis:*
Current (16% vol): 82% participation
Lower vol (14%): 88% participation
Higher vol (18%): 76% participation

*Break-Even Analysis:*
If ASX returns 10% over 5 years: Client gets 8.2% (10% × 82%) = 1.57% pa compound
If ASX returns 30%: Client gets 24.6% = 4.49% pa compound

*Marketing Story:*
"Why invest NOW?
1. Market volatility elevated - better participation terms
2. Rising rates - better zero-coupon pricing
3. Equity uncertainty - protection valuable
4. Super context - no sequence-of-returns risk"

*2:30pm - 3:00pm*: Sales desk asks: "Quick question - corporate client wants to hedge FX exposure on USD receivables (USD 20m due in 6 months). Standard forward is 0.6520. Can we offer something more attractive?"

Quick analysis: Client long USD, wants hedge by selling USD forward for AUD.

Standard forward: Sell USD 20m at 0.6520 → guarantees AUD 13.04m

Structured alternative - *Participating Forward*:
- Sell USD at better rate (0.6560 vs 0.6520)
- Give up some upside if AUD strengthens beyond 0.6400
- Client gets 30bp improvement vs standard forward

Send quick pricing indication to sales.

*3:00pm - 4:00pm*: Client conference call for different deal - corporate bond issuer exploring *callable range accrual note* to reduce funding costs.

Client: Mid-sized corporate rated BBB+ wanting AU\$100m, 5-year funding.

Standard bond: 5-year BBB+ pays ~5.50% pa

Structured alternative: *Callable Range Accrual Note*
- Coupon: 7.00% pa IF 90-day BBSW stays in range 3.00-5.00%
- If BBSW outside range: coupon 2.00%
- Issuer can call after 2 years

Senior structurer presents. Client CFO asks about risks. You present expected cost analysis showing ~5.20% expected cost vs 5.50% vanilla.

*4:00pm - 5:00pm*: Work on FX participating forward term sheet for earlier sales request.

*5:00pm - 6:00pm*: Finish daily tasks and administrative items.

Update deal tracker with status. Respond to emails. Tomorrow: 9am product development meeting, 11am volatility modeling training, 2pm private bank pitch, 4pm work on callable range accrual term sheet.

*Evening*: Leave around 6:30-7:00pm most days. Take-home reading: Product term sheets from competitors, derivatives textbook on exotic options.

=== Career Progression Pathways

*Within 2-3 years:*
- *Structurer*: Independent responsibility for smaller deals, direct client interaction
- *Product Specialist*: Focus on specific product type (equity derivatives, rates structures, FX exotics)

*Within 3-5 years:*
- *Senior Structurer*: Leading complex deals, managing junior team members
- *Cross-Asset Structurer*: Designing multi-asset class solutions

*Alternative paths:*
- Quantitative research (developing pricing models)
- Derivatives trading (applying structuring knowledge)
- Buy-side structuring (super funds, hedge funds)
- Derivatives technology (pricing systems)
- Fintech (structured products platforms)

#pagebreak()

== 2. Structurer

=== Hierarchy Level
3-6 years of experience, independent deal execution and client-facing

=== Key Activities and Responsibilities
- *Product Design*: Creating customized structured products for specific client needs
- *Client Presentations*: Presenting structure proposals and explaining complex payoffs
- *Pricing & Execution*: Leading pricing process and coordinating execution with trading
- *Deal Management*: Managing full transaction lifecycle from pitch to settlement
- *Cross-Functional Coordination*: Working with sales, trading, legal, compliance, operations, risk
- *Competitive Analysis*: Monitoring competitor offerings and market innovations
- *Product Innovation*: Developing new structure types and improving existing products
- *Risk Assessment*: Analyzing risks in proposed structures (market, credit, operational, regulatory)

=== Required Skills

*Technical:*
- Advanced derivatives pricing (exotic options, path-dependent payoffs, correlation products)
- Strong quantitative modeling (Monte Carlo simulation, finite difference methods)
- Programming proficiency (Python/MATLAB for pricing and analysis)
- Deep understanding of volatility modeling (smile, surface, local vol, stochastic vol)
- Knowledge of hedging strategies and Greeks management
- Understanding of structured credit (CLNs, synthetic CDOs, basket products)
- Familiarity with regulatory capital implications (CVA, Basel III)

*Interpersonal:*
- Excellent client communication (explaining technical concepts clearly)
- Persuasive presentation skills (pitching structures against competitors)
- Negotiation ability (terms, pricing, documentation)
- Relationship building with internal stakeholders
- Project management (coordinating complex deals)
- Creative problem-solving (designing novel solutions)

*Regulatory:*
- Deep understanding of derivatives regulation (ASIC product intervention, DDO)
- Knowledge of suitability and appropriateness requirements
- Expertise in product disclosure requirements
- Understanding of ISDA documentation and legal risk
- Awareness of accounting implications (IFRS 9 hedge accounting)

=== Typical Work Modes

*Client Engagement (30-35%):*
- Client meetings and pitch presentations
- Explaining structure proposals
- Negotiating terms and pricing
- Responding to RFPs
- Building client relationships

*Analysis & Structuring (35-40%):*
- Designing bespoke solutions
- Running pricing models and scenario analysis
- Developing term sheets
- Analyzing risk-return trade-offs
- Innovating new products

*Coordination & Execution (20-25%):*
- Working with traders on hedging
- Coordinating with legal on documentation
- Managing compliance approval processes
- Overseeing execution and settlement
- Post-trade support

*Market Intelligence (10-15%):*
- Researching competitor products
- Analyzing regulatory developments
- Staying current on derivatives markets
- Contributing to thought leadership

=== Career Progression Pathways

*Within 3-5 years:*
- *Senior Structurer*: Managing larger deals (AU\$500m+), leading product innovation
- *Product Head*: Leading specific product line

*Within 5-8 years:*
- *Head of Structuring*: Managing entire structuring team
- *Cross-Asset Solutions*: Leading complex multi-asset deals

*Alternative paths:*
- Quantitative research
- Derivatives trading
- Portfolio management at buy-side
- Corporate treasury
- Derivatives technology/fintech
- Consulting

#pagebreak()

== 3. Senior Structurer / Head of Structuring

=== Hierarchy Level
8-15+ years of experience, leading structuring function and driving product strategy

=== Key Activities and Responsibilities
- *Strategic Product Development*: Setting direction for structured products offering
- *Major Deal Leadership*: Leading largest, most complex transactions (AU\$500m+)
- *Client Strategy*: Advising C-suite clients on sophisticated solutions
- *Team Leadership*: Managing team of structurers (if Head role)
- *Innovation & IP*: Developing proprietary structures
- *Cross-Functional Leadership*: Working with trading, sales, quants, technology
- *Regulatory Strategy*: Navigating regulatory environment
- *Risk Governance*: Overseeing risk framework for structured products
- *Thought Leadership*: Publishing research, speaking at conferences
- *Business Development*: Using structuring expertise to win mandates

=== Required Skills

*Technical:*
- Expert-level derivatives pricing across all asset classes
- Deep quantitative finance knowledge (stochastic calculus, numerical methods)
- Strategic thinking about product development
- Understanding of regulatory capital and accounting
- Knowledge of legal and documentation frameworks

*Interpersonal:*
- Executive presence and C-suite credibility
- Exceptional communication (complex to simple)
- Leadership and team management
- Cross-functional collaboration
- Negotiation skills
- Business development

*Regulatory:*
- Expert understanding of derivatives regulation
- Knowledge of product governance requirements
- Expertise in managing regulatory risk
- Understanding of accounting standards
- Awareness of tax implications

=== Typical Work Modes

*Strategic Leadership (30-40%):*
- Setting product strategy
- Identifying market opportunities
- Building competitive positioning
- Long-term planning
- Building partnerships

*Major Deal Execution (25-30%):*
- Leading flagship transactions
- Advising C-suite
- Bespoke solution design
- High-stakes negotiations

*Client & Business Development (20-25%):*
- Senior client relationships
- Pitching capabilities
- Conference speaking
- Building external profile

*Team Leadership (15-20%, if Head):*
- Managing structuring team
- Mentoring structurers
- Quality control
- Cross-training

*Industry & Regulatory (5-10%):*
- Engaging with regulators
- Contributing to industry forums
- Monitoring regulatory developments
- Ensuring compliance

=== Career Progression Pathways

*Within Firm:*
- *Global Head of Structuring*: Leading function globally
- *Head of Markets / Trading*: Broader markets leadership
- *Chief Risk Officer*: Leveraging derivatives risk expertise
- *Business Unit Head*: Leading institutional business

*External Opportunities:*
- *Buy-Side CIO*: Leading investments at hedge fund, super fund
- *Corporate Treasurer*: CFO track at major corporation
- *Consulting*: Partner at derivatives consulting firm
- *Regulatory/Policy*: Senior role at ASIC, RBA, Basel Committee
- *Fintech*: Co-founder or C-suite at derivatives technology company
- *Board Roles*: Non-executive director

#pagebreak()

== Australian Structuring Context

=== Major Employers

*Global Investment Banks (Strong Structuring in Australia):*
- Goldman Sachs (leading structured products capabilities)
- UBS (strong equity derivatives and wealth structuring)
- J.P. Morgan (rates and credit structuring)
- Morgan Stanley (equity derivatives, structured notes)
- Citi (rates derivatives, FX structures)

*Australian Banks (Growing Capabilities):*
- Macquarie Group (largest Australian structuring team)
- CBA, ANZ, NAB, Westpac (institutional structuring teams)

*Specialist Firms:*
- Structured product issuance platforms
- Boutique derivatives advisory

=== Key Products in Australian Market

*Equity Derivatives:*
- Principal-protected notes (ASX 200, global indices)
- Autocallables (popular with Asian investors)
- Barrier options and exotic structures
- Dividend swaps and basket derivatives
- Structured CPPI products

*Rates Derivatives:*
- Callable range accrual notes
- CPI-linked bonds and inflation derivatives
- Structured swaps (amortizing, accreting, range accrual)
- Swaptions and cancellable swaps
- Basis swaps

*FX Derivatives:*
- Participating forwards and range forwards
- Dual currency deposits
- Cross-currency swaps with embedded options
- Exotic options (barriers, digitals, average-rate)

*Credit Derivatives:*
- Credit-linked notes (CLNs)
- Synthetic CDOs (returning slowly post-GFC)
- First-to-default baskets
- Contingent convertibles (CoCos)

*Commodity Derivatives:*
- Commodity-linked notes (iron ore, coal, LNG)
- Structured commodity swaps
- Weather derivatives (agriculture, energy)
- Carbon and environmental derivatives (emerging)

*Cross-Asset Structures:*
- Multi-asset autocallables
- Correlation products
- Quanto structures
- Hybrid capital instruments

=== Regulatory Framework

*ASIC Oversight:*
- *Product Intervention Powers*: ASIC can ban harmful products
- *Design & Distribution Obligations (DDO)*: Target market requirements
- *Disclosure Requirements*: PDS for retail, term sheets for wholesale
- *Anti-Hawking*: Restrictions on unsolicited selling
- *Market Conduct*: Fair dealing obligations

*Key Regulatory Events:*
- 2008-2012: GFC aftermath (enhanced disclosure)
- 2016-2019: Agricultural schemes collapse (stricter oversight)
- 2018-2020: Royal Commission (enhanced compliance)
- 2021+: DDO implementation

*Product Categorization:*
- *Retail Products*: Strict disclosure, suitability checks, DDO
- *Wholesale Products*: Streamlined disclosure, fair dealing applies

=== Structuring vs. Other Roles

*Structurer vs. Trader:*
- Structurer: Designs products, client-facing, bespoke solutions
- Trader: Executes hedges, manages risk, P&L focused

*Structurer vs. Quant:*
- Structurer: Applies models commercially, client advisory
- Quant: Develops models, mathematical rigor

*Structurer vs. Salesperson:*
- Structurer: Technical expert, pricing and risk
- Salesperson: Relationship management, deal sourcing

=== Compensation Structures (Australian Roles)

*Junior Structurer / Analyst*: AU\$90,000 - AU\$130,000 base + AU\$30,000-60,000 bonus

*Structurer (3-6 years)*: AU\$130,000 - AU\$200,000 base + AU\$50,000-120,000 bonus

*Senior Structurer (6-10 years)*: AU\$180,000 - AU\$280,000 base + AU\$80,000-200,000 bonus

*Head of Structuring (10+ years)*: AU\$250,000 - AU\$450,000+ base + AU\$150,000-500,000+ bonus

*Global Head / MD*: AU\$400,000 - AU\$800,000+ base + AU\$300,000-2,000,000+ bonus (plus equity)

_Note: Compensation varies by firm, deal flow, and seniority. Bonuses tied to revenue from executed deals._

=== Key Technical Resources

*Derivatives Pricing:*
- Hull "Options, Futures, and Other Derivatives"
- Wilmott "Quantitative Finance"
- Joshi "Concepts and Practice of Mathematical Finance"

*Structured Products:*
- Das "Structured Products"
- Bouzoubaa & Osseiran "Exotic Options and Hybrids"

*Software & Tools:*
- Bloomberg Terminal (SWPM, DLIB, OVME)
- Numerix (derivatives pricing)
- QuantLib (open-source library)
- MATLAB, Python

*Regulatory & Documentation:*
- ISDA master agreements
- ASIC regulatory guides
- Basel III framework
- IFRS 9 / IAS 39

=== Industry Organizations

*Professional Organizations:*
- ISDA (International Swaps and Derivatives Association)
- PRMIA (Professional Risk Managers)
- GARP (FRM certification)
- CQF (Certificate in Quantitative Finance)

*Conferences:*
- Australasian Derivative Markets Conference
- Risk.net Events
- FIA Events

#pagebreak()

== Conclusion

Structurer roles offer intellectually challenging careers at the intersection of quantitative finance, client advisory, and product innovation. Success requires combining deep technical knowledge of derivatives pricing with commercial acumen, creativity in problem-solving, and strong communication skills. The Australian structuring market, while smaller than US/Europe, provides excellent opportunities particularly for:

*Equity Derivatives*: Serving private banks, wealth platforms with principal-protected notes and autocallables

*Corporate Solutions*: Advising major corporates on hedging and structured funding

*Fixed Income Innovation*: Structured term funding and inflation-linked solutions

*ESG & Sustainability*: Green bonds, sustainability-linked notes, carbon derivatives

*Cross-Border Structures*: Leveraging Australia's position between Asian and global markets

Key differentiators for successful structurers:
- *Technical Excellence*: Deep derivatives pricing knowledge, quantitative skills
- *Commercial Judgment*: Understanding client needs vs technical feasibility
- *Communication*: Explaining complex mathematics simply
- *Creativity*: Designing novel solutions
- *Regulatory Awareness*: Navigating compliance while innovating
- *Collaboration*: Working across sales, trading, quants, legal, risk
- *Integrity*: Ensuring economic substance and client appropriateness

Career path: Junior Structurer → Structurer → Senior Structurer → Head of Structuring → MD/Partner, with opportunities to specialize (equity derivatives, rates, FX, credit) or broaden (cross-asset, regional/global). Alternative paths include quantitative research, derivatives trading, buy-side portfolio management, corporate treasury, consulting, fintech, and regulatory/policy roles.

Post-GFC, structuring has evolved from creating complex products toward greater focus on economic substance, transparency, and client suitability. Modern structurers must balance innovation with regulatory compliance and risk management. The best structurers create genuine value for clients - solving real hedging or investment problems - rather than engineering fee-generating complexity.

For students considering structuring careers, strong foundations in mathematics, statistics, finance, and programming are essential. A quantitative finance degree (or masters), derivatives internships, and demonstrated interest in options pricing differentiate candidates. Complement technical skills with communication ability - the best structurers explain complex ideas simply, building trust with clients while delivering sophisticated solutions.

The Australian structuring landscape offers unique opportunities: serving sophisticated corporates with commodity hedging needs, designing wealth solutions for Asia-Pacific private banks, and innovating in emerging areas like ESG-linked derivatives and carbon markets. For those passionate about derivatives, quantitative finance, and creative problem-solving, structuring provides a fulfilling career applying advanced mathematics to real-world client challenges.
