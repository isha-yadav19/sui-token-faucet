module 0x0::token_faucet {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::table::{Self, Table};
    use sui::event;

    const CLAIM_AMOUNT: u64 = 100_000_000_000; // 100 SUI in MIST
    const EAlreadyClaimed: u64 = 1;
    const EInsufficientBalance: u64 = 2;

    public struct Faucet has key {
        id: object::UID,
        balance: Balance<SUI>,
        claimed_addresses: Table<address, bool>,
    }

    public struct ClaimEvent has copy, drop {
        claimer: address,
        amount: u64,
    }

    fun init(ctx: &mut TxContext) {
        let faucet = Faucet {
            id: object::new(ctx),
            balance: balance::zero(),
            claimed_addresses: table::new(ctx),
        };
        transfer::share_object(faucet);
    }

    public fun claim(faucet: &mut Faucet, ctx: &mut TxContext) {
        let claimer = tx_context::sender(ctx);
        
        assert!(!table::contains(&faucet.claimed_addresses, claimer), EAlreadyClaimed);
        assert!(balance::value(&faucet.balance) >= CLAIM_AMOUNT, EInsufficientBalance);
        
        table::add(&mut faucet.claimed_addresses, claimer, true);
        
        let claim_balance = balance::split(&mut faucet.balance, CLAIM_AMOUNT);
        let claim_coin = coin::from_balance(claim_balance, ctx);
        
        event::emit(ClaimEvent {
            claimer,
            amount: CLAIM_AMOUNT,
        });
        
        transfer::public_transfer(claim_coin, claimer);
    }

    public fun add_tokens(faucet: &mut Faucet, tokens: Coin<SUI>) {
        let token_balance = coin::into_balance(tokens);
        balance::join(&mut faucet.balance, token_balance);
    }

    public fun get_balance(faucet: &Faucet): u64 {
        balance::value(&faucet.balance)
    }

    public fun has_claimed(faucet: &Faucet, addr: address): bool {
        table::contains(&faucet.claimed_addresses, addr)
    }
}