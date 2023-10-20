module suifarm::game
{
    use sui::coin::{Self, Coin};
    use sui::event;
    use sui::object::{Self, ID, UID};
    use sui::math;
    use sui::sui::SUI;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::option::{Self, Option};

    struct Player has key, store
    {
        id: UID,
        metadata: vector<u8>
    }

    public entry fun create_player(metadata: vector<u8>, ctx: &mut TxContext)
    {
        transfer::transfer(Player {
            id: object::new(ctx),
            metadata: metadata
        },
        tx_context::sender(ctx));
    }

    public entry fun update_player_metadata(player: &mut Player, metadata: vector<u8>)
    {
        player.metadata = metadata;
    }

    public fun get_player_metadata(player: &Player): vector<u8>
    {
        player.metadata
    }
}