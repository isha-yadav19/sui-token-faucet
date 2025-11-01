# SUI Token Faucet 🚰

Hey! This is my submission for the SuiCoders challenge. I built a token faucet that gives out 100 SUI to new users.

## What it does
- Users can claim 100 SUI tokens (but only once!)
- Keeps track of who already claimed to prevent abuse
- Admins can refill the faucet when it runs low
- Emits events so we can track usage
- Built as a shared object so everyone can use it

## Already deployed! 🎉
I deployed this on Sui testnet:
- Package: `0x80f62011abf26511eb12a8bdf3faf95850efc0d537c9018d8d05d557d1bffd57`
- Faucet: `0x500ae70aa8970243323e6ad34bfeb49c635db7dd0aa1cdce52aee7858a8403a1`

## How I built it
- Used Move language (still learning but getting the hang of it!)
- Sui's Balance<SUI> for managing tokens
- Table to remember who claimed already
- Events to track what's happening

## How to use it

To build and test:
```bash
sui move build
sui move test
```

To deploy your own:
```bash
sui client publish --gas-budget 100000000
```

### Main functions:
- `claim()` - Get your 100 SUI (once per address)
- `refill_faucet()` - Add more SUI to the faucet
- `check_faucet_balance()` - See how much SUI is left
- `user_already_claimed()` - Check if someone already claimed

## Challenge requirements ✓
I made sure to hit all the requirements:
- ✓ Faucet holds SUI tokens
- ✓ Fixed 100 SUI per claim
- ✓ One claim per address (no cheating!)
- ✓ Tracks who claimed
- ✓ Events for monitoring
- ✓ Shared object design
- ✓ Proper balance management
- ✓ Error handling

## Notes
This was a fun challenge! Move is pretty different from other languages I've used, but I'm getting the hang of it. The hardest part was figuring out the Balance<SUI> vs Coin<SUI> stuff.

Feel free to check out the code and let me know if you spot any issues!

---
Built by isha-yadav19 for SuiCoders 🚀