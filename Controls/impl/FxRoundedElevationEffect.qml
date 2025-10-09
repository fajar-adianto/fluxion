import Fluxion

FxElevationEffect {
    required property FxShapeToken shapeToken

    _strength: (shapeToken.role === FxShapeToken.Role.None) ?
                   FxStyle.tokens.ref.elevation.shadow.defaultStrength : roundedStrength()

    // See comment on FxBoxShadow's strength property for why we do this.
    function roundedStrength() {
        // We don't want the strength to be too high for the controls with very slightly rounded
        // corners, as they are quite close to the non-rounded ones in terms of not needing adjustments.
        // This is still not great for the higher elevations for ExtraSmallScale, but it's as good
        // as I can get it.
        var max_strength = FxStyle.tokens.ref.elevation.shadow.maxStrength / ((shapeToken.role === FxShapeToken.Role.ExtraSmall) ? 4 : 1);
        var min_strength = FxStyle.tokens.ref.elevation.shadow.defaultStrength * ((shapeToken.role === FxShapeToken.Role.ExtraSmall) ? 1 : 4);
        var d_strength = max_strength - min_strength;
        var decrement = d_strength / FxStyle.tokens.ref.elevation.maxDistance;
        var rounded_strength = max_strength - (_elevation * decrement);
        return rounded_strength;
    }
}
