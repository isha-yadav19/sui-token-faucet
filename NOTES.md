# Development Notes

Just keeping track of my thoughts while building this...

## What I learned
- Move is pretty different from Solidity! 
- The ownership model took me a while to understand
- Balance<SUI> vs Coin<SUI> was confusing at first
- Shared objects are cool - no need for complex access patterns

## Issues I ran into
- Had trouble with the Table import initially
- Forgot to add the `key` ability to my struct (compiler error helped)
- Event emission syntax is different than I expected

## Things I might improve
- Maybe add a cooldown period instead of one-time claim?
- Could add different claim amounts for different user tiers
- Admin functions could use better access control

## Testing
- Basic tests pass but need to add more comprehensive ones
- Sui testing framework is still new to me
- Deployed on testnet and it works! 🎉

---
*These are just my personal notes while learning Move/Sui*