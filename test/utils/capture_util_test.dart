import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/capture_util.dart';

void main() {
  group('CaptureCalculator - generation validation', () {
    test('throws ArgumentError for generation below 1', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 0,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        throwsArgumentError,
      );
    });

    test('throws ArgumentError for generation above 9', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 10,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        throwsArgumentError,
      );
    });
  });

  group('CaptureCalculator - invalid HP guard (NaN propagation fix)', () {
    test('throws ArgumentError instead of returning NaN when currentHp > maxHp', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 3,
          maxHp: 100,
          currentHp: 150, // invalid: exceeds maxHp
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        throwsArgumentError,
      );
    });

    test('throws ArgumentError instead of returning NaN when currentHp is negative', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 6,
          maxHp: 100,
          currentHp: -1, // invalid: negative HP
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        throwsArgumentError,
      );
    });

    test('valid boundary HP values (0 and maxHp) do not throw', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 6,
          maxHp: 100,
          currentHp: 0,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        returnsNormally,
      );
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 6,
          maxHp: 100,
          currentHp: 100,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
        ),
        returnsNormally,
      );
    });
  });

  group('CaptureCalculator - missing generation-specific params', () {
    test('generation 1 without level/opponentStatusBonus throws ArgumentError', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 1,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
          // level and opponentStatusBonus intentionally omitted
        ),
        throwsArgumentError,
      );
    });

    test('generation 1 with only level (missing opponentStatusBonus) throws ArgumentError', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 1,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
          level: 10,
        ),
        throwsArgumentError,
      );
    });

    test('generation 9 without gen-9 params throws ArgumentError', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 9,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
          // numBadges, hasCatchingCharm, catchingPowerLevel, pokedexEntries omitted
        ),
        throwsArgumentError,
      );
    });

    test('generation 9 with partially missing params throws ArgumentError', () {
      expect(
        () => CaptureCalculator.calculateCaptureProbability(
          generation: 9,
          maxHp: 100,
          currentHp: 50,
          captureRate: 45,
          ballBonus: 1.0,
          statusBonus: 1.0,
          numBadges: 8,
          hasCatchingCharm: false,
          // catchingPowerLevel and pokedexEntries omitted
        ),
        throwsArgumentError,
      );
    });
  });

  group('CaptureCalculator - Gen I/II auto-catch order fix', () {
    // Scenario: maxHp=100, currentHp=90 (high HP -> hard to catch normally),
    // captureRate=200, Poké Ball (ballBonus=1.0), asleep (statusBonus=2.0).
    //
    // Before the fix, Gen I summed statusValue (25 for sleep/frozen) into the
    // same additive term used for the HP/catch-rate-based >=255 guaranteed
    // catch check and the shake-check formula:
    //   captureChance = base + statusValue = 80 + 25 = 105
    //   -> shake-check probability ~= 6.98%
    //
    // Per https://www.dragonflycave.com/mechanics/gen-i-capturing, the status
    // based auto-capture check ("If R* is less than zero ... the Pokémon is
    // successfully caught") is independent of catch rate and is effectively
    // evaluated before/separately from the catch-rate-based check. The fixed
    // implementation models this as an independent probability
    // (statusValue / 256) combined as P = P(status) + (1-P(status))*P(rate),
    // which raises the total probability to ~12.55% for this scenario -
    // noticeably higher than the old (incorrect) ~6.98%.
    test('Gen I: fixed formula yields a materially different (higher) result than the pre-fix order', () {
      final double fixedValue = CaptureCalculator.calculateCaptureProbability(
        generation: 1,
        maxHp: 100,
        currentHp: 90,
        captureRate: 200,
        ballBonus: 1.0,
        statusBonus: 2.0,
        level: 1,
        opponentStatusBonus: 1.0,
      );

      const double preFixBuggyValue = 0.06981192665175638;

      expect(fixedValue, closeTo(0.12551832156232556, 1e-9));
      // The fix must move the result away from the old (order-bug) value.
      expect(fixedValue, isNot(closeTo(preFixBuggyValue, 1e-6)));
      expect(fixedValue, greaterThan(preFixBuggyValue));
    });

    test('Gen I: with no status, matches a straightforward base-rate calculation (sanity)', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 1,
        maxHp: 100,
        currentHp: 90,
        captureRate: 200,
        ballBonus: 1.0,
        statusBonus: 1.0, // no status
        level: 1,
        opponentStatusBonus: 1.0,
      );

      // With no status, statusAutoCatchProbability is 0, so the result should
      // equal the pure catch-rate-based probability (no auto-catch boost).
      expect(value, inInclusiveRange(0.0, 1.0));
      expect(value, closeTo(0.030877447272533942, 1e-9));
    });

    test(
        'Gen II: adding status before the >=255 check is confirmed correct per source, '
        'and produces a sane in-range probability', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 2,
        maxHp: 100,
        currentHp: 90,
        captureRate: 200,
        ballBonus: 1.0,
        statusBonus: 2.0, // sleep/frozen -> statusValue = 10, added pre-cap
      );

      expect(value, inInclusiveRange(0.0, 1.0));
      expect(value, closeTo(0.043962903927489895, 1e-9));
    });

    test('Gen II: guaranteed catch (>=255) still short-circuits to 1.0', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 2,
        maxHp: 100,
        currentHp: 1,
        captureRate: 255,
        ballBonus: 2.0,
        statusBonus: 2.0,
      );
      expect(value, equals(1.0));
    });
  });

  group('CaptureCalculator - per-generation sanity checks (result within [0, 1])', () {
    test('Generation 1 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 1,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
        level: 10,
        opponentStatusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 2 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 2,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 3 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 3,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 4 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 4,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 5 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 5,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 6 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 6,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 7 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 7,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 8 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 8,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });

    test('Generation 9 produces a probability within [0, 1]', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 9,
        maxHp: 100,
        currentHp: 50,
        captureRate: 100,
        ballBonus: 1.0,
        statusBonus: 1.0,
        numBadges: 8,
        hasCatchingCharm: false,
        catchingPowerLevel: 0,
        pokedexEntries: 0,
      );
      expect(value, inInclusiveRange(0.0, 1.0));
    });
  });

  group('CaptureCalculator - regression example from audit (Bulbasaur, full HP, Poké Ball)', () {
    test('Gen 6/7 full-HP Bulbasaur catch chance is close to the documented ~11.9%, not the old ~5.9%', () {
      final double value = CaptureCalculator.calculateCaptureProbability(
        generation: 6,
        maxHp: 100,
        currentHp: 100,
        captureRate: 45,
        ballBonus: 1.0,
        statusBonus: 1.0,
      );
      expect(value, closeTo(0.1194, 0.001));
    });
  });
}
