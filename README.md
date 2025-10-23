#  Token Faucet Project – Sui Blockchain

A simple token faucet smart contract on the **Sui blockchain** that distributes **test tokens** to users.
Each address can claim tokens **only once** — ensuring fair distribution.

---

## 🎯 Expected Output

* Users can call `claim()` and **receive 100 SUI**
* Attempting to **claim twice should fail**
* **Events are emitted** for each claim and token addition

---

## ✅ Test Cases to Implement

1. **User claims successfully**
   → Verifies that a user can claim 100 SUI from the faucet.

2. **User tries to claim twice (should fail)**
   → Ensures double-claim prevention using claim tracking.

3. **Multiple users claim**
   → Confirms multiple unique users can each claim once.

4. **Admin adds more tokens**
   → Validates admin function for refilling the faucet balance.

---

## 🧩 Features

* **One-time claim per address**
* **Fixed token distribution:** 100 SUI per claim
* **Event emission:** Tracks token claims and refills
* **Admin control:** Add more tokens anytime
* **Shared object design:** Allows multiple users to interact safely

---

## 📁 Project Structure

```
token-faucet/
├── Move.toml                      # Package configuration
├── sources/
│   └── token_faucet.move          # Main contract implementation
├── tests/
│   └── token_faucet_tests.move    # Unit tests for faucet functionality
└── README.md                      # Project documentation
```

---

## ⚙️ Contract Overview

### **Constants**

| Constant       | Value                  | Description           |
| -------------- | ---------------------- | --------------------- |
| `CLAIM_AMOUNT` | `100_000_000_000` MIST | Equivalent to 100 SUI |

---

### **Error Codes**

| Code                       | Name                 | Description                              |
| -------------------------- | -------------------- | ---------------------------------------- |
| `EAlreadyClaimed (0)`      | Already Claimed      | User has already claimed tokens          |
| `EInsufficientBalance (1)` | Insufficient Balance | Faucet lacks enough SUI to fulfill claim |

---

### **Events**

| Event           | Trigger                 | Description                                  |
| --------------- | ----------------------- | -------------------------------------------- |
| `TokensClaimed` | On successful claim     | Emitted with claimer address and amount      |
| `TokensAdded`   | On admin token addition | Emitted with added amount and faucet balance |

---

## 🧪 Testing Focus

All test cases are written in `tests/token_faucet_tests.move`.

**Key Scenarios:**

| Test Name                       | Description                | Expected Result           |
| ------------------------------- | -------------------------- | ------------------------- |
| `test_user_claims_successfully` | User calls `claim()`       | Receives 100 SUI          |
| `test_user_claims_twice_fails`  | User calls `claim()` twice | Fails on second attempt   |
| `test_multiple_users_claim`     | Several users claim        | All succeed independently |
| `test_admin_adds_more_tokens`   | Admin adds tokens          | Faucet balance increases  |

---

## 🔐 Security & Safety

* **Claim tracking:** Prevents double claims
* **Balance validation:** Rejects claims if faucet balance is insufficient
* **Event transparency:** Provides clear on-chain traceability
* **Admin-only operations:** Restricted token top-ups

---

## 📘 Learning Highlights

This project demonstrates several **core Sui Move** concepts:

* **Shared Objects** – Global faucet accessible by all users
* **Tables** – Tracking claimed addresses efficiently
* **Event Emission** – Logging on-chain actions
* **Access Control** – Role-based function restrictions
* **Balance Management** – Handling and distributing tokens safely

---

## 📜 License

This project was built for **educational purposes** as part of a hackathon.
Feel free to modify, extend, and improve it!

---

## 🎉 Ready for Hackathon!

Your token faucet is ready! Users can now:
1. Visit your faucet
2. Claim their 100 SUI (once per address)
3. Use tokens for testing

Good luck with your hackathon! 🏆
