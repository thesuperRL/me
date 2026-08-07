# Reinforced-Riichi-Player

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A Python simulation and evaluation framework for Riichi Mahjong, exploring reinforcement learning approaches for automated play. Implements the tile and hand data model with win-condition detection logic.
**Language(s):** Python
**Active period:** 2023-07-17 to 2023-07-17
**Fork of:** Original

## Design Decisions

- Tile model: `MahjongTile(amount, type, doraHan)` covers all suit types (man, pin, sou, honors)
- Hand model: `MahjongHand(playerSeat)` tracks tiles, discards, and menzen (open melds) per player
- Win detection (`if_ron`) partitions the hand into suits then sorts each group for sequential analysis
- `detect_remove_trios` uses an occurrence count array (length 9 for each tile value 1-9) to greedily strip complete sets (triplets) from a suited tile list, mutating the list in place and returning trio count; this is a step toward decomposing the hand into blocks for tenpai/win detection
- `sorter(e)` global function sorts tiles by `amount` for use with `list.sort(key=sorter)`
- Very early/exploratory stage; RL training not yet implemented in this snapshot

## Ryan's Contributions

Sole developer. Initial commit on 2023-07-17; 2 commits total.

- Defined `MahjongTile` and `MahjongHand` classes with `__str__`/`__repr__`
- Implemented `detect_remove_trios` block-removal logic
- Stubbed `if_ron` win-check structure partitioning hand into man/pin/sou/honors lists
- Committed `requirements.txt` for dependencies
