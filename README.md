# StacksPredict: L2-Powered Bitcoin Price Prediction Protocol

A sophisticated decentralized prediction market protocol built on Stacks L2, enabling secure and transparent Bitcoin price predictions. The protocol leverages Stacks' unique Bitcoin-native capabilities to create a robust market for BTC price movement predictions.

## Features

### Core Functionality

- Create prediction markets for Bitcoin price movements
- Stake STX tokens on price direction (up/down)
- Proportional reward distribution based on stake
- Oracle-based price resolution
- Automated winner determination and payout

### Technical Advantages

- L2 scalability for reduced transaction costs
- Real-time BTC price oracle integration
- Trustless smart contract execution
- Anti-manipulation safeguards
- Double-claim prevention

### Security Measures

- Role-based access control
- Oracle price verification
- Minimum stake requirements
- Platform sustainability through fee mechanism
- Comprehensive error handling

## Smart Contract Interface

### Public Functions

#### `create-market`

Creates a new prediction market.

```clarity
(create-market (start-price uint) (start-block uint) (end-block uint))
```

- `start-price`: Initial BTC price for the market
- `start-block`: Block height when market opens
- `end-block`: Block height when market closes
- Returns: Market ID (uint)

#### `make-prediction`

Places a prediction stake in an active market.

```clarity
(make-prediction (market-id uint) (prediction (string-ascii 4)) (stake uint))
```

- `market-id`: Target market identifier
- `prediction`: "up" or "down"
- `stake`: Amount of STX to stake (minimum 1 STX)
- Returns: Boolean success status

#### `claim-winnings`

Claims winnings for a resolved market.

```clarity
(claim-winnings (market-id uint))
```

- `market-id`: Target market identifier
- Returns: Payout amount (uint)

### Read-Only Functions

#### `get-market`

Retrieves market details.

```clarity
(get-market (market-id uint))
```

Returns market data structure:

- `start-price`: Initial BTC price
- `end-price`: Final BTC price (if resolved)
- `total-up-stake`: Total STX staked on upward movement
- `total-down-stake`: Total STX staked on downward movement
- `start-block`: Opening block height
- `end-block`: Closing block height
- `resolved`: Market resolution status

#### `get-user-prediction`

Retrieves user prediction details.

```clarity
(get-user-prediction (market-id uint) (user principal))
```

Returns prediction data:

- `prediction`: User's prediction ("up"/"down")
- `stake`: Amount staked
- `claimed`: Whether winnings were claimed

#### `get-contract-balance`

Returns the current contract balance.

```clarity
(get-contract-balance)
```

### Administrative Functions

#### `set-oracle-address`

Updates the oracle address.

```clarity
(set-oracle-address (new-address principal))
```

#### `set-minimum-stake`

Updates minimum stake requirement.

```clarity
(set-minimum-stake (new-minimum uint))
```

#### `set-fee-percentage`

Updates platform fee percentage.

```clarity
(set-fee-percentage (new-fee uint))
```

#### `withdraw-fees`

Withdraws accumulated platform fees.

```clarity
(withdraw-fees (amount uint))
```

## Platform Economics

### Fees and Stakes

- Minimum stake: 1 STX
- Platform fee: 2% of winnings
- Fees are automatically deducted from winnings
- Winners share the total pool proportionally to their stake

### Reward Distribution

1. Total pool = sum of all stakes
2. Winning pool = sum of stakes on correct prediction
3. Individual reward = (user_stake / winning_pool) \* total_pool
4. Platform fee = 2% of individual reward
5. Final payout = reward - platform fee

## Security Considerations

### Access Control

- Contract owner: Administrative functions
- Oracle: Price resolution
- Users: Predictions and claims
- Automated checks prevent unauthorized access

### Market Integrity

- Time-locked markets prevent early resolution
- Minimum stake requirement prevents spam
- Oracle verification ensures accurate price data
- Double-claim prevention through state tracking

### Error Handling

- Comprehensive error codes for all failure cases
- Validation checks for all user inputs
- Balance verification before transfers
- Market state validation for all operations

## Development and Testing

### Prerequisites

- Clarity CLI
- Stacks blockchain node
- Development wallet with STX

### Deployment Steps

1. Deploy contract to Stacks network
2. Set oracle address
3. Configure minimum stake and fees
4. Create initial test market

### Testing Scenarios

1. Market creation and validation
2. Prediction placement with various stakes
3. Market resolution with different price outcomes
4. Winning claims and reward distribution
5. Error condition handling
