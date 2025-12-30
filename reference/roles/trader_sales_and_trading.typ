

= Trader Roles in Sales and Trading

== Overview

Traders in institutional bank Sales and Trading divisions are responsible for making markets, managing risk, and executing client orders across various asset classes. In Australia, major players include the institutional trading desks at Macquarie Group, major global banks (UBS, Goldman Sachs, J.P. Morgan, Morgan Stanley), and domestic banks' institutional divisions (NAB, ANZ, CBA, Westpac).

Modern trading combines human judgment with sophisticated technology. Traders operate in both flow trading (executing client orders and making markets) and proprietary-style positioning (taking directional views within limits), increasingly using algorithmic execution, electronic market making, and automated trading systems. The role has evolved significantly post-GFC with increased regulation (Basel III capital requirements, MiFID II in some jurisdictions), electronic trading competition, and the rise of high-frequency trading firms.

#pagebreak()

== 1. Junior Trader / Trading Associate

=== Hierarchy Level
Entry-level to 2 years of experience, typically graduate program entry

=== Key Activities and Responsibilities
- *Market Monitoring*: Watching real-time prices, news flow, and market-moving events across relevant asset classes
- *Algorithmic Execution*: Learning to use and optimize execution algorithms (VWAP, TWAP, implementation shortfall, liquidity-seeking algos)
- *Order Execution*: Executing client orders using both electronic platforms and voice trading, learning best execution protocols
- *Electronic Market Making*: Monitoring automated quoting engines, adjusting spreads and sizes based on market conditions
- *Risk Management Support*: Monitoring positions, calculating P&L, tracking risk limits and exposures
- *Pricing Support*: Helping senior traders price complex products, maintaining pricing models
- *Algo Performance Analysis*: Analyzing execution quality using Transaction Cost Analysis (TCA), comparing algo performance
- *Client Communication*: Responding to basic client queries, providing market color under supervision
- *Administrative Tasks*: Trade booking, confirmations, break resolution, regulatory reporting
- *Market Research*: Reading research, tracking economic data, understanding market microstructure

=== Required Skills

*Technical:*
- Strong numerical ability and quick mental math
- Understanding of financial instruments (bonds, equities, FX, derivatives)
- Bloomberg/Reuters terminal proficiency
- Excel and basic programming (Python, VBA) increasingly important
- Understanding of market microstructure and order types (market, limit, iceberg, hidden, pegged orders)
- Knowledge of execution algorithms and their parameters
- Familiarity with trading systems (e.g., Tradefeed, FXall, Bloomberg FXGO, Fidessa, FlexTrade)
- Understanding of electronic trading venues and liquidity pools

*Interpersonal:*
- Ability to work under pressure and make quick decisions
- Clear communication, especially in high-stress situations
- Team player mindset (trading desks are collaborative environments)
- Competitive drive balanced with risk discipline
- Ability to learn from mistakes quickly

*Regulatory:*
- Understanding of market abuse regulations (insider trading, market manipulation, spoofing)
- Best execution obligations and MiFID II requirements (where applicable)
- Algorithmic trading requirements (testing, controls, kill switches)
- ASIC market integrity rules
- Personal trading restrictions and pre-clearance requirements

=== Typical Work Modes

*Active Trading Hours (60-70% during market hours):*
- Monitoring markets, news, and price action
- Executing client orders via algorithms and manual trading
- Managing risk and monitoring automated systems
- Communicating with sales, clients, and other traders
- Responding to market events in real-time
- High intensity during market open, key economic releases, and close

*Analysis & Preparation (20-25%):*
- Pre-market preparation (reviewing overnight moves, key events for the day)
- Post-market analysis (P&L review, trade post-mortems, TCA analysis)
- Studying market patterns, algo performance, and execution quality
- Learning about new products and strategies
- Analyzing market microstructure and liquidity patterns

*Meetings & Collaboration (10-15%):*
- Morning meetings with sales and research teams
- Strategy discussions with senior traders
- Client meetings (mostly observing as junior)
- Cross-desk coordination (e.g., rates traders coordinating with FX desk)
- Algo performance reviews with quants and technology team

*Administrative (5-10%):*
- Trade booking and confirmations
- Regulatory reporting
- Risk reporting and limit monitoring
- Algo parameter documentation

=== A Day in the Life

*6:30am - 7:30am*: Arrive early to prepare for market open. Review overnight price action in global markets - US equities down 1%, treasury yields up 5bp, AUD/USD weaker. Check economic calendar: Australian employment data at 11:30am (market expects strong print). Read overnight analyst reports, check Bloomberg for breaking news. Your desk (Rates Trading) focuses on Australian government bonds and interest rate swaps.

Boot up trading systems: Bloomberg Terminal, internal risk management platform, execution management system (EMS) showing real-time quotes from multiple venues. Check overnight algo execution reports - VWAP algo executed AUD 200mm bond trade with -1.2bp slippage (better than benchmark - good performance).

*7:30am - 8:00am*: Morning meeting with entire Fixed Income, Currencies & Commodities (FICC) division. Head of Trading reviews overnight developments, key events today (employment data, RBA Governor speech at 2pm). Each desk reports positioning and key risks. Your senior trader mentions the desk is short 3yr bonds (expecting yields to rise) but will flatten position ahead of employment data to reduce risk.

Electronic trading team reports: overnight liquidity good in bond futures, spreads tight. Note that AUD/USD saw unusual algo activity between 2-3am (likely systematic fund rebalancing). FX desk flags this could indicate positioning shift.

*8:00am - 9:00am*: Market opens. Immediate activity - corporate client (major super fund) wants to buy AUD 100 million 10yr bonds. Senior trader decides to use TWAP (Time-Weighted Average Price) algo to execute over 2 hours to minimize market impact. You set up the algo: time window 9am-11am, participation rate 15% (don't exceed 15% of market volume), limit price 3.52% yield (don't pay more than this).

Monitor algo execution on screen - sees each child order, fill prices, compare to VWAP benchmark. Algo adapts to market conditions: when selling pressure emerges at 9:20am (yields rise 2bp), algo pauses to avoid chasing the market. When market stabilizes, algo resumes. After 90 minutes, filled AUD 85mm at average 3.505% yield. Last AUD 15mm struggling to fill - market moved up. Consult senior trader: manually work remaining order or let algo complete? Decide to manually complete - you call broker dealers for quotes, execute at 3.51% (slightly worse but acceptable to finish the order).

Calculate execution quality: VWAP for the period was 3.508%, you achieved 3.507% average - beat VWAP by 0.1bp. Implementation shortfall (difference from decision price to execution price) was +2bp (market moved against client during execution, unavoidable). Document in TCA (Transaction Cost Analysis) report for client.

*9:00am - 10:30am*: Relatively quiet period. Senior trader asks you to optimize parameters for the desk's market-making algorithms. These algos automatically quote bid-offer spreads on Bloomberg and electronic trading platforms (Tradeweb, MarketAxess for bonds).

Pull up algo dashboard showing current settings:
- Bid-offer spread: 2bp in 10yr bonds (normal market conditions)
- Maximum position size: AUD 50mm per bond
- Inventory skew: widen offer if position gets too long, widen bid if too short
- Volatility adjustment: auto-widen spreads if realized volatility increases

Senior trader wants you to analyze if spread of 2bp is competitive. You check: competitors quoting 1.5-2bp on Bloomberg, Tradeweb showing 1.8bp average. Recommend tightening to 1.8bp to improve hit rate but warn this reduces profit per trade. Senior approves - update algo parameters. Within 10 minutes, hit rate improves (more clients trading with you) but P&L per trade declines slightly. Monitor throughout day to assess net impact.

*10:30am - 11:30am*: Market activity picks up ahead of employment data. Sales desk forwards multiple client inquiries for pricing on various bond positions. You help senior trader provide competitive quotes, some via voice, some via electronic request-for-quote (RFQ) systems.

One large inquiry comes via Tradeweb RFQ: client wants to sell AUD 200mm 7yr bonds. Multiple dealers responding simultaneously (competitive auction format). Senior trader decides to use algo to price: system calculates mid-market 3.12%, applies 2bp bid-offer spread, automatically sends bid at 3.14% yield. Within 2 seconds, see you're second-best price (competitor bid 3.135%). Client trades with competitor. Senior trader reviews: "We were competitive but slightly conservative on spread. Next time consider 1.5bp spread for large competitive RFQ."

Meanwhile, you're managing a different client order: AUD 75mm to buy 5yr bonds using Implementation Shortfall algo (minimize total cost including market impact and timing risk). Algo uses sophisticated optimization: initially aggressive (capturing 25% of volume) to establish position quickly, then backs off as market becomes less favorable. Successfully fills AUD 60mm before employment data at minimal cost, parks remaining AUD 15mm to execute post-announcement.

*11:30am - 12:00pm*: Employment data released - much stronger than expected, unemployment drops to 3.8% (vs 4.0% forecast). Immediate market reaction: bond yields spike 8bp, AUD strengthens. Your desk's short 3yr position makes money quickly. Senior trader decides to cover half the short position (take profits) while holding the rest on view that RBA will hike rates at next meeting.

Fast-paced environment - lots of client flow as market adjusts to new data. Electronic market-making algos widen spreads automatically (volatility spike triggers pre-programmed response: 2bp spread becomes 5bp to protect against adverse selection). Manual override required for some trades - senior trader takes control, quotes 6-7bp spreads on large inquiries given extreme volatility. You're executing smaller orders while senior trader handles large block trades.

The Implementation Shortfall algo holding AUD 15mm buy order activates post-announcement - prices jumped unfavorably (yields up) so algo waits 15 minutes for market to stabilize, then executes aggressively to complete the trade. Fills at 8bp worse than pre-announcement levels but algo performed optimally given circumstances.

*12:00pm - 1:00pm*: Lunch at desk (typical for traders) - order food while monitoring markets. Write up quick analysis of employment data impact and market reaction for internal distribution. Check P&L - desk up AUD 400k for the day so far, mostly from directional short position.

Review algo performance: morning TWAP execution beat benchmark, Implementation Shortfall algo handled data event well (minimal additional slippage beyond market move), market-making algos correctly widened spreads during volatility spike. Document lessons learned: 1) TWAP worked well for smaller size in stable markets, 2) Implementation Shortfall better for uncertain timing with scheduled events, 3) Volatility triggers on market-making algos performed as designed.

Review afternoon's key events - RBA Governor speech will be critical. Discuss with senior trader: should we pre-program algo responses for different speech scenarios? Decide to keep manual override during speech given unpredictability.

*1:00pm - 2:00pm*: Client call with sales team and large institutional client (insurance company). Client wants to hedge AUD 500 million bond portfolio against rising rates. Senior trader presents options:
1. Sell bond futures using VWAP algo (liquid, simple)
2. Enter receive-fixed interest rate swaps (customized hedge)
3. Buy put options on bonds (protection with upside)
4. Combination strategy executed via algorithms

Discussion of execution strategy for each option. If futures: use VWAP algo over 1-2 days to minimize market impact. If swaps: RFQ to multiple dealers via platforms like Tradeweb or Bloomberg SWAP. If options: likely manual execution given less liquid market. Client decides to implement combination using futures (70%) and swaps (30%). You take detailed notes on execution plan.

*2:00pm - 3:00pm*: RBA Governor speech begins. You monitor Bloomberg live, flag key comments to senior trader. Governor hints at further rate hikes likely if inflation stays elevated - hawkish tone. Market sells off further - yields up another 5bp.

Desk gets busy with client flow - mix of clients reducing duration (selling bonds/paying swaps) and opportunistic buyers seeing value. Electronic trading volumes surge: your market-making algos handling 60% of client flow automatically, you and senior trader handling remaining 40% manually (larger sizes, complex structures requiring judgment).

One challenge: client wants to sell AUD 300mm bonds quickly (within 30 minutes). Senior trader uses Liquidity-Seeking algo rather than standard TWAP: algo actively scans multiple venues (Tradeweb, MarketAxess, Bloomberg, plus direct dealer quotes), routes orders to wherever liquidity is best, uses hidden orders to minimize information leakage. Successfully executes AUD 280mm in 25 minutes with minimal market impact. Remaining AUD 20mm completed manually via phone to broker dealers.

Meanwhile, monitoring automated market-making: algos temporarily pulled quotes during most volatile period (protective measure to avoid adverse selection when market moving very fast), then reinstated once volatility moderates. This is pre-programmed behavior but you're monitoring to ensure it functions correctly.

*3:00pm - 4:00pm*: Market starts to calm down after initial reaction to speech. Your senior trader reviews desk positioning - still short some 3yr exposure but within risk limits. Decides to hold overnight on conviction that market will continue pricing in higher rates.

You update all risk reports, P&L attribution (breaking down profit sources), and prepare end-of-day reporting. Specific focus on algo performance metrics:
- Total volume executed via algos: AUD 1.2bn (65% of desk volume)
- Average execution quality: -0.3bp vs VWAP (beat benchmark)
- Market-making algo hit rate: 42% (down from normal 55% due to volatility)
- Implementation shortfall: averaged 3.5bp including market impact
- Algo failures/errors: zero (good - systems performed reliably)

*4:00pm - 5:00pm*: Market close procedures. Final trades get processed, all confirmations sent, positions reconciled. End of day P&L is up AUD 580k - excellent day. You prepare detailed breakdown: AUD 450k from directional short positioning, AUD 100k from client flow and market making (algo + manual), AUD 30k from basis trading.

Attend brief end-of-day desk meeting - senior trader reviews what went well (good risk management before data, correct directional view, algos performed reliably) and areas to improve (could have been more aggressive after employment data given conviction level, market-making algos could return to market faster post-volatility spike).

Specific algo post-mortem: review why Implementation Shortfall algo for AUD 75mm order paused during data announcement (this was correct - avoided executing during extreme volatility), review why market-making algo pulled quotes for 12 minutes (discuss if this was too long - maybe 8 minutes would balance risk vs revenue). Document recommendations for algo developers.

*5:00pm - 6:00pm*: Post-market work. Run TCA (Transaction Cost Analysis) reports for all major client executions today - will be shared with clients to demonstrate execution quality. Key metrics:
- Arrival cost (price movement from decision to start of execution)
- Implementation shortfall (total cost including market impact and timing)
- Comparison to benchmarks (VWAP, Close, Arrival Price)
- Algo selection appropriateness

One client execution shows higher slippage than expected - AUD 150mm bond sale via VWAP algo had 4bp slippage vs 2bp expected. Investigate: market moved against client during execution window AND algo encountered temporary liquidity shortage at 10:30am. Not algo failure but market conditions. Document for client report.

Update your personal trading journal analyzing today's employment data trade and market reaction - what did you learn about how bond markets react to labor market surprises? Specifically note how algos behaved during volatility spike and lessons for parameter setting.

Review academic paper on optimal execution that senior trader recommended - discusses trade-off between market impact and timing risk. Check Asian markets opening - quiet overnight expected. Most traders leave around 6-7pm on normal days.

*Evening*: Head home around 6:30pm. During major market volatility or ahead of critical events, may stay later. Weekends generally free, though significant market events (e.g., surprise central bank meetings, geopolitical crises) may require weekend work to adjust algo parameters or risk positions.

=== Career Progression Pathways

*Within 2-4 years:*
- *Trader*: Taking independent responsibility for subset of products or client relationships, managing more sophisticated algos
- *Specialist Role*: Focus on specific product expertise (e.g., inflation derivatives, short-dated trading) or algo trading/electronic market making
- *Algo Trading Specialist*: Deep focus on execution algorithms, TCA, market microstructure

*Within 4-7 years:*
- *Senior Trader*: Running full book for product area with significant P&L responsibility
- *Electronic Trading Lead*: Managing electronic market making and algo execution strategies
- *Derivative Structurer*: Transitioning to structuring complex solutions for clients

*Within 7-10+ years:*
- *Desk Head*: Managing team of traders, overall P&L responsibility for asset class
- *Head of Trading*: Leading entire trading division across multiple asset classes
- *Head of Electronic Trading*: Leading algo/electronic trading across firm

*Alternative paths:*
- Move to buy-side trading at fund manager or super fund (often better hours, different challenges, focus on execution optimization)
- Transition to proprietary trading firm (Optiver, IMC, Citadel Securities) for pure market-making and HFT
- Join quantitative hedge fund as trader or portfolio manager
- Move to fintech/electronic trading platform (building trading technology, execution algorithms)
- Algo development role (designing execution algorithms with quants)
- Corporate treasury role at major corporation
- Trading technology vendor (building execution management systems, algo platforms)

#pagebreak()

== 2. Trader

=== Hierarchy Level
2-5 years of experience, independent trading authority for specific products

=== Key Activities and Responsibilities
- *Market Making*: Providing two-way prices to clients, managing bid-offer spreads across voice and electronic channels
- *Algorithmic Strategy*: Customizing and optimizing execution algorithms for different market conditions and order characteristics
- *Risk Management*: Independently managing trading positions within assigned limits
- *Electronic Execution*: Managing automated market-making strategies and execution algos
- *Client Execution*: Executing client orders at competitive prices while managing own risk using optimal execution strategies
- *Smart Order Routing*: Utilizing algorithms to route orders across multiple venues for best execution
- *P&L Responsibility*: Direct accountability for profit and loss on trading book (manual + algo trading)
- *TCA and Best Execution*: Analyzing execution quality, documenting best execution compliance
- *Flow Analysis*: Analyzing client flow patterns and order flow toxicity to inform trading strategies
- *Liquidity Provision*: Ensuring liquidity in key products via electronic and voice channels, especially during stress
- *Product Knowledge*: Deep expertise in specific instruments, venues, and market microstructure

=== Required Skills

*Technical:*
- Advanced understanding of derivatives pricing and risk metrics (Greeks)
- Deep knowledge of execution algorithms (VWAP, TWAP, Implementation Shortfall, POV, Dark Pool strategies, Liquidity-Seeking)
- Proficient in market microstructure analysis (order book dynamics, price formation, liquidity measurement)
- Strong technical skills in trading platforms, algo customization, and risk systems
- Ability to build and maintain pricing models
- Understanding of correlation and portfolio effects
- Statistical analysis of execution quality and market impact
- Programming skills (Python/R) for algo analysis and backtesting

*Interpersonal:*
- Building trust with sales team and clients
- Clear communication of risk positions, market views, and execution strategies
- Ability to remain calm under pressure during volatile markets
- Negotiation skills for larger trades
- Collaboration across desks (e.g., coordinating hedges) and with quants/technology teams
- Explaining algo performance and TCA to clients

*Regulatory:*
- Deep understanding of best execution requirements (ASIC, MiFID II where applicable)
- Knowledge of algorithmic trading regulations (testing requirements, controls, kill switches)
- Understanding of position limit regulations
- Familiarity with margin and collateral requirements
- Understanding of large exposure reporting
- Pre-hedging and information leakage rules
- Market manipulation and spoofing regulations

=== Typical Work Modes

*Active Trading (50-60%):*
- Making markets and pricing client trades (voice + electronic)
- Managing positions and risk in real-time
- Customizing and monitoring execution algorithms
- Hedging exposures across markets
- Responding to market moves and news flow
- Managing automated market-making strategies

*Analysis & Strategy (20-25%):*
- Analyzing P&L drivers and trade performance
- TCA analysis and execution quality measurement
- Developing trading strategies and market views
- Studying market microstructure and flow patterns
- Backtesting algo parameters and execution strategies
- Analyzing order flow toxicity and adverse selection

*Client & Sales Collaboration (10-15%):*
- Working with sales on client solutions and execution strategy
- Explaining market dynamics, algo performance, and pricing to clients
- Providing market color and insights
- Discussing hedging and execution strategies
- Presenting TCA reports and execution analysis

*Risk & Reporting (5-10%):*
- Monitoring risk limits and exposures
- Daily P&L explanation and attribution (manual + algo P&L)
- Regulatory and internal reporting (algo usage, best execution)
- Stress testing positions
- Algo performance reporting

=== Career Progression Pathways

*Within 3-5 years:*
- *Senior Trader*: Expanding to broader product set, larger position limits, leading algo strategy
- *Specialist Trader*: Deep expertise in specific complex products (e.g., exotic derivatives, structured products)
- *Algo Trading Lead*: Managing electronic trading strategies, algos, and TCA across desk

*Within 5-8 years:*
- *Desk Head*: Managing team of traders, P&L responsibility for desk, overseeing electronic + manual trading
- *Cross-Asset Trader*: Trading across multiple related asset classes
- *Head of Electronic Trading*: Leading algo/electronic market making across multiple desks
- *Trading Strategist*: More macro, thematic focus across products

*Within 8+ years:*
- *Head of Trading*: Leading entire trading division
- *Global Product Head*: Leading trading for specific product globally across offices
- *Head of Market Structure*: Leading firm's approach to electronic trading, algo development, venue strategy

*Alternative paths:*
- Hedge fund trader or portfolio manager (macro, rates, relative value strategies)
- Proprietary trading firm (market-making, systematic trading, HFT)
- Buy-side trading (executing for large asset managers, focus on algo optimization and TCA)
- Fintech/trading technology roles (building algo platforms, execution systems)
- Risk management or market risk modeling
- Corporate treasury at major corporation
- Algo development/quant trading (working with quants to design execution algorithms)
- Trading technology vendor (Bloomberg, Tradeweb, MarketAxess - building platforms and algos)
- Regulatory role in market structure (ASIC, APRA - focus on algo trading, market abuse)

#pagebreak()

== 3. Senior Trader / Desk Head

=== Hierarchy Level
7-12+ years of experience, leading trading desk with team management

=== Key Activities and Responsibilities
- *Team Leadership*: Managing 3-8 traders, setting desk strategy and risk parameters
- *P&L Ownership*: Ultimate accountability for desk profitability and risk management (manual + algorithmic trading)
- *Algo Strategy*: Setting overall electronic trading and algo execution strategy for desk
- *Client Strategy*: Developing key client relationships and strategic trading partnerships
- *Market Making*: Leading trading in most complex, largest transactions
- *Electronic Infrastructure*: Overseeing market-making algos, execution systems, and smart order routing
- *Risk Management*: Setting risk limits, monitoring exposures, managing stress scenarios
- *Business Development*: Working with sales and product teams to develop new offerings
- *Technology Partnership*: Working with quants and technology teams on algo development and optimization
- *Best Execution Governance*: Ensuring compliance with best execution requirements, TCA framework
- *Regulatory Interface*: Primary contact with compliance, risk, and regulators for desk activities
- *Talent Development*: Hiring, training, and developing junior traders

=== Required Skills

*Technical:*
- Expert-level understanding of derivatives pricing, risk management, and market microstructure
- Deep knowledge of execution algorithms, market structure, and electronic trading
- Advanced quantitative skills and ability to evaluate complex structured products
- Strategic thinking about market structure evolution (high-frequency trading, market fragmentation, new venues)
- Deep knowledge of regulatory requirements (Basel III, APRA prudential standards, margin rules, best execution, algo trading)
- Technology and electronic trading expertise (algo design, latency optimization, co-location strategies)
- Understanding of order flow analysis and adverse selection

*Interpersonal:*
- Leadership and people management skills
- Ability to maintain composure and lead team during market stress
- Senior client relationship management
- Collaboration with other business heads (sales, structuring, research, quants, technology)
- Influencing and negotiation skills with senior stakeholders
- Conflict resolution and decision-making under uncertainty

*Regulatory:*
- Comprehensive understanding of trading regulations and market conduct
- Expert knowledge of capital requirements for trading activities
- Deep understanding of algorithmic trading regulations (testing, controls, market abuse)
- Understanding of large exposure reporting and concentration limits
- Cross-border regulatory requirements (MiFID II, Dodd-Frank where relevant)
- Stress testing and risk scenario requirements
- Best execution and TCA regulatory requirements

=== Typical Work Modes

*Trading & Market Activity (30-40%):*
- Overseeing desk trading activity and major transactions
- Direct trading in largest, most complex deals
- Managing desk risk positions and exposures
- Monitoring automated trading systems and algo performance
- Crisis management during volatile periods

*Team & Strategy Leadership (25-30%):*
- Setting strategy and risk parameters for desk
- Managing electronic trading and algo strategy
- Developing and mentoring traders
- Hiring and performance management
- Daily desk meetings and strategy sessions
- Working with quants and technology on algo development

*Client & Business Development (20-25%):*
- Senior client meetings and relationship management
- Developing new product offerings with structuring team
- Collaborating with sales on client solutions
- Presenting to clients on execution capabilities and TCA
- Cross-selling and strategic partnerships

*Risk, Compliance & Reporting (10-15%):*
- Risk committee meetings and reporting
- Regulatory interactions and audit responses (algo trading compliance)
- P&L reviews with senior management
- Stress testing and scenario analysis
- Best execution governance and reporting

=== Career Progression Pathways

*Within Firm:*
- *Head of Markets/Trading*: Leading entire markets division across all asset classes
- *Head of Fixed Income or Equities*: Leading major business line
- *Head of Electronic Trading*: Leading all electronic/algo trading across firm globally
- *Chief Risk Officer*: Transitioning to risk management leadership
- *Regional Head*: Leading trading for Asia-Pacific or similar region
- *Business Unit CEO*: Running entire institutional bank business

*External Opportunities:*
- *Larger Bank*: Head of trading role at bulge-bracket global bank
- *Hedge Fund*: Partner or PM role at macro, rates, or credit hedge fund
- *Proprietary Trading*: Senior leadership at systematic or high-frequency trading firm (Optiver, IMC, Citadel Securities, Jump Trading)
- *Electronic Trading Platform*: Senior leadership at venue or technology provider (Tradeweb, MarketAxess, Bloomberg)
- *Asset Manager*: CIO or Head of Fixed Income at large fund manager
- *Fintech*: Senior leadership at trading technology company or electronic markets platform
- *Regulatory*: ASIC or APRA role in markets supervision or algo trading oversight (rare but happens)

#pagebreak()

== Australian Sales & Trading Context

=== Major Players

*Global Banks with Australian Trading Desks:*
- UBS, Goldman Sachs, J.P. Morgan, Morgan Stanley, Citi
- Deutsche Bank, Barclays, BNP Paribas

*Australian Banks - Institutional Trading:*
- Macquarie Group (largest Australian player, broad capabilities across manual and electronic trading)
- NAB, ANZ, CBA, Westpac (focused on rates, FX, commodities - increasing electronic capabilities)

*Specialist Flow Houses:*
- Jefferies, Nomura (Asia focus)

=== Electronic Trading & Algo Landscape in Australia

*Key Trading Venues:*
- *Rates/Fixed Income*: Tradeweb, Bloomberg SWAP, MarketAxess, D2D brokers (Tullett Prebon, ICAP)
- *FX*: Bloomberg FXGO, FXall, Refinitiv (formerly Thomson Reuters FX), EBS
- *Equities*: ASX, Cboe Australia (Chi-X), dark pools
- *Derivatives*: ASX 24 (futures/options)

*Common Execution Algorithms:*
- *VWAP (Volume-Weighted Average Price)*: Executes order to match volume distribution throughout day
- *TWAP (Time-Weighted Average Price)*: Executes order evenly over specified time period
- *Implementation Shortfall / Arrival Price*: Minimizes total cost including market impact and timing risk
- *POV (Percentage of Volume)*: Participates at fixed percentage of market volume
- *Liquidity-Seeking / Dark Aggregator*: Searches for hidden liquidity across venues
- *Adaptive / Smart*: Machine learning-based algos that adapt to market conditions

*Technology Infrastructure:*
- Low-latency connectivity to trading venues (often co-located)
- Smart order routing across multiple platforms
- Real-time risk management and position monitoring
- Automated market-making engines
- TCA (Transaction Cost Analysis) platforms

*Market Microstructure Challenges:*
- Australian market relatively smaller and less liquid than US/Europe (algo parameters need adjustment)
- Concentration in major banks (fewer counterparties than global markets)
- Time zone challenges (overlap with Asia but not Europe/US for live trading)
- Regulatory differences (ASIC rules vs MiFID II vs SEC)

=== Regulatory Considerations for Traders

*ASIC Market Integrity Rules:*
- Prohibition on market manipulation, false trading, and spoofing
- Best execution obligations for client orders
- Transaction reporting requirements
- Automated order processing standards for algorithmic trading:
  - Testing requirements before deployment
  - Kill switches and circuit breakers
  - Real-time monitoring and controls
  - Obligation to prevent disorderly trading
- Market making obligations for certain products

*Algorithmic Trading Specific:*
- Pre-deployment testing in simulation environment
- Change management procedures for algo modifications
- Real-time monitoring and alerts
- Circuit breakers (both position limits and market movement triggers)
- Kill switches (ability to shut down all algos immediately)
- Documentation of algo logic and parameters
- Independent validation of algos before production use
- Regular review and backtesting

*Best Execution Requirements:*
- Must take all sufficient steps to obtain best possible result for clients
- Consider: price, costs, speed, likelihood of execution, settlement
- Execution policy must be documented and disclosed to clients
- Regular review of execution quality
- TCA (Transaction Cost Analysis) framework
- Venue selection and smart order routing justification

*APRA Prudential Standards (for ADIs):*
- APS 116: Capital Adequacy - Market Risk (setting capital for trading positions)
- APS 117: Capital Adequacy - Interest Rate Risk in Banking Book
- APS 180: Capital Adequacy - Market Risk (Advanced banks)
- Stress testing requirements for trading books
- Model risk management for pricing and risk models

*RBA Settlement and Clearing:*
- Participation in RITS (high-value payment settlement)
- ASX Clear (Futures) for derivatives clearing
- Understanding of repo and collateral management

*MiFID II Considerations (for European clients):*
- Australian desks dealing with European clients subject to MiFID II
- Best execution reporting (RTS 27/28 reports)
- Systematic internaliser regime (if applicable)
- Transaction reporting obligations

=== Key Markets for Australian Traders

*Rates:*
- Australian Government Bonds (AGBs/ACGBs)
- Semi-government bonds (State borrowers: NSW, VIC, QLD)
- Interest rate swaps (bank bill swaps - BBSW-based)
- Bond futures and options (ASX 3yr and 10yr futures)
- Inflation-linked bonds and inflation swaps
- *Electronic trading*: Heavy use of algos for government bonds and swaps; more manual for exotic structures

*FX:*
- AUD pairs (AUD/USD, AUD/EUR, AUD/JPY, AUD/NZD etc.)
- Non-deliverable forwards (NDFs) for emerging markets
- FX options (vanilla and exotic)
- Cross-currency swaps
- *Electronic trading*: Highly electronic market, ~70-80% algo execution; manual for large sizes and exotics

*Credit:*
- Australian corporate bonds (major banks, miners, utilities, telcos)
- Credit default swaps (single-name CDS, CDX Australia index)
- Structured credit (CLOs, ABS, RMBS)
- *Electronic trading*: Growing electronic execution via Tradeweb/MarketAxess; still significant manual trading

*Commodities:*
- Iron ore, coal, LNG (Australian export commodities)
- Base metals (copper, aluminum, zinc)
- Precious metals (gold, silver)
- Agricultural commodities
- *Electronic trading*: Mix of manual and electronic; depends on product liquidity

=== Compensation Structures (Australian Market)

*Junior Trader / Trading Associate*: AU\$90,000 - AU\$130,000 base + AU\$30,000-80,000 bonus

*Trader (3-5 years)*: AU\$140,000 - AU\$220,000 base + AU\$80,000-250,000 bonus

*Senior Trader (5-8 years)*: AU\$200,000 - AU\$350,000 base + AU\$150,000-600,000+ bonus

*Desk Head (8+ years)*: AU\$300,000 - AU\$500,000+ base + AU\$400,000-2,000,000+ bonus (highly variable based on desk P&L)

*Head of Trading*: AU\$500,000 - AU\$1,000,000+ base + AU\$1,000,000-5,000,000+ bonus (plus equity/long-term incentives)

_Note: Compensation highly variable based on desk profitability, individual performance, and firm performance. Algo trading skills increasingly valued (10-20% premium for strong electronic trading expertise). Top performers at successful desks can earn significantly more. Prop trading firms (Optiver, IMC, Citadel Securities) and systematic hedge funds typically pay 30-100%+ above these ranges, especially for electronic trading and algo development skills._

=== Work Environment & Culture

*Trading Floor Dynamics:*
- Open floor plans with traders sitting in "rows" by desk
- High-energy, collaborative environment during market hours
- Significant mentorship from senior to junior traders
- "Flat" culture despite hierarchy - best idea wins
- Competitive but team-oriented (desk P&L is collective)
- Technology increasingly important (balance between screens and human interaction)

*Technology & Tools:*
- Bloomberg Terminal ubiquitous (FXGO, rates analytics, news, chat, execution)
- Proprietary trading systems and risk management platforms
- Execution management systems (EMS) - Fidessa, FlexTrade, Bloomberg EMSX
- Real-time P&L and position monitors
- TCA platforms (Transaction Cost Analysis)
- Electronic trading platforms (Tradeweb, MarketAxess for bonds; FXall, Bloomberg for FX)
- Increasing use of Python/R for analysis, algo backtesting, market microstructure research
- Co-location and low-latency infrastructure for electronic market making

*Hours & Lifestyle:*
- Typical day: 7am-7pm (varies by desk and market events)
- Early start required to overlap with Asia and prepare for local open
- Intense during market hours (9am-5pm), quieter before/after
- Some evening work for global coordination (esp. FX, commodities)
- Crisis periods require extended hours (2008-09, March 2020 COVID, etc.)
- Generally no weekend work unless major market event or algo systems require attention
- Electronic trading has somewhat reduced hours vs pure voice trading (algos handle overnight)

*Skills Increasingly Important:*
- Programming (Python for algo analysis, backtesting, data analysis)
- Market microstructure understanding
- Statistical analysis and quantitative methods
- Machine learning (for algo optimization, pattern recognition)
- Technology architecture (understanding systems, latency, infrastructure)
- Data analysis (large datasets, order flow analysis)

=== Key Industry Resources

*Professional Development:*
- CFA Charter (valuable for credit and structured products)
- CAIA (alternative investments focus)
- FRM (Financial Risk Manager - relevant for risk aspects)
- ACI Dealing Certificate (specific to FX and money markets)
- *CQF (Certificate in Quantitative Finance)* - increasingly relevant for algo trading

*Industry Associations:*
- Australian Financial Markets Association (AFMA)
- CFA Society Australia
- Financial Markets Association of Australia

*Technology & Algo Trading Resources:*
- FIA (Futures Industry Association) - algo trading working groups
- FIX Protocol (standard for electronic trading messages)
- Academic research on market microstructure and optimal execution

*Key Publications & Data:*
- Bloomberg, Reuters (real-time market data)
- Australian Financial Review (AFR)
- Risk.net, Global Capital (derivatives and structured products)
- *Trade Tech* publications (algo trading, market structure)
- RBA publications (Financial Stability Review, Statement on Monetary Policy)
- APRA quarterly statistics
- ASIC market statistics (algo trading volumes, venue statistics)

*Academic Literature (Market Microstructure & Execution):*
- Almgren & Chriss: "Optimal Execution" papers
- Hasbrouck: "Trading Costs and Returns for US Equities"
- Cont et al: "Order Book Dynamics" research
- Cartea, Jaimungal: "Algorithmic and High-Frequency Trading" (textbook)

#pagebreak()

== Conclusion

Trading roles in Sales & Trading divisions offer dynamic, fast-paced careers for individuals who thrive under pressure, enjoy market complexity, can balance risk-taking with discipline, and increasingly possess strong technological and quantitative skills. The Australian market provides excellent opportunities across rates, FX, commodities, and credit markets, with strong regulatory frameworks and professional development pathways.

Modern trading is fundamentally different from even a decade ago. Electronic trading, execution algorithms, and automated market making now dominate flow, with 60-80% of volume in liquid markets executed via algorithms. However, human traders remain critical for:
- Complex, bespoke structures requiring judgment
- Large block trades where discretion and market timing are crucial
- Crisis management and extreme volatility where algos may behave unpredictably
- Client relationship management and execution consulting
- Algo strategy, development oversight, and optimization
- Risk management across automated and manual activity

Success in modern trading requires combining traditional skills (derivatives pricing, risk management, market intuition) with new capabilities:
- *Programming*: Python for algo analysis, backtesting, and tools development
- *Market microstructure*: Deep understanding of order book dynamics, liquidity, and execution
- *Quantitative analysis*: Statistical methods, machine learning for pattern recognition
- *Technology*: Understanding systems architecture, latency, infrastructure
- *Data analysis*: Extracting insights from large datasets (order flow, TCA, market data)

The ability to learn from mistakes quickly, adapt to changing markets and technology, maintain risk discipline, and blend algorithmic efficiency with human judgment separates successful traders from those who struggle.

Career progression typically follows: Junior Trader → Trader → Senior Trader → Desk Head → Head of Trading, with increasing branches into specialized roles:
- Electronic trading specialist (managing algos and electronic market making)
- Algo development (working with quants on execution strategies)
- Market structure (understanding venues, regulation, competitive landscape)
- Technology leadership (driving trading systems and infrastructure)

Compensation can be very attractive for top performers, particularly at senior levels, though variable and closely tied to individual and desk P&L. Electronic trading expertise commands premium compensation (10-20% above pure manual trading) given its strategic importance.

The role has evolved significantly with electronic trading, increased regulation, and reduced prop trading post-GFC. Modern traders need stronger technology skills, deeper understanding of regulatory requirements (best execution, algo trading rules), and ability to add value beyond pure market-making. However, the core skills - market intuition, risk management, client service - remain critical and differentiate successful traders.

For students considering trading careers, gaining quantitative skills, learning programming (Python essential), understanding financial markets deeply, and developing ability to perform under pressure are essential. Market microstructure courses, quantitative finance programs, and algorithmic trading competitions provide valuable preparation. Summer internships and graduate rotations provide invaluable exposure to trading floor culture and help determine whether this high-intensity, technology-driven career path is the right fit.

The future of trading lies in the intersection of human judgment and machine intelligence: algorithms will handle routine execution and market making with increasing sophistication, while humans will focus on strategy, client relationships, risk management, and situations requiring discretion. The most successful traders will be those who embrace technology while maintaining the human skills - relationship building, judgment, creativity - that remain irreplaceable.
