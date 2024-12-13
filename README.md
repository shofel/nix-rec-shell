A nix shell, which recursively starts itself

- state progresses with every step
- shell substitutes itself with the same shell populated by the next state.

It can be evolved to a snake game or other games. Snake game differs from this example in three ways:
- state is a matrix of 0 and 1
- state should be rendered differently
- state change must consider the action of the gamer
