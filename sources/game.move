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
    use std::string::{Self, String};

    struct Player has key, store
    {
        id: UID,
        xp: u8,
        inventory: Option<Inventory>
    }

    struct Inventory has key, store
    {
        pickaxe: Option<Item>,
        axe: Option<Item>,
        basket: Option<Item>,
        corn: Option<Item>,
        parsnip: Option<Item>,
        pumpkin: Option<Item>,
        stone: Option<Item>,
        weed: Option<Item>,
        wood: Option<Item>,
        hoe: Option<Item>,
        scythe: Option<Item>,
        acorn: Option<Item>,
        parsnip_seed: Option<Item>,
        pine: Option<Item>,
        watering_can: Option<Item>
    }

    struct Item has key, store
    {
        id: UID,
        in_game_id: u8,
        held: u8,
        name: string::String,
        image_url: string::String,
    }

    public entry fun create_player(xp: u8, ctx: &mut TxContext)
    {
        let inventory = create_new_inventory();
        transfer::transfer(Player {
            id: object::new(ctx),
            xp: xp,
            inventory: option::some(inventory)
        },
        tx_context::sender(ctx));
    }

    fun create_new_inventory(): Inventory
    {
        Inventory
        {
            pickaxe: option::some(Item {
                id: object::new(),
                in_game_id: 10013,
                held: 0,
                name: "Pickaxe",
                image_url: "https://bafkreicpi5dtcswo7e3dvly2upwzjse3k3dy6q3gycwfjm434nmh4bfiri.ipfs.dweb.link/"
            }),
            axe: option::some(Item {
                id: object::new(),
                in_game_id: 10005,
                held: 0,
                name: "Axe",
                image_url: "https://bafkreielbw2mux3vptrzuougyt7bt4ctwgyw6igfnlnhsh6yvoz3avndem.ipfs.dweb.link/"
            }),
            basket: option::some(Item {
                id: object::new(),
                in_game_id: 10012,
                held: 0,
                name: "Basket",
                image_url: "https://bafkreiaty23ypd5cjlvtmdbpngbnmvtiyltqzvctplbznfyyiwvmjhamqu.ipfs.dweb.link/"
            }),
            corn: option::some(Item {
                id: object::new(),
                in_game_id: 10002,
                held: 0,
                name: "Corn",
                image_url: "https://bafkreifltsjqnye4l7wkptdvjnaz6od5ogn6vwrytumm3glgm7fcm33jrq.ipfs.dweb.link/"
            }),
            parsnip: option::some(Item {
                id: object::new(),
                in_game_id: 10007,
                held: 0,
                name: "Parsnip",
                image_url: "https://bafkreia4mcrcfr6iwcrhsah57ywerws5wi7gamxj7b523qi35g5logjagy.ipfs.dweb.link/"
            }),
            pumpkin: option::some(Item {
                id: object::new(),
                in_game_id: 10001,
                held: 0,
                name: "Pumpkin",
                image_url: "https://bafkreiga5iz5vmdkvgzq375ntcbs4jziyv5symfz6skmd4wtuvv36njlh4.ipfs.dweb.link/"
            }),
            stone: option::some(Item {
                id: object::new(),
                in_game_id: 10015,
                held: 0,
                name: "Stone",
                image_url: "https://bafkreiehvy5d4h5xh6doiaxsss5vecbixd7ll6dcfbdolojyjtqwxzsh54.ipfs.dweb.link/"
            }),
            weed: option::some(Item {
                id: object::new(),
                in_game_id: 10020,
                held: 0,
                name: "Weed",
                image_url: "https://bafkreihwayy5uko53ffhganvhfczgom7vv7wcymzfhltt77ixwsqmnkjvm.ipfs.dweb.link/"
            }),
            wood: option::some(Item {
                id: object::new(),
                in_game_id: 10008,
                held: 0,
                name: "Wood",
                image_url: "https://bafkreifpgtzqvighooclv5p3czwqj7lutnoeup23oi5buoqwg7v5zhntqm.ipfs.dweb.link/"
            }),
            hoe: option::some(Item {
                id: object::new(),
                in_game_id: 10004,
                held: 0,
                name: "Hoe",
                image_url: "https://bafkreibraxpnocidllmhriknwuuy6whyh6ixuwtpfydmcsimldndemr2v4.ipfs.dweb.link/"
            }),
            scythe: option::some(Item {
                id: object::new(),
                in_game_id: 10017,
                held: 0,
                name: "Scythe",
                image_url: "https://bafkreifigrglrdbtzjbgfwkpor3ezjw2x7jfpn4gvaokshuktmast3nw6a.ipfs.dweb.link/"
            }),
            acorn: option::some(Item {
                id: object::new(),
                in_game_id: 10000,
                held: 0,
                name: "Acorn",
                image_url: "https://bafkreihhoqzanwbie5g6txegv5uiwnlp7ca5gnvmkmuqrxyyj2hkma54ly.ipfs.dweb.link/"
            }),
            parsnip_seed: option::some(Item {
                id: object::new(),
                in_game_id: 10006,
                held: 0,
                name: "Parsnip Seed",
                image_url: "https://bafkreibmmduvgawjpjlo6h6usuudfwy6syivdewgvz666ljpplwojli5aq.ipfs.dweb.link/"
            }),
            pine: option::some(Item {
                id: object::new(),
                in_game_id: 10009,
                held: 0,
                name: "Pine",
                image_url: "https://bafkreiaiz4mjx3uneh6bei2yih7bfzuc5vlsixulh3soxtrh2pqldspvu4.ipfs.dweb.link/"
            }),
            watering_can: option::some(Item {
                id: object::new(),
                in_game_id: 10003,
                held: 0,
                name: "Watering Can",
                image_url: "https://bafkreiezn4g476kojoomuoh7euuflhcwy3mxn4h7qow2fgxabkbgozpnwa.ipfs.dweb.link/"
            })
        }
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