import 'dart:math';

class CaptureCalculator {
  /// Calculates the probability of capturing a Pokémon based on the given parameters.
  ///
  /// [generation]: The generation of the Pokémon game (1-9).
  /// [maxHp]: The maximum HP of the Pokémon.
  /// [currentHp]: The current HP of the Pokémon.
  /// [captureRate]: The capture rate of the Pokémon species.
  /// [ballBonus]: The catch rate multiplier of the Poké Ball used.
  /// [statusBonus]: The catch rate multiplier for the status condition (e.g., sleep, paralysis).
  /// [level]: (Required, Gen I only) The level of the opposing Pokémon.
  /// [opponentStatusBonus]: (Required, Gen I only) The status multiplier of the opposing Pokémon.
  /// [numBadges]: (Required, Gen 9 only) The number of Gym Badges the player has.
  /// [hasCatchingCharm]: (Required, Gen 9 only) Whether the player has the Catching Charm.
  /// [catchingPowerLevel]: (Required, Gen 9 only) The level of Catching Power (0-3).
  /// [pokedexEntries]: (Required, Gen 9 only) The number of registered pokedex entries.
  ///
  /// Returns a double representing the probability of capture (0.0 to 1.0).
  static double calculateCaptureProbability({
    required int generation,
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
    int? level,
    double? opponentStatusBonus,
    int? numBadges,
    bool? hasCatchingCharm,
    int? catchingPowerLevel,
    int? pokedexEntries,
  }) {
    if (generation < 1 || generation > 9) {
      throw ArgumentError('Invalid generation. Generation must be between 1 and 9.');
    }

    if (currentHp < 0 || currentHp > maxHp) {
      throw ArgumentError(
          'Invalid currentHp: $currentHp. Must satisfy 0 <= currentHp <= maxHp ($maxHp).');
    }

    if (generation == 1) {
      if (level == null || opponentStatusBonus == null) {
        throw ArgumentError(
            'Generation 1 requires both level and opponentStatusBonus to be provided.');
      }
      return _calculateGen1CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
        level: level,
        opponentStatusBonus: opponentStatusBonus,
      );
    } else if (generation == 2) {
      return _calculateGen2CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
      );
    } else if (generation >= 3 && generation <= 4) {
      return _calculateGen3and4CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
      );
    } else if (generation == 5) {
      return _calculateGen5CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
      );
    } else if (generation >= 6 && generation <= 7) {
      return _calculateGen6and7CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
      );
    } else if (generation == 8) {
      return _calculateGen6and7CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
      );
    } else if (generation == 9) {
      if (numBadges == null ||
          hasCatchingCharm == null ||
          catchingPowerLevel == null ||
          pokedexEntries == null) {
        throw ArgumentError(
            'Generation 9 requires numBadges, hasCatchingCharm, catchingPowerLevel, and pokedexEntries to be provided.');
      }
      return _calculateGen9CaptureProbability(
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: captureRate,
        ballBonus: ballBonus,
        statusBonus: statusBonus,
        numBadges: numBadges,
        hasCatchingCharm: hasCatchingCharm,
        catchingPowerLevel: catchingPowerLevel,
        pokedexEntries: pokedexEntries,
      );
    }

    throw ArgumentError('Invalid generation.');
  }


  static double _calculateGen1CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
    required int level,
    required double opponentStatusBonus,
  }) {
    //Formula from https://www.dragonflycave.com/mechanics/gen-i-capturing
    //
    //CONFIRMED via source (WebFetch of the page above, 2026-07-24): in Gen I
    //the status-based auto-capture check is a *separate, independent* step
    //that happens *before* (and regardless of) the catch-rate/HP-based check.
    //Quote: "Subtract S from R1 (to avoid confusion with the original R1, I
    //will refer to the result as R*). If R* is less than zero (i.e. if the
    //generated R1 was less than S), the Pokémon is successfully caught." R1
    //is a uniformly random roll from 0-255 (256 possible values), and this
    //auto-capture check does NOT depend on the Pokémon's catch rate at all.
    //
    //The previous implementation summed statusValue directly into the
    //catch-rate-based formula *before* the >=255 guaranteed-catch check, i.e.
    //it treated status as boosting the same deterministic threshold used for
    //the HP/catch-rate check. That conflates two independent mechanics. The
    //fix below evaluates the status-triggered auto-capture as its own
    //probability (statusValue / 256), then combines it with the catch-rate
    //based probability the way two independent sequential "catch checks" are
    //supposed to combine: P = P(status) + (1 - P(status)) * P(rate).
    int statusValue;
    if (statusBonus == 2.0) {
      // Sleep or Frozen
      statusValue = 25;
    } else if (statusBonus == 1.5) {
      //Paralyzed, Burned or Poisoned
      statusValue = 12;
    } else {
      statusValue = 0;
    }

    //P(R1 < S) out of the 256 possible values (0-255) of R1.
    double statusAutoCatchProbability = statusValue / 256.0;

    double baseCaptureChance =
        ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) / (3 * maxHp);

    //Capture is guaranteed if the base (non-status) value is equal or higher than 255.
    if (baseCaptureChance >= 255) return 1.0;

    int shakeCheck = (65536 / pow(255 / baseCaptureChance, 0.75)).floor();

    double p = shakeCheck / 65536;

    //We are ignoring the Diversion against wild Ditto on Gen 1
    double rateBasedProbability = pow(p, 4).toDouble();

    return statusAutoCatchProbability +
        (1 - statusAutoCatchProbability) * rateBasedProbability;
  }

  static double _calculateGen2CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
  }) {
    //Formula from https://www.dragonflycave.com/mechanics/gen-ii-capturing
    //
    //CONFIRMED via source (WebFetch of the page above, 2026-07-24): "X = max(
    //((3M - 2H) * C) / (3M), 1) + S" - the status bonus S is added to the
    //base term *before* the combined value X is capped/checked against 255
    //("The final capture rate X can range from 1 to 255 (if it's higher than
    //255 at the end of the calculation, it is made 255 instead)"). So, unlike
    //Gen I, adding the status bonus BEFORE the >=255 guaranteed-catch check
    //is the CORRECT order for Gen II and required no change here.
    int statusValue;
    if (statusBonus == 2.0) {
      // Sleep or Frozen
      statusValue = 10;
    } else if (statusBonus == 1.5) {
      //Paralyzed, Burned or Poisoned
      statusValue = 5;
    } else {
      statusValue = 0;
    }

    double a =
        ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) / (3 * maxHp) +
            statusValue;

    //Capture is guaranteed if the value is equal or higher to 255
    if (a >= 255) return 1.0;

    int shakeCheck = (65536 / pow(255 / a, 0.75)).floor();

    double p = shakeCheck / 65536; // Corrected: Removed .floor() here

    return pow(p, 4).toDouble();
  }

  static double _calculateGen3and4CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
  }) {
    //Formula from https://www.dragonflycave.com/mechanics/gen-iii-iv-capturing
    double a = ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) /
        (3 * maxHp) *
        statusBonus;

    //Capture is guaranteed if the value is equal or higher to 255
    if (a >= 255) return 1.0;

    int shakeCheck = (65536 / pow(255 / a, 0.75)).floor();

    double p = shakeCheck / 65536; // Corrected: Removed .floor() here

    return pow(p, 4).toDouble();
  }

  static double _calculateGen5CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
  }) {
    //Formula from https://www.dragonflycave.com/mechanics/gen-v-capturing
    double a = ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) /
        (3 * maxHp) *
        statusBonus;

    //Capture is guaranteed if the value is equal or higher to 255
    if (a >= 255) return 1.0;

    //Modified capture rate used only on the shake calculation
    int modifiedCaptureRate =
        ((a * 255) / ((3 * maxHp - 2 * currentHp) * ballBonus)).floor();
    if (modifiedCaptureRate > 255) modifiedCaptureRate = 255;
    if (modifiedCaptureRate < 1) modifiedCaptureRate = 1;

    int shakeCheck = (65536 / pow(255 / modifiedCaptureRate, 0.1875)).floor();

    double p = shakeCheck / 65536; // Corrected: Removed .floor() here

    return pow(p, 4).toDouble();
  }

  static double _calculateGen6and7CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
  }) {
    //Formula from https://www.dragonflycave.com/mechanics/gen-vi-vii-capturing
    double a = ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) /
        (3 * maxHp) *
        statusBonus;

    //Capture is guaranteed if the value is equal or higher to 255
    if (a >= 255) return 1.0;

    int shakeCheck = (65536 / pow(255 / a, 0.1875)).floor();

    double p = shakeCheck / 65536; // Corrected: Removed .floor() here

    return pow(p, 4).toDouble();
  }

  static double _calculateGen9CaptureProbability({
    required int maxHp,
    required int currentHp,
    required int captureRate,
    required double ballBonus,
    required double statusBonus,
    required int numBadges,
    required bool hasCatchingCharm,
    required int catchingPowerLevel,
    required int pokedexEntries,
  }) {
    // Formula based on https://www.dragonflycave.com/mechanics/gen-ix-capturing
    // and https://bulbapedia.bulbagarden.net/wiki/Catch_rate#Generation_IX

    // --- Badge Bonus ---
    double badgeMultiplier = 1.0;
    if (numBadges <= 1) {
      badgeMultiplier = 1.0;
    } else if (numBadges == 2) {
      badgeMultiplier = 1.1;
    } else if (numBadges == 3) {
      badgeMultiplier = 1.2;
    } else if (numBadges == 4) {
      badgeMultiplier = 1.3;
    } else if (numBadges == 5) {
      badgeMultiplier = 1.4;
    } else if (numBadges == 6) {
      badgeMultiplier = 1.6;
    } else if (numBadges == 7) {
      badgeMultiplier = 1.8;
    } else if (numBadges >= 8) {
      badgeMultiplier = 2.0;
    }

    // --- Catching Charm ---
    double charmMultiplier = hasCatchingCharm ? 2.0 : 1.0;

    // --- Catching Power ---
    double catchingPowerMultiplier = 1.0;
    if (catchingPowerLevel == 1) {
      catchingPowerMultiplier = 1.5;
    } else if (catchingPowerLevel == 2) {
      catchingPowerMultiplier = 2.0;
    } else if (catchingPowerLevel == 3) {
      catchingPowerMultiplier = 2.5;
    }

    // --- Critical Capture ---
    //The critical capture rate is determined as follows:
    //c = floor(m * k * l / 6)
    //where:
    //  - m is the modified capture rate
    //  - k is 1 if the player does not have the Catching Charm, or 3 if the player does
    //  - l is a value that depends on the player's caught Pokémon count p:
    //      if p < 30:   l = 1
    //  else if p < 150:  l = 1.5
    //  else if p < 300:  l = 2
    //  else if p < 450:  l = 2.5
    //  else if p < 600:  l = 3
    //  else:             l = 4
    //If c ≥ 255, a critical capture is guaranteed to occur.
    //Otherwise, the probability of a critical capture is c / 256.

    //Modified Capture Rate
    double m = ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) / (3 * maxHp);

    //Catching Charm Multiplier
    double k = hasCatchingCharm ? 3.0 : 1.0;

    //Caught Pokemon Multiplier
    double l;
    if(pokedexEntries < 30){
      l = 1;
    } else if (pokedexEntries < 150){
      l = 1.5;
    } else if (pokedexEntries < 300){
      l = 2;
    } else if (pokedexEntries < 450){
      l = 2.5;
    } else if (pokedexEntries < 600){
      l = 3;
    } else {
      l = 4;
    }

    //Critical Capture Rate
    double criticalCaptureRate = (m * k * l / 6).floor().toDouble();
    if (criticalCaptureRate > 255) criticalCaptureRate = 255;

    double criticalCaptureProbability = criticalCaptureRate / 256;

    // --- Final Calculation ---
    double a = ((3 * maxHp - 2 * currentHp) * captureRate * ballBonus) /
        (3 * maxHp) *
        statusBonus *
        badgeMultiplier *
        charmMultiplier *
        catchingPowerMultiplier;

    // Capture is guaranteed if the value is equal or higher to 255
    if (a >= 255) return 1.0;

    //There are only two shakes on a critical capture
    int shakeCheck = (1048560 / sqrt(sqrt(16711680 / a))).floor();

    double p = shakeCheck / 65536;

    return criticalCaptureProbability + (1 - criticalCaptureProbability) * pow(p, 4);
  }
}
