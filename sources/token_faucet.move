// My SUI Faucet implementation for the SuiCoders challenge
// Built this to help new users get started with SUI tokens
module 0x0::token_faucet {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::table::{Self, Table};
    use sui::event;

    // I chose 100 SUI as a reasonable amount for new users
    const DAILY_ALLOWANCE: u64 = 100_000_000_000; // 100 SUI in MIST
    const ERR_ALREADY_CLAIMED: u64 = 1001; // Custom error codes start from 1000
    const ERR_FAUCET_EMPTY: u64 = 1002;

    public struct Faucet has key {
        id: object::UID,
        balance: Balance<SUI>,
        users_claimed: Table<address, bool>, // Keep track of who got their tokens
    }

    // Event to track when someone claims tokens
    public struct TokensClaimed has copy, drop {
        user: address,
        amount_claimed: u64,
        block_time: u64, // Added timestamp for better tracking
    }

    // Initialize the faucet - this runs when the contract is deployed
    fun init(ctx: &mut TxContext) {
        let faucet = Faucet {
            id: object::new(ctx),
            balance: balance::zero(), // Start with empty balance
            users_claimed: table::new(ctx),
        };
        // Make it shared so everyone can use it
        transfer::share_object(faucet);
    }

    // Main function for users to claim their daily SUI
    public fun claim(faucet: &mut Faucet, ctx: &mut TxContext) {
        let user = tx_context::sender(ctx);
        
        // Check if user already got their tokens (prevent abuse)
        assert!(!table::contains(&faucet.users_claimed, user), ERR_ALREADY_CLAIMED);
        // Make sure we have enough SUI in the faucet
        assert!(balance::value(&faucet.balance) >= DAILY_ALLOWANCE, ERR_FAUCET_EMPTY);
        
        // Mark this user as claimed
        table::add(&mut faucet.users_claimed, user, true);
        
        // Give them their SUI tokens
        let user_balance = balance::split(&mut faucet.balance, DAILY_ALLOWANCE);
        let sui_coin = coin::from_balance(user_balance, ctx);
        
        // Emit event for tracking purposes
        event::emit(TokensClaimed {
            user,
            amount_claimed: DAILY_ALLOWANCE,
            block_time: tx_context::epoch(ctx),
        });
        
        // Send the tokens to the user
        transfer::public_transfer(sui_coin, user);
    }

    // Admin function to refill the faucet when it runs low
    public fun refill_faucet(faucet: &mut Faucet, sui_coins: Coin<SUI>) {
        let new_balance = coin::into_balance(sui_coins);
        balance::join(&mut faucet.balance, new_balance);
    }

    // Check how much SUI is left in the faucet
    public fun check_faucet_balance(faucet: &Faucet): u64 {
        balance::value(&faucet.balance)
    }

    // See if someone already got their daily SUI
    public fun user_already_claimed(faucet: &Faucet, user_addr: address): bool {
        table::contains(&faucet.users_claimed, user_addr)
    }

    // Helper function to check how many more users can claim
    public fun remaining_claims(faucet: &Faucet): u64 {
        let current_balance = balance::value(&faucet.balance);
        current_balance / DAILY_ALLOWANCE
    }
}