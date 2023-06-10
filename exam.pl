smoothie(berries, [blueberry, strawberry, raspberry, banana], 1.99).
smoothie(tropical, [pineapple, banana, mango, guava], 1.99).
smoothie(citrus, [orange, lime, grapefruit, yogurt], 1.89).
smoothie(pinacolada, [banana, pineapple, coconut], 1.79).
smoothie(kiwi, [kiwi, banana, avocado], 1.89).
smoothie(green, [spinach, apple, lime], 1.79).


% which_smoothie(Ingredients, Smoothie) :-
%     smoothie(Smoothie, SmoothieIngredients, _),
%     subset(SmoothieIngredients, Ingredients).


which_smoothie(Ingredients, Smoothie) :-
    smoothie(Smoothie, SmoothieIngredients, _),
    subset(SmoothieIngredients, Ingredients).