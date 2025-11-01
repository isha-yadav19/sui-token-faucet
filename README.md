# 🚰 SUI Token Faucet - SuiCoders Challenge

A complete token faucet implementation for Sui blockchain built with Move language.

## 🔥 Features
- ✅ **Fixed 100 SUI claim amount** per user
- ✅ **One-time claim restriction** per address  
- ✅ **Balance management** with Balance<SUI>
- ✅ **Event emission** for claim tracking
- ✅ **Shared object** for multi-user access
- ✅ **Admin functions** for token management
- ✅ **Proper error handling** and validation

## 🚀 Live Deployment
- **Package ID:** `0x80f62011abf26511eb12a8bdf3faf95850efc0d537c9018d8d05d557d1bffd57`
- **Faucet Object:** `0x500ae70aa8970243323e6ad34bfeb49c635db7dd0aa1cdce52aee7858a8403a1`
- **Network:** Sui Testnet

## 💻 Tech Stack
- Move Language
- Sui Framework
- Balance<SUI> for token management
- Table for address tracking
- Events for monitoring

## 🛠️ Usage

### Build & Deploy
```bash
sui move build
sui client publish --gas-budget 100000000
```

### Functions
- `claim()` - Users claim 100 SUI tokens (once per address)
- `add_tokens()` - Admin adds tokens to faucet
- `get_balance()` - Check current faucet balance
- `has_claimed()` - Check if address already claimed

## 📋 Requirements Met
✅ Create a faucet that holds a balance of tokens  
✅ Users can request a fixed amount of tokens (100 SUI)  
✅ Each address can only claim once  
✅ Track which addresses have already claimed  
✅ Emit events when tokens are claimed  
✅ Use shared objects for the faucet  
✅ Implement balance management  
✅ Add address tracking using Table  
✅ Include basic access control  

## 🏆 Built for SuiCoders Challenge
Demonstrating best practices in Move smart contract development.

---
**Author:** isha-yadav19  
**Challenge:** SuiCoders Token Faucet Implementation