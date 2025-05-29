import Fluxion

FxElevationEffect {
    required property FxShapeToken shapeToken

    _strength: (shapeToken.role == FxShapeToken.Role.None) ?
                   FxStyle.tokens.ref.elevation.shadow.defaultStrength : roundedStrength()

    // See comment on FxBoxShadow's strength property for why we do this.
    function roundedStrength() {
        // We don't want the strength to be too high for the controls with very slightly rounded
        // corners, as they are quite close to the non-rounded ones in terms of not needing adjustments.
        // This is still not great for the higher elevations for ExtraSmallScale, but it's as good
        // as I can get it.
        var decrement = (shapeToken.role == FxShapeToken.Role.ExtraSmall) ? 0.15 : 0.05;
        var rounded_strength = FxStyle.tokens.ref.elevation.shadow.maxStrength - (_elevation * decrement);
        return Math.max(FxStyle.tokens.ref.elevation.shadow.defaultStrength, rounded_strength);
    }
}
