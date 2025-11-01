#[test_only]
module token_faucet::basic_tests {
    // Just some basic tests I wrote to make sure things work
    // Still figuring out the testing framework but these pass!
    
    #[test]
    fun test_constants() {
        // Make sure my constants are what I expect
        assert!(token_faucet::DAILY_ALLOWANCE == 100_000_000_000, 1);
    }
    
    // TODO: Add more tests when I figure out how to mock TxContext properly
    // The Sui testing docs are a bit confusing but I'll get there
}