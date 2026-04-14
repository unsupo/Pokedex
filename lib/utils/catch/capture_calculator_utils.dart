import 'dart:math';

class CalculatorUtils {
  static const Map<String, int> versionGroups = {
    'rb': 1,
    'y': 2,
    'gs': 3,
    'c': 4,
    'rs': 5,
    'e': 6,
    'frlg': 7,
    'dp': 8,
    'pt': 9,
    'hgss': 10,
    'bw': 11,
    'b2w2': 14,
    'xy': 15,
    'oras': 16,
    'sm': 17,
    'usum': 18,
    'swsh': 20,
    'bdsp': 21,
    'pla': 22,
    'sv': 23
  };

  static const Map<String, double> statusMods = {
    'none': 1,
    'psn': 1.5,
    'par': 1.5,
    'brn': 1.5,
    'slp': 2.5,
    'frz': 2.5
  };

  static const List<double> gvals = [
    1229 / 4096,
    0.5,
    2867 / 4096,
    3277 / 4096,
    3686 / 4096,
    1
  ];

  static const List<double> pvals = [0, 0.5, 1, 1.5, 2, 2.5];

  static const Map<int, double> capturePowers = {
    0: 1,
    1: 1.1,
    2: 1.25,
    3: 2,
  };

  static const Map<int, int> badgeLevels = {
    0: 25,
    1: 30,
    2: 35,
    3: 40,
    4: 45,
    5: 50,
    6: 55,
    7: 60,
    8: 100,
  };

  static int calcCurHp(int maxHp, int percent) {
    if (percent == -1) {
      return 1;
    } else {
      return max(1, (maxHp * percent / 100).round());
    }
  }

  static String getHpBarClass(int hp) {
    if (hp < 20) {
      return "low_hp";
    } else if (hp < 50) {
      return "medium_hp";
    } else {
      return "high_hp";
    }
  }

  static int getVersionGroup(String checkedVersion, int defaultVersionGroup) {
    if (versionGroups.containsKey(checkedVersion)) {
      return versionGroups[checkedVersion]!;
    }
    return defaultVersionGroup;
  }

  static Map<String, dynamic> getPokemon(List<List<dynamic>> w, int pokemon,
      int form, String checkedVersion, int defaultVersionGroup) {
    Map<String, dynamic> mon = Map<String, dynamic>.from(w[pokemon][0]);
    if (form != 0 && !w[pokemon][form]['is_battle_only']) {
      mon = Map<String, dynamic>.from(w[pokemon][form]);
    }
    mon['id'] = pokemon;
    mon['form'] = form;
    int versionGroup = getVersionGroup(checkedVersion, defaultVersionGroup);

    if (versionGroup < 23) {
      switch (pokemon) {
        case 550:
          mon['catch_rate'] = 25;
          break;
        case 384:
          mon['catch_rate'] = 45;
          break;
        case 789:
        case 790:
        case 791:
        case 792:
          mon['catch_rate'] = 45;
          break;
        case 800:
          mon['catch_rate'] = 45;
          break;
      }
    }

    if (versionGroup < 18) {
      switch (pokemon) {
        case 794:
          mon['catch_rate'] = 25;
          break;
        case 795:
          mon['catch_rate'] = 255;
          break;
        case 796:
          mon['catch_rate'] = 30;
          break;
        case 797:
          mon['catch_rate'] = 25;
          break;
        case 798:
          mon['catch_rate'] = 255;
          break;
        case 799:
          mon['catch_rate'] = 15;
          break;
        case 800:
          mon['catch_rate'] = 3;
          break;
      }
    }

    if (versionGroup < 17) {
      switch (pokemon) {
        case 85:
          mon['speed'] = 100;
          break;
        case 101:
          mon['speed'] = 140;
          break;
        case 219:
          mon['hp'] = 50;
          break;
        case 222:
          mon['hp'] = 55;
          break;
        case 226:
          mon['hp'] = 65;
          break;
        case 284:
          mon['speed'] = 60;
          break;
        case 301:
          mon['speed'] = 70;
          break;
        case 337:
        case 338:
          mon['hp'] = 70;
          break;
        case 358:
          mon['hp'] = 65;
          break;
        case 527:
          mon['hp'] = 55;
          break;
      }
    }

    if (versionGroup < 16) {
      switch (pokemon) {
        case 382:
        case 383:
          mon['catch_rate'] = 5;
          break;
        case 483:
        case 484:
          mon['catch_rate'] = 30;
          break;
        case 643:
        case 644:
          mon['catch_rate'] = 45;
          break;
        case 384:
          mon['catch_rate'] = 3;
          break;
      }
    }

    if (versionGroup < 15) {
      switch (pokemon) {
        case 18:
          mon['speed'] = 91;
          break;
        case 26:
          mon['speed'] = 100;
          break;
      }
    }

    if (versionGroup < 11 && pokemon == 479) {
      mon['types'] = ["electric", "ghost"];
    }

    if (versionGroup < 5 && pokemon == 20) {
      mon['catch_rate'] = 90;
    }

    if (versionGroup == 2) {
      if (pokemon == 148) {
        mon['catch_rate'] = 27;
      } else if (pokemon == 149) {
        mon['catch_rate'] = 9;
      }
    }
    return mon;
  }

  static int getHp(int percent) {
    if (percent == -1) {
      return -1;
    } else {
      if (percent > 100) {
        return 100;
      } else if (percent <= 0) {
        return 1;
      } else {
        return percent;
      }
    }
  }

  static int getMaxHp(Map<String, dynamic> pokemon, int level, int iv) {
    int baseHp = pokemon['hp'];
    if (baseHp == 1) {
      return 1;
    }
    return ((2 * baseHp + (2 * iv)) * level / 100 + level + 10).floor();
  }

  static String showPercent(double chance) {
    return ((chance * 100000).round() / 1000).toString();
  }

  static String pluralize(int num, String word, [String? pluralWord]) {
    pluralWord ??= word + "s";
    return num == 1 ? word : pluralWord;
  }

  static String numBallsMessage(double ballChance) {
    if (ballChance == 0) {
      return "Thus, you will never capture it.";
    } else if (ballChance == 1) {
      return "Thus, you are guaranteed to get it in a single ball.";
    } else {
      int fiftyNumBalls = (log(1 - 0.5) / log(1 - ballChance)).ceil();
      int ninetyfiveNumBalls = (log(1 - 0.95) / log(1 - ballChance)).ceil();
      if (fiftyNumBalls == ninetyfiveNumBalls) {
        return "Thus, you have at least a 95% chance of catching it within $ninetyfiveNumBalls ${pluralize(ninetyfiveNumBalls, "ball")}.";
      } else {
        return "Thus, you have at least a 50% chance of catching it within $fiftyNumBalls ${pluralize(fiftyNumBalls, "ball")} and at least a 95% chance of catching it within $ninetyfiveNumBalls ${pluralize(ninetyfiveNumBalls, "ball")}.";
      }
    }
  }

  static String zeropad(int number) {
    String num = number.toString();
    while (num.length < 3) {
      num = "0" + num;
    }
    return num;
  }

  static bool isUltraBeast(int pokemonId) {
    return (pokemonId >= 793 && pokemonId <= 799) ||
        (pokemonId >= 803 && pokemonId <= 806);
  }

  static bool inArray(String item, List<String> array) {
    for (int i = 0; i < array.length; i++) {
      if (array[i] == item) {
        return true;
      }
    }
    return false;
  }

  static double getBallBonus(Map<String, dynamic> event) {
    if (isUltraBeast(event['pokemon']['id']) &&
        event['ball'] != 'beast-ball' &&
        event['ball'] != 'master-ball') {
      return 410 / 4096;
    }

    switch (event['ball']) {
      case 'great-ball':
        return 1.5;
      case 'ultra-ball':
        return 2;
      case 'master-ball':
        return -1;
      case 'net-ball':
        if (inArray('bug', event['pokemon']['types']) ||
            inArray('water', event['pokemon']['types'])) {
          return 3.5;
        } else {
          return 1;
        }
      case 'nest-ball':
        if (event['level'] < 30) {
          return max(1, (41 - event['level']) / 10);
        } else {
          return 1;
        }
      case 'dive-ball':
        if (event['underwater']) {
          return 3.5;
        } else {
          return 1;
        }
      case 'lure-ball':
        if (event['on_water']) {
          return 4;
        } else {
          return 1;
        }
      case 'repeat-ball':
        if (event['registered']) {
          return 3.5;
        } else {
          return 1;
        }
      case 'timer-ball':
        return min(4, (1 + (event['turn'] - 1) * 1229 / 4096).toDouble());
      case 'quick-ball':
        if (event['turn'] == 1) {
          return 5;
        } else {
          return 1;
        }
      case 'dusk-ball':
        if (event['dark']) {
          return 3;
        } else {
          return 1;
        }
      case 'fast-ball':
        if (event['pokemon']['speed'] >= 100) {
          return 4;
        } else {
          return 1;
        }
      case 'level-ball':
        if ((event['your_level'] / 4).floor() >= event['level']) {
          return 8;
        } else if ((event['your_level'] / 2).floor() >= event['level']) {
          return 4;
        } else if (event['your_level'] > event['level']) {
          return 2;
        } else {
          return 1;
        }
      case 'love-ball':
        if (event['your_pokemon'] == event['pokemon']['id'] &&
            (event['gender'] == "male" && event['your_gender'] == "female" ||
                event['gender'] == "female" && event['your_gender'] == "male")) {
          return 8;
        } else {
          return 1;
        }
      case 'moon-ball':
        if (event['pokemon']['id'] == 30 ||
            event['pokemon']['id'] == 33 ||
            event['pokemon']['id'] == 39 ||
            event['pokemon']['id'] == 300 ||
            event['pokemon']['id'] == 517) {
          return 4;
        } else {
          return 1;
        }
      case 'beast-ball':
        if (isUltraBeast(event['pokemon']['id'])) {
          return 5;
        } else {
          return 410 / 4096;
        }
      case 'dream-ball':
        if (event['status'] == 'slp' || event['pokemon']['id'] == 775) {
          return 4;
        }
        break;
      default:
        return 1;
    }
    return 1;
  }

  static int getDexCat(Map<String, dynamic> event) {
    int dexcat = 0;
    if (event['pokedex'] > 30) {
      dexcat++;
    }
    if (event['pokedex'] > 150) {
      dexcat++;
    }
    if (event['pokedex'] > 300) {
      dexcat++;
    }
    if (event['pokedex'] > 450) {
      dexcat++;
    }
    if (event['pokedex'] > 600) {
      dexcat++;
    }
    return dexcat;
  }

  static double down(double x) {
    return (x * 4096).floor() / 4096;
  }

  static double round(double x) {
    return (x * 4096).round() / 4096;
  }

  static double fround(double v) {
    // Basic cases.
    if ((v.isNaN || (v == 0))) {
      return v;
    }
    bool isNegative = (v < 0);
    double av = (isNegative ? (-v) : v);
    double absResult;
    // Large values.
    if ((av >= 3.4028235677973366E38)) {
      absResult = double.infinity;
      // Small values.
    } else if ((av >= 1.1754943508222875E-38)) {
      int e = (log(av) / 0.6931471805599453).floor();
      double twoPowE = pow(2, e).toDouble();
      double significand = (av / twoPowE);
      // Check for rounding.
      if ((significand < 1)) {
        twoPowE = (twoPowE / 2);
        significand = (significand * 2);
      } else if ((significand >= 2)) {
        twoPowE = (twoPowE * 2);
        significand = (significand / 2);
      }
      absResult = (((significand * 4.144523E-317) / 4.144523E-317) * twoPowE);
      // Subnormals.
    } else {
      absResult =
      ((av * 3.5257702653609953E-279) / 3.5257702653609953E-279);
    }
    return (isNegative ? (-absResult) : absResult);
  }

  static int calcX(Map<String, dynamic> event) {
    int c = event['pokemon']['catch_rate'];

    // Ditto transformed into non-default form bug.
    if (event['ditto'] && event['form'] > 0) {
      c = 0;
    }

    if (event['ball'] == 'heavy-ball') {
      double weight = event['pokemon']['weight'];
      if (weight >= 3000) {
        c += 30;
      } else if (weight >= 2000) {
        c += 20;
      } else if (weight < 1000) {
        c -= 20;
      }
      c = max(c, 1);
    }

    double b = getBallBonus(event);
    if (b == -1) {
      return 256;
    }
    double s = event['raid'] ? 1 : statusMods[event['status']] ?? 1;
    int m = event['max_hp'];
    int h = event['cur_hp'];

    double g = (!event['raid'] && event['thickgrass'])
        ? gvals[getDexCat(event)]
        : 1;
    int? l = 10;
    if (event['level'] < 13) {
      l = (36 - 2 * event['level']).toInt();
    }

    double bp = 1;
    if (event['badges'] < 8) {
      for (int i = 0; badgeLevels[event['badges'] + i]! < event['level']; i++) {
        bp = fround(bp * 0.8);
      }
      bp = round(bp);
    }

    double d =
        (capturePowers[event['capture_power']] ?? 1) * (event['off_guard'] ? 2 : 1);

    return min(
        255,
        (round(round(
            down(down(
                round(round(round((3 * m - 2 * h) * g) * c * b) * bp) /
                    (3 * m)) *
                l /
                10) *
                s) *
            d))
            .toInt());
  }

  static Map<String, dynamic> calculateResults(Map<String, dynamic> event) {
    int x = calcX(event);
    if (x >= 255) {
      // Auto-catch
      return {
        'success': 1,
        'success_msg': event['registered'] ? "Animated as a critical capture" : "",
        'wobbles': [0, 0, 0, 0]
      };
    }

    // Using the full formula for Y
    num y = x == 0
        ? 0
        : (round(65536 / round(fround(pow(round(255 / x), 3 / 16).toDouble())))).floor();
    double yChance = y / 65536;
    if (yChance > 1) {
      // A chance greater than 100% is nonsensical, so bump it back down
      yChance = 1;
    }
    double yCompl = 1 - yChance;

    // Check for a critical capture
    double p = pvals[getDexCat(event)];
    int charm = event['catching_charm'] ? 2 : 1;
    num cc = event['raid']
        ? 0
        : (round(min(x, 255) * p * charm) / 6).floor().toDouble();

    double critChance = min(1, cc / 256); // Can't have a better than 100% chance of a critical capture...

    double successChance = pow(yChance, 4).toDouble();
    return {
      'success': successChance,
      'success_msg': event['registered'] ? "Animated as a critical capture" : "",
      'wobbles': [
        yCompl,
        yChance * yCompl,
        pow(yChance, 2) * yCompl,
        pow(yChance, 3) * yCompl
      ],
      'critical': critChance,
      'crit_success': yChance
    };
  }

}

void main() {
  // Pokemon Data for Bulbasaur (ID 1)
  List<List<dynamic>> pokemonData = [
    [
      {
        'is_battle_only': false,
        'introduced_in': 1,
        'species_name': 'Bulbasaur',
        'name': 'Bulbasaur',
        'weight': 69,
        'catch_rate': 45,
        'hp': 45,
        'speed': 45,
        'types': ['grass', 'poison']
      }
    ]
  ];

  // Get Bulbasaur data for generation 9 (using 'sv' for Scarlet/Violet)
  Map<String, dynamic> bulbasaurData =
  CalculatorUtils.getPokemon(pokemonData, 0, 0, 'sv', 23);

  // Example: Bulbasaur, Level 20, Full HP, Poke Ball, 8 Gym Badges (Gen 9)
  int level = 20;
  int maxHp = CalculatorUtils.getMaxHp(bulbasaurData, level, 31); // Assuming max IV
  int currentHp = CalculatorUtils.calcCurHp(maxHp, 100); // Full HP

  Map<String, dynamic> calcEvent = {
    'pokemon': bulbasaurData,
    'level': level,
    'max_hp': maxHp,
    'cur_hp': currentHp,
    'status': 'none',
    'ball': 'poke-ball',
    'your_level': 100, // Example: Your Pokemon's level (not used in this case)
    'turn': 1,
    'underwater': false,
    'on_water': false,
    'registered': false, // Example: Assume not registered in Pokedex
    'dark': false,
    'pokedex': 0, // Example: Number of Pokemon caught in Pokedex
    'thickgrass': false, // Example: Not in Gen 9
    'badges': 8, // 8 Gym Badges
    'catching_charm': false, // Example: No Catching Charm
    'gender': 'male', // Example: Not relevant for this calculation
    'your_gender': 'female', // Example: Not relevant for this calculation
    'your_pokemon': 0, // Example: Not relevant for this calculation
    'capture_power': 0, // Example: No Capture Power
    'off_guard': false, // Example
    'ditto': false, // Example
    'raid': false,
    'form': 0
  };

  Map<String, dynamic> results = CalculatorUtils.calculateResults(calcEvent);

  print("Capture Calculation Example (Gen 9 Bulbasaur, Level 20, Full HP, Poke Ball, 8 Badges):");
  print("  Species: ${bulbasaurData['species_name']}");
  print("  Max HP: $maxHp");
  print("  Current HP: $currentHp");
  print("  Success Chance: ${CalculatorUtils.showPercent(results['success'])}%");
  print("  Critical Capture Chance: ${CalculatorUtils.showPercent(results['critical'])}%");

  // You can add more detailed output here if needed, like the number of wobbles:
  print("  Wobble Chances:");
  print("    0 Wobbles: ${CalculatorUtils.showPercent(results['wobbles'][0])}%");
  print("    1 Wobble: ${CalculatorUtils.showPercent(results['wobbles'][1])}%");
  print("    2 Wobbles: ${CalculatorUtils.showPercent(results['wobbles'][2])}%");
  print("    3 Wobbles: ${CalculatorUtils.showPercent(results['wobbles'][3])}%");

  print("\n${CalculatorUtils.numBallsMessage(results['success'])}");
}