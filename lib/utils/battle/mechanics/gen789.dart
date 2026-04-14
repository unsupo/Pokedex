import type {Generation, AbilityName, StatID, Terrain} from '../data/interface';
import {toID} from '../util';
import {
getBerryResistType,
getFlingPower,
getItemBoostType,
getMultiAttack,
getNaturalGift,
getTechnoBlast,
SEED_BOOSTED_STAT,
} from '../items';
import type {RawDesc} from '../desc';
import type {Field} from '../field';
import type {Move} from '../move';
import type {Pokemon} from '../pokemon';
import {Result} from '../result';
import {
chainMods,
checkAirLock,
checkDauntlessShield,
checkDownload,
checkEmbody,
checkForecast,
checkInfiltrator,
checkIntimidate,
checkIntrepidSword,
checkItem,
checkMultihitBoost,
checkSeedBoost,
checkTeraformZero,
checkWindRider,
checkWonderRoom,
computeFinalStats,
countBoosts,
getBaseDamage,
getStatDescriptionText,
getFinalDamage,
getModifiedStat,
getQPBoostedStat,
getMoveEffectiveness,
getShellSideArmCategory,
getWeight,
handleFixedDamageMoves,
isGrounded,
OF16, OF32,
pokeRound,
isQPActive,
getStabMod,
getStellarStabMod,
} from './util';

export function calculateSMSSSV(
gen: Generation,
attacker: Pokemon,
defender: Pokemon,
move: Move,
field: Field
) {
// #region Initial

checkAirLock(attacker, field);
checkAirLock(defender, field);
checkTeraformZero(attacker, field);
checkTeraformZero(defender, field);
checkForecast(attacker, field.weather);
checkForecast(defender, field.weather);
checkItem(attacker, field.isMagicRoom);
checkItem(defender, field.isMagicRoom);
checkWonderRoom(attacker, field.isWonderRoom);
checkWonderRoom(defender, field.isWonderRoom);
checkSeedBoost(attacker, field);
checkSeedBoost(defender, field);
checkDauntlessShield(attacker, gen);
checkDauntlessShield(defender, gen);
checkEmbody(attacker, gen);
checkEmbody(defender, gen);

computeFinalStats(gen, attacker, defender, field, 'def', 'spd', 'spe');

checkIntimidate(gen, attacker, defender);
checkIntimidate(gen, defender, attacker);
checkDownload(attacker, defender, field.isWonderRoom);
checkDownload(defender, attacker, field.isWonderRoom);
checkIntrepidSword(attacker, gen);
checkIntrepidSword(defender, gen);

checkWindRider(attacker, field.attackerSide);
checkWindRider(defender, field.defenderSide);

if (move.named('Meteor Beam', 'Electro Shot')) {
attacker.boosts.spa +=
attacker.hasAbility('Simple') ? 2
    : attacker.hasAbility('Contrary') ? -1
    : 1;
// restrict to +- 6
attacker.boosts.spa = Math.min(6, Math.max(-6, attacker.boosts.spa));
}

computeFinalStats(gen, attacker, defender, field, 'atk', 'spa');

checkInfiltrator(attacker, field.defenderSide);
checkInfiltrator(defender, field.attackerSide);

const desc: RawDesc = {
attackerName: attacker.name,
moveName: move.name,
defenderName: defender.name,
isDefenderDynamaxed: defender.isDynamaxed,
isWonderRoom: field.isWonderRoom,
};

// only display tera type if it applies
if (attacker.teraType !== 'Stellar' || move.name === 'Tera Blast' || move.isStellarFirstUse) {
// tera blast has special behavior with tera stellar
desc.isStellarFirstUse = attacker.name !== 'Terapagos-Stellar' && move.name === 'Tera Blast' &&
attacker.teraType === 'Stellar' && move.isStellarFirstUse;
desc.attackerTera = attacker.teraType;
}
if (defender.teraType !== 'Stellar') desc.defenderTera = defender.teraType;

if (move.named('Photon Geyser', 'Light That Burns the Sky') ||
(move.named('Tera Blast') && attacker.teraType)) {
move.category = attacker.stats.atk > attacker.stats.spa ? 'Physical' : 'Special';
}

const result = new Result(gen, attacker, defender, move, field, 0, desc);

if (move.category === 'Status' && !move.named('Nature Power')) {
return result;
}

if (move.flags.punch && attacker.hasItem('Punching Glove')) {
desc.attackerItem = attacker.item;
move.flags.contact = 0;
}

if (move.named('Shell Side Arm') &&
getShellSideArmCategory(attacker, defender) === 'Physical') {
move.flags.contact = 1;
}

const breaksProtect = move.breaksProtect || move.isZ || attacker.isDynamaxed ||
(attacker.hasAbility('Unseen Fist') && move.flags.contact);

if (field.defenderSide.isProtected && !breaksProtect) {
desc.isProtected = true;
return result;
}

if (move.name === 'Pain Split') {
const average = Math.floor((attacker.curHP() + defender.curHP()) / 2);
const damage = Math.max(0, defender.curHP() - average);
result.damage = damage;
return result;
}

const defenderAbilityIgnored = defender.hasAbility(
'Armor Tail', 'Aroma Veil', 'Aura Break', 'Battle Armor',
'Big Pecks', 'Bulletproof', 'Clear Body', 'Contrary',
'Damp', 'Dazzling', 'Disguise', 'Dry Skin',
'Earth Eater', 'Filter', 'Flash Fire', 'Flower Gift',
'Flower Veil', 'Fluffy', 'Friend Guard', 'Fur Coat',
'Good as Gold', 'Grass Pelt', 'Guard Dog', 'Heatproof',
'Heavy Metal', 'Hyper Cutter', 'Ice Face', 'Ice Scales',
'Illuminate', 'Immunity', 'Inner Focus', 'Insomnia',
'Keen Eye', 'Leaf Guard', 'Levitate', 'Light Metal',
'Lightning Rod', 'Limber', 'Magic Bounce', 'Magma Armor',
'Marvel Scale', "Mind's Eye", 'Mirror Armor', 'Motor Drive',
'Multiscale', 'Oblivious', 'Overcoat', 'Own Tempo',
'Pastel Veil', 'Punk Rock', 'Purifying Salt', 'Queenly Majesty',
'Sand Veil', 'Sap Sipper', 'Shell Armor', 'Shield Dust',
'Simple', 'Snow Cloak', 'Solid Rock', 'Soundproof',
'Sticky Hold', 'Storm Drain', 'Sturdy', 'Suction Cups',
'Sweet Veil', 'Tangled Feet', 'Telepathy', 'Tera Shell',
'Thermal Exchange', 'Thick Fat', 'Unaware', 'Vital Spirit',
'Volt Absorb', 'Water Absorb', 'Water Bubble', 'Water Veil',
'Well-Baked Body', 'White Smoke', 'Wind Rider', 'Wonder Guard',
'Wonder Skin'
);

const attackerIgnoresAbility = attacker.hasAbility('Mold Breaker', 'Teravolt', 'Turboblaze');
const moveIgnoresAbility = move.named(
'G-Max Drum Solo',
'G-Max Fire Ball',
'G-Max Hydrosnipe',
'Light That Burns the Sky',
'Menacing Moonraze Maelstrom',
'Moongeist Beam',
'Photon Geyser',
'Searing Sunraze Smash',
'Sunsteel Strike'
);

if (defenderAbilityIgnored && (attackerIgnoresAbility || moveIgnoresAbility)) {
if (attackerIgnoresAbility) desc.attackerAbility = attacker.ability;
if (defender.hasItem('Ability Shield')) {
desc.defenderItem = defender.item;
} else {
defender.ability = '' as AbilityName;
}
}

const ignoresNeutralizingGas = [
'As One (Glastrier)', 'As One (Spectrier)', 'Battle Bond', 'Comatose',
'Disguise', 'Gulp Missile', 'Ice Face', 'Multitype', 'Neutralizing Gas',
'Power Construct', 'RKS System', 'Schooling', 'Shields Down',
'Stance Change', 'Tera Shift', 'Zen Mode', 'Zero to Hero',
];

if (attacker.hasAbility('Neutralizing Gas') &&
!ignoresNeutralizingGas.includes(defender.ability || '')) {
desc.attackerAbility = attacker.ability;
if (defender.hasItem('Ability Shield')) {
desc.defenderItem = defender.item;
} else {
defender.ability = '' as AbilityName;
}
}

if (defender.hasAbility('Neutralizing Gas') &&
!ignoresNeutralizingGas.includes(attacker.ability || '')) {
desc.defenderAbility = defender.ability;
if (attacker.hasItem('Ability Shield')) {
desc.attackerItem = attacker.item;
} else {
attacker.ability = '' as AbilityName;
}
}

// Merciless does not ignore Shell Armor, damage dealt to a poisoned Pokemon with Shell Armor
// will not be a critical hit (UltiMario)
const isCritical = !defender.hasAbility('Battle Armor', 'Shell Armor') &&
(move.isCrit || (attacker.hasAbility('Merciless') && defender.hasStatus('psn', 'tox'))) &&
move.timesUsed === 1;

let type = move.type;
if (move.originalName === 'Weather Ball') {
const holdingUmbrella = attacker.hasItem('Utility Umbrella');
type =
field.hasWeather('Sun', 'Harsh Sunshine') && !holdingUmbrella ? 'Fire'
    : field.hasWeather('Rain', 'Heavy Rain') && !holdingUmbrella ? 'Water'
    : field.hasWeather('Sand') ? 'Rock'
    : field.hasWeather('Hail', 'Snow') ? 'Ice'
    : 'Normal';
desc.weather = field.weather;
desc.moveType = type;
} else if (move.named('Judgment') && attacker.item && attacker.item.includes('Plate')) {
type = getItemBoostType(attacker.item)!;
} else if (move.originalName === 'Techno Blast' &&
attacker.item && attacker.item.includes('Drive')) {
type = getTechnoBlast(attacker.item)!;
desc.moveType = type;
} else if (move.originalName === 'Multi-Attack' &&
attacker.item && attacker.item.includes('Memory')) {
type = getMultiAttack(attacker.item)!;
desc.moveType = type;
} else if (move.named('Natural Gift') && attacker.item?.endsWith('Berry')) {
const gift = getNaturalGift(gen, attacker.item)!;
type = gift.t;
desc.moveType = type;
desc.attackerItem = attacker.item;
} else if (
move.named('Nature Power') ||
(move.originalName === 'Terrain Pulse' && isGrounded(attacker, field))
) {
type =
field.hasTerrain('Electric') ? 'Electric'
    : field.hasTerrain('Grassy') ? 'Grass'
    : field.hasTerrain('Misty') ? 'Fairy'
    : field.hasTerrain('Psychic') ? 'Psychic'
    : 'Normal';
desc.terrain = field.terrain;

if (move.isMax) {
desc.moveType = type;
}

// If the Nature Power user has the ability Prankster, it cannot affect
// Dark-types or grounded foes if Psychic Terrain is active
if (!(move.named('Nature Power') && attacker.hasAbility('Prankster')) &&
((defender.types.includes('Dark') ||
(field.hasTerrain('Psychic') && isGrounded(defender, field))))) {
desc.moveType = type;
}
} else if (move.originalName === 'Revelation Dance') {
if (attacker.teraType) {
type = attacker.teraType;
} else {
type = attacker.types[0];
}
} else if (move.named('Aura Wheel')) {
if (attacker.named('Morpeko')) {
type = 'Electric';
} else if (attacker.named('Morpeko-Hangry')) {
type = 'Dark';
}
} else if (move.named('Raging Bull')) {
if (attacker.named('Tauros-Paldea-Combat')) {
type = 'Fighting';
} else if (attacker.named('Tauros-Paldea-Blaze')) {
type = 'Fire';
} else if (attacker.named('Tauros-Paldea-Aqua')) {
type = 'Water';
}

field.defenderSide.isReflect = false;
field.defenderSide.isLightScreen = false;
field.defenderSide.isAuroraVeil = false;
} else if (move.named('Ivy Cudgel')) {
if (attacker.name.includes('Ogerpon-Cornerstone')) {
type = 'Rock';
} else if (attacker.name.includes('Ogerpon-Hearthflame')) {
type = 'Fire';
} else if (attacker.name.includes('Ogerpon-Wellspring')) {
type = 'Water';
}
} else if (
move.named('Tera Starstorm') && attacker.name === 'Terapagos-Stellar'
) {
move.target = 'allAdjacentFoes';
type = 'Stellar';
} else if (move.named('Brick Break', 'Psychic Fangs')) {
field.defenderSide.isReflect = false;
field.defenderSide.isLightScreen = false;
field.defenderSide.isAuroraVeil = false;
}

let hasAteAbilityTypeChange = false;
let isAerilate = false;
let isPixilate = false;
let isRefrigerate = false;
let isGalvanize = false;
let isLiquidVoice = false;
let isNormalize = false;
const noTypeChange = move.named(
'Revelation Dance',
'Judgment',
'Nature Power',
'Techno Blast',
'Multi-Attack',
'Natural Gift',
'Weather Ball',
'Terrain Pulse',
'Struggle',
) || (move.named('Tera Blast') && attacker.teraType);

if (!move.isZ && !noTypeChange) {
const normal = type === 'Normal';
if ((isAerilate = attacker.hasAbility('Aerilate') && normal)) {
type = 'Flying';
} else if ((isGalvanize = attacker.hasAbility('Galvanize') && normal)) {
type = 'Electric';
} else if ((isLiquidVoice = attacker.hasAbility('Liquid Voice') && !!move.flags.sound)) {
type = 'Water';
} else if ((isPixilate = attacker.hasAbility('Pixilate') && normal)) {
type = 'Fairy';
} else if ((isRefrigerate = attacker.hasAbility('Refrigerate') && normal)) {
type = 'Ice';
} else if ((isNormalize = attacker.hasAbility('Normalize'))) { // Boosts any type
type = 'Normal';
}
if (isGalvanize || isPixilate || isRefrigerate || isAerilate || isNormalize) {
desc.attackerAbility = attacker.ability;
hasAteAbilityTypeChange = true;
} else if (isLiquidVoice) {
desc.attackerAbility = attacker.ability;
}
}

if (move.named('Tera Blast') && attacker.teraType) {
type = attacker.teraType;
}

move.type = type;

// FIXME: this is incorrect, should be move.flags.heal, not move.drain
if ((attacker.hasAbility('Triage') && move.drain) ||
(attacker.hasAbility('Gale Wings') &&
move.hasType('Flying') &&
attacker.curHP() === attacker.maxHP())) {
move.priority = 1;
desc.attackerAbility = attacker.ability;
}

const isGhostRevealed =
attacker.hasAbility('Scrappy') || attacker.hasAbility('Mind\'s Eye') ||
field.defenderSide.isForesight;
const isRingTarget =
defender.hasItem('Ring Target') && !defender.hasAbility('Klutz');
const type1Effectiveness = getMoveEffectiveness(
gen,
move,
defender.types[0],
isGhostRevealed,
field.isGravity,
isRingTarget
);
const type2Effectiveness = defender.types[1]
? getMoveEffectiveness(
gen,
move,
defender.types[1],
isGhostRevealed,
field.isGravity,
isRingTarget
)
    : 1;
let typeEffectiveness = type1Effectiveness * type2Effectiveness;

if (defender.teraType && defender.teraType !== 'Stellar') {
typeEffectiveness = getMoveEffectiveness(
gen,
move,
defender.teraType,
isGhostRevealed,
field.isGravity,
isRingTarget
);
}

if (typeEffectiveness === 0 && move.hasType('Ground') &&
defender.hasItem('Iron Ball') && !defender.hasAbility('Klutz')) {
typeEffectiveness = 1;
}

if (typeEffectiveness === 0 && move.named('Thousand Arrows')) {
typeEffectiveness = 1;
}

if (typeEffectiveness === 0) {
return result;
}

if ((move.named('Sky Drop') &&
(defender.hasType('Flying') || defender.weightkg >= 200 || field.isGravity)) ||
(move.named('Synchronoise') && !defender.hasType(attacker.types[0]) &&
(!attacker.types[1] || !defender.hasType(attacker.types[1]))) ||
(move.named('Dream Eater') &&
(!(defender.hasStatus('slp') || defender.hasAbility('Comatose')))) ||
(move.named('Steel Roller') && !field.terrain) ||
(move.named('Poltergeist') && (!defender.item || isQPActive(defender, field)))
) {
return result;
}

if (
(field.hasWeather('Harsh Sunshine') && move.hasType('Water')) ||
(field.hasWeather('Heavy Rain') && move.hasType('Fire'))
) {
desc.weather = field.weather;
return result;
}

if (field.hasWeather('Strong Winds') && defender.hasType('Flying') &&
gen.types.get(toID(move.type))!.effectiveness['Flying']! > 1) {
typeEffectiveness /= 2;
desc.weather = field.weather;
}

if (move.type === 'Stellar') {
desc.defenderTera = defender.teraType; // always show in this case
typeEffectiveness = !defender.teraType ? 1 : 2;
}

const turn2typeEffectiveness = typeEffectiveness;

// Tera Shell works only at full HP, but for all hits of multi-hit moves
if (defender.hasAbility('Tera Shell') &&
defender.curHP() === defender.maxHP() &&
(!field.defenderSide.isSR && (!field.defenderSide.spikes || defender.hasType('Flying')) ||
defender.hasItem('Heavy-Duty Boots'))
) {
typeEffectiveness = 0.5;
desc.defenderAbility = defender.ability;
}

if ((defender.hasAbility('Wonder Guard') && typeEffectiveness <= 1) ||
(move.hasType('Grass') && defender.hasAbility('Sap Sipper')) ||
(move.hasType('Fire') && defender.hasAbility('Flash Fire', 'Well-Baked Body')) ||
(move.hasType('Water') && defender.hasAbility('Dry Skin', 'Storm Drain', 'Water Absorb')) ||
(move.hasType('Electric') &&
defender.hasAbility('Lightning Rod', 'Motor Drive', 'Volt Absorb')) ||
(move.hasType('Ground') &&
!field.isGravity && !move.named('Thousand Arrows') &&
!defender.hasItem('Iron Ball') && defender.hasAbility('Levitate')) ||
(move.flags.bullet && defender.hasAbility('Bulletproof')) ||
(move.flags.sound && !move.named('Clangorous Soul') && defender.hasAbility('Soundproof')) ||
(move.priority > 0 && defender.hasAbility('Queenly Majesty', 'Dazzling', 'Armor Tail')) ||
(move.hasType('Ground') && defender.hasAbility('Earth Eater')) ||
(move.flags.wind && defender.hasAbility('Wind Rider'))
) {
desc.defenderAbility = defender.ability;
return result;
}

if (move.hasType('Ground') && !move.named('Thousand Arrows') &&
!field.isGravity && defender.hasItem('Air Balloon')) {
desc.defenderItem = defender.item;
return result;
}

if (move.priority > 0 && field.hasTerrain('Psychic') && isGrounded(defender, field)) {
desc.terrain = field.terrain;
return result;
}

const weightBasedMove = move.named('Heat Crash', 'Heavy Slam', 'Low Kick', 'Grass Knot');
if (defender.isDynamaxed && weightBasedMove) {
return result;
}

desc.HPEVs = getStatDescriptionText(gen, defender, 'hp');

const fixedDamage = handleFixedDamageMoves(attacker, move);
if (fixedDamage) {
if (attacker.hasAbility('Parental Bond')) {
result.damage = [fixedDamage, fixedDamage];
desc.attackerAbility = attacker.ability;
} else {
result.damage = fixedDamage;
}
return result;
}

if (move.named('Final Gambit')) {
result.damage = attacker.curHP();
return result;
}

if (move.named('Guardian of Alola')) {
let zLostHP = Math.floor((defender.curHP() * 3) / 4);
if (field.defenderSide.isProtected && attacker.item && attacker.item.includes(' Z')) {
zLostHP = Math.ceil(zLostHP / 4 - 0.5);
}
result.damage = zLostHP;
return result;
}

if (move.named('Nature\'s Madness')) {
const lostHP = field.defenderSide.isProtected ? 0 : Math.floor(defender.curHP() / 2);
result.damage = lostHP;
return result;
}

if (move.named('Spectral Thief')) {
let stat: StatID;
for (stat in defender.boosts) {
if (defender.boosts[stat] > 0) {
attacker.boosts[stat] +=
attacker.hasAbility('Contrary') ? -defender.boosts[stat]! : defender.boosts[stat]!;
if (attacker.boosts[stat] > 6) attacker.boosts[stat] = 6;
if (attacker.boosts[stat] < -6) attacker.boosts[stat] = -6;
attacker.stats[stat] = getModifiedStat(attacker.rawStats[stat]!, attacker.boosts[stat]!);
defender.boosts[stat] = 0;
defender.stats[stat] = defender.rawStats[stat];
}
}
}

if (move.hits > 1) {
desc.hits = move.hits;
}

const turnOrder = attacker.stats.spe > defender.stats.spe ? 'first' : 'last';

// #endregion
// #region Base Power

const basePower = calculateBasePowerSMSSSV(
gen,
attacker,
defender,
move,
field,
hasAteAbilityTypeChange,
desc
);
if (basePower === 0) {
return result;
}

// #endregion
// #region (Special) Attack
const attack = calculateAttackSMSSSV(gen, attacker, defender, move, field, desc, isCritical);
const attackStat =
move.named('Shell Side Arm') &&
getShellSideArmCategory(attacker, defender) === 'Physical'
? 'atk'
    : move.named('Body Press')
? 'def'
    : move.category === 'Special'
? 'spa'
    : 'atk';
// #endregion

// #region (Special) Defense

const defense = calculateDefenseSMSSSV(gen, attacker, defender, move, field, desc, isCritical);
const hitsPhysical = move.overrideDefensiveStat === 'def' || move.category === 'Physical' ||
(move.named('Shell Side Arm') && getShellSideArmCategory(attacker, defender) === 'Physical');
const defenseStat = hitsPhysical ? 'def' : 'spd';

// #endregion
// #region Damage

const baseDamage = calculateBaseDamageSMSSSV(
gen,
attacker,
defender,
basePower,
attack,
defense,
move,
field,
desc,
isCritical
);

if (hasTerrainSeed(defender) &&
field.hasTerrain(defender.item!.substring(0, defender.item!.indexOf(' ')) as Terrain) &&
SEED_BOOSTED_STAT[defender.item!] === defenseStat) {
// Last condition applies so the calc doesn't show a seed where it wouldn't affect the outcome
// (like Grassy Seed when being hit by a special move)
desc.defenderItem = defender.item;
}

// the random factor is applied between the crit mod and the stab mod, so don't apply anything
// below this until we're inside the loop
let preStellarStabMod = getStabMod(attacker, move, desc);
let stabMod = getStellarStabMod(attacker, move, preStellarStabMod);

const applyBurn =
attacker.hasStatus('brn') &&
move.category === 'Physical' &&
!attacker.hasAbility('Guts') &&
!move.named('Facade');
desc.isBurned = applyBurn;
const finalMods = calculateFinalModsSMSSSV(
gen,
attacker,
defender,
move,
field,
desc,
isCritical,
typeEffectiveness
);

let protect = false;
if (field.defenderSide.isProtected &&
(attacker.isDynamaxed || (move.isZ && attacker.item && attacker.item.includes(' Z')))) {
protect = true;
desc.isProtected = true;
}

const finalMod = chainMods(finalMods, 41, 131072);

const isSpread = field.gameType !== 'Singles' &&
['allAdjacent', 'allAdjacentFoes'].includes(move.target);

let childDamage: number[] | undefined;
if (attacker.hasAbility('Parental Bond') && move.hits === 1 && !isSpread) {
const child = attacker.clone();
child.ability = 'Parental Bond (Child)' as AbilityName;
checkMultihitBoost(gen, child, defender, move, field, desc);
childDamage = calculateSMSSSV(gen, child, defender, move, field).damage as number[];
desc.attackerAbility = attacker.ability;
}

let damage = [];
for (let i = 0; i < 16; i++) {
damage[i] =
getFinalDamage(baseDamage, i, typeEffectiveness, applyBurn, stabMod, finalMod, protect);
}

desc.attackBoost =
move.named('Foul Play') ? defender.boosts[attackStat] : attacker.boosts[attackStat];

if (move.timesUsed! > 1 || move.hits > 1) {
// store boosts so intermediate boosts don't show.
const origDefBoost = desc.defenseBoost;
const origAtkBoost = desc.attackBoost;

let numAttacks = 1;
if (move.timesUsed! > 1) {
desc.moveTurns = `over ${move.timesUsed} turns`;
numAttacks = move.timesUsed!;
} else {
numAttacks = move.hits;
}
let usedItems = [false, false];
for (let times = 1; times < numAttacks; times++) {
usedItems = checkMultihitBoost(gen, attacker, defender, move,
field, desc, usedItems[0], usedItems[1]);
const newAttack = calculateAttackSMSSSV(gen, attacker, defender, move,
field, desc, isCritical);
const newDefense = calculateDefenseSMSSSV(gen, attacker, defender, move,
field, desc, isCritical);
// Check if lost -ate ability. Typing stays the same, only boost is lost
// Cannot be regained during multihit move and no Normal moves with stat drawbacks
hasAteAbilityTypeChange = hasAteAbilityTypeChange &&
attacker.hasAbility('Aerilate', 'Galvanize', 'Pixilate', 'Refrigerate', 'Normalize');

if (move.timesUsed! > 1) {
// Adaptability does not change between hits of a multihit, only between turns
preStellarStabMod = getStabMod(attacker, move, desc);
// Hack to make Tera Shell with multihit moves, but not over multiple turns
typeEffectiveness = turn2typeEffectiveness;
// Stellar damage boost applies for 1 turn, but all hits of multihit.
stabMod = getStellarStabMod(attacker, move, preStellarStabMod, times);
}

const newBasePower = calculateBasePowerSMSSSV(
gen,
attacker,
defender,
move,
field,
hasAteAbilityTypeChange,
desc,
times + 1
);
const newBaseDamage = calculateBaseDamageSMSSSV(
gen,
attacker,
defender,
newBasePower,
newAttack,
newDefense,
move,
field,
desc,
isCritical
);
const newFinalMods = calculateFinalModsSMSSSV(
gen,
attacker,
defender,
move,
field,
desc,
isCritical,
typeEffectiveness,
times
);
const newFinalMod = chainMods(newFinalMods, 41, 131072);

let damageMultiplier = 0;
damage = damage.map(affectedAmount => {
const newFinalDamage = getFinalDamage(
newBaseDamage,
damageMultiplier,
typeEffectiveness,
applyBurn,
stabMod,
newFinalMod,
protect
);
damageMultiplier++;
return affectedAmount + newFinalDamage;
});
}
desc.defenseBoost = origDefBoost;
desc.attackBoost = origAtkBoost;
}

result.damage = childDamage ? [damage, childDamage] : damage;

// #endregion

return result;
}

export function calculateBasePowerSMSSSV(
gen: Generation,
attacker: Pokemon,
defender: Pokemon,
move: Move,
field: Field,
hasAteAbilityTypeChange: boolean,
desc: RawDesc,
hit = 1,
) {
const turnOrder = attacker.stats.spe > defender.stats.spe ? 'first' : 'last';

let basePower: number;

switch (move.name) {
case 'Payback':
basePower = move.bp * (turnOrder === 'last' ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Bolt Beak':
case 'Fishious Rend':
basePower = move.bp * (turnOrder !== 'last' ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Pursuit':
const switching = field.defenderSide.isSwitching === 'out';
basePower = move.bp * (switching ? 2 : 1);
if (switching) desc.isSwitching = 'out';
desc.moveBP = basePower;
break;
case 'Electro Ball':
const r = Math.floor(attacker.stats.spe / defender.stats.spe);
basePower = r >= 4 ? 150 : r >= 3 ? 120 : r >= 2 ? 80 : r >= 1 ? 60 : 40;
if (defender.stats.spe === 0) basePower = 40;
desc.moveBP = basePower;
break;
case 'Gyro Ball':
basePower = Math.min(150, Math.floor((25 * defender.stats.spe) / attacker.stats.spe) + 1);
if (attacker.stats.spe === 0) basePower = 1;
desc.moveBP = basePower;
break;
case 'Punishment':
basePower = Math.min(200, 60 + 20 * countBoosts(gen, defender.boosts));
desc.moveBP = basePower;
break;
case 'Low Kick':
case 'Grass Knot':
const w = getWeight(defender, desc, 'defender');
basePower = w >= 200 ? 120 : w >= 100 ? 100 : w >= 50 ? 80 : w >= 25 ? 60 : w >= 10 ? 40 : 20;
desc.moveBP = basePower;
break;
case 'Hex':
case 'Infernal Parade':
// Hex deals double damage to Pokemon with Comatose (ih8ih8sn0w)
basePower = move.bp * (defender.status || defender.hasAbility('Comatose') ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Barb Barrage':
basePower = move.bp * (defender.hasStatus('psn', 'tox') ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Heavy Slam':
case 'Heat Crash':
const wr =
getWeight(attacker, desc, 'attacker') /
getWeight(defender, desc, 'defender');
basePower = wr >= 5 ? 120 : wr >= 4 ? 100 : wr >= 3 ? 80 : wr >= 2 ? 60 : 40;
desc.moveBP = basePower;
break;
case 'Stored Power':
case 'Power Trip':
basePower = 20 + 20 * countBoosts(gen, attacker.boosts);
desc.moveBP = basePower;
break;
case 'Acrobatics':
basePower = move.bp * (attacker.hasItem('Flying Gem') ||
(!attacker.item || isQPActive(attacker, field)) ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Assurance':
basePower = move.bp * (defender.hasAbility('Parental Bond (Child)') ? 2 : 1);
// NOTE: desc.attackerAbility = 'Parental Bond' will already reflect this boost
break;
case 'Wake-Up Slap':
// Wake-Up Slap deals double damage to Pokemon with Comatose (ih8ih8sn0w)
basePower = move.bp * (defender.hasStatus('slp') || defender.hasAbility('Comatose') ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Smelling Salts':
basePower = move.bp * (defender.hasStatus('par') ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Weather Ball':
basePower = move.bp * (field.weather && !field.hasWeather('Strong Winds') ? 2 : 1);
if (field.hasWeather('Sun', 'Harsh Sunshine', 'Rain', 'Heavy Rain') &&
attacker.hasItem('Utility Umbrella')) basePower = move.bp;
desc.moveBP = basePower;
break;
case 'Terrain Pulse':
basePower = move.bp * (isGrounded(attacker, field) && field.terrain ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Rising Voltage':
basePower = move.bp * ((isGrounded(defender, field) && field.hasTerrain('Electric')) ? 2 : 1);
desc.moveBP = basePower;
break;
case 'Psyblade':
basePower = move.bp * (field.hasTerrain('Electric') ? 1.5 : 1);
if (field.hasTerrain('Electric')) {
desc.moveBP = basePower;
desc.terrain = field.terrain;
}
break;
case 'Fling':
basePower = getFlingPower(attacker.item);
desc.moveBP = basePower;
desc.attackerItem = attacker.item;
break;
case 'Dragon Energy':
case 'Eruption':
case 'Water Spout':
basePower = Math.max(1, Math.floor((150 * attacker.curHP()) / attacker.maxHP()));
desc.moveBP = basePower;
break;
case 'Flail':
case 'Reversal':
const p = Math.floor((48 * attacker.curHP()) / attacker.maxHP());
basePower = p <= 1 ? 200 : p <= 4 ? 150 : p <= 9 ? 100 : p <= 16 ? 80 : p <= 32 ? 40 : 20;
desc.moveBP = basePower;
break;
case 'Natural Gift':
if (attacker.item?.endsWith('Berry')) {
const gift = getNaturalGift(gen, attacker.item)!;
basePower = gift.p;
desc.attackerItem = attacker.item;
desc.moveBP = move.bp;
} else {
basePower = move.bp;
}
break;
case 'Nature Power':
move.category = 'Special';
move.secondaries = true;

// Nature Power cannot affect Dark-types if it is affected by Prankster
if (attacker.hasAbility('Prankster') && defender.types.includes('Dark')) {
basePower = 0;
desc.moveName = 'Nature Power';
desc.attackerAbility = 'Prankster';
break;
}
switch (field.terrain) {
case 'Electric':
basePower = 90;
desc.moveName = 'Thunderbolt';
break;
case 'Grassy':
basePower = 90;
desc.moveName = 'Energy Ball';
break;
case 'Misty':
basePower = 95;
desc.moveName = 'Moonblast';
break;
case 'Psychic':
// Nature Power does not affect grounded Pokemon if it is affected by
// Prankster and there is Psychic Terrain active
if (attacker.hasAbility('Prankster') && isGrounded(defender, field)) {
basePower = 0;
desc.attackerAbility = 'Prankster';
} else {
basePower = 90;
desc.moveName = 'Psychic';
}
break;
default:
basePower = 80;
desc.moveName = 'Tri Attack';
}
break;
case 'Water Shuriken':
basePower = attacker.named('Greninja-Ash') && attacker.hasAbility('Battle Bond') ? 20 : 15;
desc.moveBP = basePower;
break;
// Triple Axel's damage increases after each consecutive hit (20, 40, 60)
case 'Triple Axel':
basePower = hit * 20;
desc.moveBP = move.hits === 2 ? 60 : move.hits === 3 ? 120 : 20;
break;
// Triple Kick's damage increases after each consecutive hit (10, 20, 30)
case 'Triple Kick':
basePower = hit * 10;
desc.moveBP = move.hits === 2 ? 30 : move.hits === 3 ? 60 : 10;
break;
case 'Crush Grip':
case 'Wring Out':
basePower = 100 * Math.floor((defender.curHP() * 4096) / defender.maxHP());
basePower = Math.floor(Math.floor((120 * basePower + 2048 - 1) / 4096) / 100) || 1;
desc.moveBP = basePower;
break;
case 'Hard Press':
basePower = 100 * Math.floor((defender.curHP() * 4096) / defender.maxHP());
basePower = Math.floor(Math.floor((100 * basePower + 2048 - 1) / 4096) / 100) || 1;
desc.moveBP = basePower;
break;
case 'Tera Blast':
basePower = attacker.teraType === 'Stellar' ? 100 : 80;
desc.moveBP = basePower;
break;
default:
basePower = move.bp;
}
if (basePower === 0) {
return 0;
}
if (move.named(
'Breakneck Blitz', 'Bloom Doom', 'Inferno Overdrive', 'Hydro Vortex', 'Gigavolt Havoc',
'Subzero Slammer', 'Supersonic Skystrike', 'Savage Spin-Out', 'Acid Downpour', 'Tectonic Rage',
'Continental Crush', 'All-Out Pummeling', 'Shattered Psyche', 'Never-Ending Nightmare',
'Devastating Drake', 'Black Hole Eclipse', 'Corkscrew Crash', 'Twinkle Tackle'
) || move.isMax) {
// show z-move power in description
desc.moveBP = move.bp;
}
const bpMods = calculateBPModsSMSSSV(
gen,
attacker,
defender,
move,
field,
desc,
basePower,
hasAteAbilityTypeChange,
turnOrder,
hit
);
basePower = OF16(Math.max(1, pokeRound((basePower * chainMods(bpMods, 41, 2097152)) / 4096)));
if (
attacker.teraType && move.type === attacker.teraType &&
attacker.hasType(attacker.teraType) && move.hits === 1 && !move.multiaccuracy &&
move.priority <= 0 && move.bp > 0 && !move.named('Dragon Energy', 'Eruption', 'Water Spout') &&
basePower < 60 && gen.num >= 9
) {
basePower = 60;
desc.moveBP = 60;
}
return basePower;
}





/// current
///
//... (Typedefs, Result class, utility functions - same as before)
//... (Typedefs, Result class, utility functions - same as before)
List<int> calculateBPModsSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc,
int basePower,
bool hasAteAbilityTypeChange,
String turnOrder,
int hit,
) {
List<int> bpMods = [];

// Move effects
String? defenderItem = (defender.item != null && defender.item!.isNotEmpty)
? defender.item
    : defender.disabledItem;

bool resistedKnockOffDamage = (defenderItem == null || isQPActive(defender, field)) ||
(defender.named(['Dialga-Origin']) && defenderItem == 'Adamant Crystal') ||
(defender.named(['Palkia-Origin']) && defenderItem == 'Lustrous Globe') ||
(defender.name.contains('Giratina-Origin') && defenderItem.contains('Griseous')) ||
(defender.name.contains('Arceus') && defenderItem.contains('Plate')) ||
(defender.name.contains('Genesect') && defenderItem.contains('Drive')) ||
(defender.named(['Groudon', 'Groudon-Primal']) && defenderItem == 'Red Orb') ||
(defender.named(['Kyogre', 'Kyogre-Primal']) && defenderItem == 'Blue Orb') ||
(defender.name.contains('Silvally') && defenderItem.contains('Memory')) ||
defenderItem.contains(' Z') ||
(defender.named(['Zacian']) && defenderItem == 'Rusted Sword') ||
(defender.named(['Zamazenta']) && defenderItem == 'Rusted Shield') ||
(defender.name.contains('Ogerpon-Cornerstone') && defenderItem == 'Cornerstone Mask') ||
(defender.name.contains('Ogerpon-Hearthflame') && defenderItem == 'Hearthflame Mask') ||
(defender.name.contains('Ogerpon-Wellspring') && defenderItem == 'Wellspring Mask') ||
(defender.named(['Venomicon-Epilogue']) && defenderItem == 'Vile Vial');

// The last case only applies when the Pokemon has the Mega Stone that matches its species
if (!resistedKnockOffDamage && defenderItem != null) {
var item = gen.items[toID(defenderItem)];
if (item != null) {
resistedKnockOffDamage = item.megaEvolves != null && defender.name.contains(item.megaEvolves!);
}
}

// Resist knock off damage if item was already knocked off
if (!resistedKnockOffDamage && hit > 1 && !defender.hasAbility('Sticky Hold')) {
resistedKnockOffDamage = true;
}

if ((move.named(['Facade']) && attacker.hasStatus(['brn', 'par', 'psn', 'tox'])) ||
(move.named(['Brine']) && defender.curHP() <= defender.maxHP() / 2) ||
(move.named(['Venoshock']) && defender.hasStatus(['psn', 'tox'])) ||
(move.named(['Lash Out']) && countBoosts(gen, attacker.boosts) < 0)) {
bpMods.add(8192);
desc.moveBP = basePower * 2;
} else if (move.named(['Expanding Force']) &&
isGrounded(attacker, field) &&
field.hasTerrain('Psychic')) {
move.target = 'allAdjacentFoes';
bpMods.add(6144);
desc.moveBP = basePower * 1.5;
} else if ((move.named(['Knock Off']) && !resistedKnockOffDamage) ||
(move.named(['Misty Explosion']) && isGrounded(attacker, field) && field.hasTerrain('Misty')) ||
(move.named(['Grav Apple']) && field.isGravity)) {
bpMods.add(6144);
desc.moveBP = basePower * 1.5;
}

if (field.attackerSide.isHelpingHand) {
bpMods.add(6144);
desc.isHelpingHand = true;
}

// Field effects
int terrainMultiplier = gen.num > 7 ? 5325 : 6144;
if (isGrounded(attacker, field)) {
if ((field.hasTerrain('Electric') && move.hasType('Electric')) ||
(field.hasTerrain('Grassy') && move.hasType('Grass')) ||
(field.hasTerrain('Psychic') && move.hasType('Psychic'))) {
bpMods.add(terrainMultiplier);
desc.terrain = field.terrain;
}
}
if (isGrounded(defender, field)) {
if ((field.hasTerrain('Misty') && move.hasType('Dragon')) ||
(field.hasTerrain('Grassy') && move.named(['Bulldoze', 'Earthquake']))) {
bpMods.add(2048);
desc.terrain = field.terrain;
}
}

// Abilities
if ((attacker.hasAbility('Technician') && basePower <= 60) ||
(attacker.hasAbility('Flare Boost') && attacker.hasStatus(['brn']) && move.category == 'Special') ||
(attacker.hasAbility('Toxic Boost') && attacker.hasStatus(['psn', 'tox']) && move.category == 'Physical') ||
(attacker.hasAbility('Mega Launcher') && move.flags.pulse) ||
(attacker.hasAbility('Strong Jaw') && move.flags.bite) ||
(attacker.hasAbility('Steely Spirit') && move.hasType('Steel')) ||
(attacker.hasAbility('Sharpness') && move.flags.slicing)) {
bpMods.add(6144);
desc.attackerAbility = attacker.ability;
}

// Aura abilities
String aura = '${move.type} Aura';
bool isAttackerAura = attacker.hasAbility(aura);
bool isDefenderAura = defender.hasAbility(aura);
bool isUserAuraBreak = attacker.hasAbility('Aura Break') || defender.hasAbility('Aura Break');
bool isFieldAuraBreak = field.isAuraBreak;
bool isFieldFairyAura = field.isFairyAura && move.type == 'Fairy';
bool isFieldDarkAura = field.isDarkAura && move.type == 'Dark';
bool auraActive = isAttackerAura || isDefenderAura || isFieldFairyAura || isFieldDarkAura;
bool auraBreak = isFieldAuraBreak || isUserAuraBreak;

if (auraActive) {
if (auraBreak) {
bpMods.add(3072);
desc.attackerAbility = attacker.ability;
desc.defenderAbility = defender.ability;
} else {
bpMods.add(5448);
if (isAttackerAura) desc.attackerAbility = attacker.ability;
if (isDefenderAura) desc.defenderAbility = defender.ability;
}
}

// Items
if (attacker.hasItem('${move.type} Gem')) {
bpMods.add(5325);
desc.attackerItem = attacker.item;
} else if (attacker.hasItem('Muscle Band') && move.category == 'Physical' ||
attacker.hasItem('Wise Glasses') && move.category == 'Special') {
bpMods.add(4505);
desc.attackerItem = attacker.item;
} else if (attacker.hasItem('Punching Glove') && move.flags.punch) {
bpMods.add(4506);
}

return bpMods;
}

int calculateAttackSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc, {
bool isCritical = false,
}) {
String attackStat = (move['name'] == 'Shell Side Arm' &&
getShellSideArmCategory(attacker, defender) == 'Physical')
? 'atk'
    : (move['name'] == 'Body Press')
? 'def'
    : (move['category'] == 'Special')
? 'spa'
    : 'atk';

desc['attackEVs'] = move['name'] == 'Foul Play'
? getStatDescriptionText(
gen, defender, attackStat, defender['nature'])
    : getStatDescriptionText(
gen, attacker, attackStat, attacker['nature']);

Pokemon attackSource = move['name'] == 'Foul Play'? defender: attacker;
int attack;

if (attackSource['boosts'][attackStat] == 0 ||
(isCritical && attackSource['boosts'][attackStat] < 0)) {
attack = attackSource['rawStats'][attackStat];
} else if (defender.containsKey('abilities') && defender['abilities'].contains('Unaware')) {
attack = attackSource['rawStats'][attackStat];
desc['defenderAbility'] = defender['abilities'];
} else {
attack = getModifiedStat(attackSource['rawStats'][attackStat],
attackSource['boosts'][attackStat]);
desc['attackBoost'] = attackSource['boosts'][attackStat];
}

if (attacker.containsKey('abilities') && attacker['abilities'].contains('Hustle') && move['category'] == 'Physical') {
attack = pokeRound((attack * 3) / 2);
desc['attackerAbility'] = attacker['abilities'];
}

List<int> atMods =
calculateAtModsSMSSSV(gen, attacker, defender, move, field, desc);
attack = OF16(max(
1,
pokeRound((attack * chainMods(atMods, 410, 131072)) / 4096)));
return attack;
}
List<int> calculateAtModsSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc,
) {
List<int> atMods =;

// Slow Start and Defeatist
if ((attacker.containsKey('abilities') && attacker['abilities'].contains('Slow Start') &&
attacker['abilityOn'] &&
(move['category'] == 'Physical' ||
(move['category'] == 'Special' && move['isZ']))) ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Defeatist') &&
attacker['curHP'] <= attacker['maxHP'] / 2)) {
atMods.add(2048);
desc['attackerAbility'] = attacker['abilities'];
} else if (
// Solar Power and Flower Gift
(attacker.containsKey('abilities') && attacker['abilities'].contains('Solar Power') &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
move['category'] == 'Special') ||
(attacker.containsKey('name') && attacker['name'] == 'Cherrim' &&
attacker.containsKey('abilities') && attacker['abilities'].contains('Flower Gift') &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
move['category'] == 'Physical')) {
atMods.add(6144);
desc['attackerAbility'] = attacker['abilities'];
desc['weather'] = field['weather'];
} else if (
// Gorilla Tactics
attacker.containsKey('abilities') && attacker['abilities'].contains('Gorilla Tactics') &&
move['category'] == 'Physical' &&
!attacker['isDynamaxed']) {
atMods.add(6144);
desc['attackerAbility'] = attacker['abilities'];
} else if (
// Guts, Overgrow, Blaze, Torrent, Swarm
(attacker.containsKey('abilities') && attacker['abilities'].contains('Guts') &&
attacker.containsKey('status') && attacker['status']!= null &&
move['category'] == 'Physical') ||
(attacker['curHP'] <= attacker['maxHP'] / 3 &&
((attacker.containsKey('abilities') && attacker['abilities'].contains('Overgrow') && move['type'] == 'Grass') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Blaze') && move['type'] == 'Fire') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Torrent') && move['type'] == 'Water') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Swarm') && move['type'] == 'Bug'))) ||
(move['category'] == 'Special' &&
attacker['abilityOn'] &&
(attacker.containsKey('abilities') && (attacker['abilities'].contains('Plus') || attacker['abilities'].contains('Minus'))))) {
atMods.add(6144);
desc['attackerAbility'] = attacker['abilities'];
} else if (attacker.containsKey('abilities') && attacker['abilities'].contains('Flash Fire') &&
attacker['abilityOn'] &&
move['type'] == 'Fire') {
atMods.add(6144);
desc['attackerAbility'] = 'Flash Fire';
} else if (
// Steelworker, Dragon's Maw, Rocky Payload
(attacker.containsKey('abilities') && attacker['abilities'].contains('Steelworker') && move['type'] == 'Steel') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Dragon\'s Maw') && move['type'] == 'Dragon') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Rocky Payload') && move['type'] == 'Rock')) {
atMods.add(6144);
desc['attackerAbility'] = attacker['abilities'];
} else if (attacker.containsKey('abilities') && attacker['abilities'].contains('Transistor') && move['type'] == 'Electric') {
atMods.add(gen['num'] >= 9? 5325: 6144);
desc['attackerAbility'] = attacker['abilities'];
} else if (attacker.containsKey('abilities') && attacker['abilities'].contains('Stakeout') && attacker['abilityOn']) {
atMods.add(8192);
desc['attackerAbility'] = attacker['abilities'];
} else if (
// Water Bubble, Huge Power, Pure Power
(attacker.containsKey('abilities') && attacker['abilities'].contains('Water Bubble') && move['type'] == 'Water') ||
(attacker.containsKey('abilities') && (attacker['abilities'].contains('Huge Power') || attacker['abilities'].contains('Pure Power')) && move['category'] == 'Physical')) {
atMods.add(8192);
desc['attackerAbility'] = attacker['abilities'];
}

// Flower Gift (field)
if (field.containsKey('attackerSide') && field['attackerSide'].containsKey('isFlowerGift') &&
field['attackerSide']['isFlowerGift'] &&
!(attacker.containsKey('abilities') && attacker['abilities'].contains('Flower Gift')) &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
move['category'] == 'Physical') {
atMods.add(6144);
desc['weather'] = field['weather'];
desc['isFlowerGiftAttacker'] = true;
}

// Steely Spirit (field)
if (field.containsKey('attackerSide') && field['attackerSide'].containsKey('isSteelySpirit') &&
field['attackerSide']['isSteelySpirit'] &&
move['type'] == 'Steel') {
atMods.add(6144);
desc['isSteelySpiritAttacker'] = true;
}

// Thick Fat, Water Bubble, Purifying Salt
if ((defender.containsKey('abilities') && defender['abilities'].contains('Thick Fat') && (move['type'] == 'Fire' || move['type'] == 'Ice')) ||
(defender.containsKey('abilities') && defender['abilities'].contains('Water Bubble') && move['type'] == 'Fire') ||
(defender.containsKey('abilities') && defender['abilities'].contains('Purifying Salt') && move['type'] == 'Ghost')) {
atMods.add(2048);
desc['defenderAbility'] = defender['abilities'];
}

if (gen['num'] >= 9 && defender.containsKey('abilities') && defender['abilities'].contains('Heatproof') && move['type'] == 'Fire') {
atMods.add(2048);
desc['defenderAbility'] = defender['abilities'];
}

// Tablets of Ruin and Vessel of Ruin
bool isTabletsOfRuinActive = (defender.containsKey('abilities') && defender['abilities'].contains('Tablets of Ruin') ||
(field.containsKey('isTabletsOfRuin') && field['isTabletsOfRuin'])) &&
!(attacker.containsKey('abilities') && attacker['abilities'].contains('Tablets of Ruin'));
bool isVesselOfRuinActive = (defender.containsKey('abilities') && defender['abilities'].contains('Vessel of Ruin') ||
(field.containsKey('isVesselOfRuin') && field['isVesselOfRuin'])) &&
!(attacker.containsKey('abilities') && attacker['abilities'].contains('Vessel of Ruin'));

if ((isTabletsOfRuinActive && move['category'] == 'Physical') ||
(isVesselOfRuinActive && move['category'] == 'Special')) {
if (defender.containsKey('abilities') && (defender['abilities'].contains('Tablets of Ruin') || defender['abilities'].contains('Vessel of Ruin'))) {
desc['defenderAbility'] = defender['abilities'];
} else {
desc[move['category'] == 'Special'? 'isVesselOfRuin': 'isTabletsOfRuin'] = true;
}
atMods.add(3072);
}

// Quark Drive and Protosynthesis
if (isQPActive(attacker, field)) {
String? qpBoostedStat = getQPBoostedStat(attacker);
if ((move['category'] == 'Physical' && qpBoostedStat == 'atk') ||
(move['category'] == 'Special' && qpBoostedStat == 'spa')) {
atMods.add(5325);
desc['attackerAbility'] = attacker['abilities'];
}
}

// Hadron Engine and Orichalcum Pulse
if ((attacker.containsKey('abilities') && attacker['abilities'].contains('Hadron Engine') &&
move['category'] == 'Special' &&
field.containsKey('terrain') && field['terrain'] == 'Electric') ||
(attacker.containsKey('abilities') && attacker['abilities'].contains('Orichalcum Pulse') &&
move['category'] == 'Physical' &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
!(attacker.containsKey('item') && attacker['item'] == 'Utility Umbrella'))) {
atMods.add(5461);
desc['attackerAbility'] = attacker['abilities'];
}

// Thick Club, Deep Sea Tooth, Light Ball
if ((attacker.containsKey('item') && attacker['item'] == 'Thick Club' &&
attacker.containsKey('name') && (attacker['name'] == 'Cubone' || attacker['name'] == 'Marowak' || attacker['name'] == 'Marowak-Alola' || attacker['name'] == 'Marowak-Alola-Totem') &&
move['category'] == 'Physical') ||
(attacker.containsKey('item') && attacker['item'] == 'Deep Sea Tooth' &&
attacker.containsKey('name') && attacker['name'] == 'Clamperl' &&
move['category'] == 'Special') ||
(attacker.containsKey('item') && attacker['item'] == 'Light Ball' &&
attacker.containsKey('name') && attacker['name'].contains('Pikachu') &&
!move['isZ'])) {
atMods.add(8192);
desc['attackerItem'] = attacker['item'];
}
// Choice Band/Specs (Not during Dynamax)
else if (!move['isZ'] &&
!move['isMax'] &&
((attacker.containsKey('item') && attacker['item'] == 'Choice Band' && move['category'] == 'Physical') ||
(attacker.containsKey('item') && attacker['item'] == 'Choice Specs' && move['category'] == 'Special'))) {
atMods.add(6144);
desc['attackerItem'] = attacker['item'];
}

return atMods;
}
int calculateDefenseSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc, {
bool isCritical = false,
}) {
bool hitsPhysical = move['overrideDefensiveStat'] == 'def' ||
move['category'] == 'Physical' ||
(move['name'] == 'Shell Side Arm' &&
getShellSideArmCategory(attacker, defender) == 'Physical');
String defenseStat = hitsPhysical? 'def': 'spd';

desc['defenseEVs'] = getStatDescriptionText(
gen, defender, defenseStat, defender['nature']);

int defense;
if (defender['boosts'][defenseStat] == 0 ||
(isCritical && defender['boosts'][defenseStat] > 0) ||
move['ignoreDefensive']) {
defense = defender['rawStats'][defenseStat];
} else if (attacker.containsKey('abilities') && attacker['abilities'].contains('Unaware')) {
defense = defender['rawStats'][defenseStat];
desc['attackerAbility'] = attacker['abilities'];
} else {
defense = getModifiedStat(defender['rawStats'][defenseStat],
defender['boosts'][defenseStat]);
desc['defenseBoost'] = defender['boosts'][defenseStat];
}

if (field.containsKey('weather') && field['weather'] == 'Sand' &&
defender.containsKey('types') && defender['types'].contains('Rock') &&
!hitsPhysical) {
defense = pokeRound((defense * 3) / 2);
desc['weather'] = field['weather'];
}

if (field.containsKey('weather') && field['weather'] == 'Snow' &&
defender.containsKey('types') && defender['types'].contains('Ice') &&
hitsPhysical) {
defense = pokeRound((defense * 3) / 2);
desc['weather'] = field['weather'];
}

List<int> dfMods = calculateDfModsSMSSSV(
gen,
attacker,
defender,
move,
field,
desc,
isCritical: isCritical,
hitsPhysical: hitsPhysical,
);

return OF16(max(
1,
pokeRound((defense * chainMods(dfMods, 410, 131072)) / 4096)));
}
List<int> calculateDfModsSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc, {
bool isCritical = false,
required bool hitsPhysical,
}) {
List<int> dfMods =;

if (defender.containsKey('abilities') &&
defender['abilities'].contains('Marvel Scale') &&
defender.containsKey('status') && // Check if status exists
defender['status']!= null && // Check if status is not null
hitsPhysical) {
dfMods.add(6144);
desc['defenderAbility'] = defender['abilities'];
} else if (defender.containsKey('name') &&
defender['name'] == 'Cherrim' &&
defender.containsKey('abilities') &&
defender['abilities'].contains('Flower Gift') &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
!hitsPhysical) {
dfMods.add(6144);
desc['defenderAbility'] = defender['abilities'];
desc['weather'] = field['weather'];
} else if (field.containsKey('defenderSide') &&
field['defenderSide'].containsKey('isFlowerGift') &&
field['defenderSide']['isFlowerGift'] &&
field.containsKey('weather') && (field['weather'] == 'Sun' || field['weather'] == 'Harsh Sunshine') &&
!hitsPhysical) {
dfMods.add(6144);
desc['weather'] = field['weather'];
desc['isFlowerGiftDefender'] = true;
} else if (defender.containsKey('abilities') &&
defender['abilities'].contains('Grass Pelt') &&
field.containsKey('terrain') && field['terrain'] == 'Grassy' &&
hitsPhysical) {
dfMods.add(6144);
desc['defenderAbility'] = defender['abilities'];
} else if (defender.containsKey('abilities') &&
defender['abilities'].contains('Fur Coat') &&
hitsPhysical) {
dfMods.add(8192);
desc['defenderAbility'] = defender['abilities'];
}

bool isSwordOfRuinActive = (attacker.containsKey('abilities') && attacker['abilities'].contains('Sword of Ruin') ||
(field.containsKey('isSwordOfRuin') && field['isSwordOfRuin'])) &&
!(defender.containsKey('abilities') && defender['abilities'].contains('Sword of Ruin'));

bool isBeadsOfRuinActive = (attacker.containsKey('abilities') && attacker['abilities'].contains('Beads of Ruin') ||
(field.containsKey('isBeadsOfRuin') && field['isBeadsOfRuin'])) &&
!(defender.containsKey('abilities') && defender['abilities'].contains('Beads of Ruin'));

if ((isSwordOfRuinActive && hitsPhysical) || (isBeadsOfRuinActive &&!hitsPhysical)) {
if (attacker.containsKey('abilities') &&
(attacker['abilities'].contains('Sword of Ruin') || attacker['abilities'].contains('Beads of Ruin'))) {
desc['attackerAbility'] = attacker['abilities'];
} else {
desc[hitsPhysical? 'isSwordOfRuin': 'isBeadsOfRuin'] = true;
}
dfMods.add(3072);
}

if (isQPActive(defender, field)) {
String? qpBoostedStat = getQPBoostedStat(defender);
if ((hitsPhysical && qpBoostedStat == 'def') || (!hitsPhysical && qpBoostedStat == 'spd')) {
desc['defenderAbility'] = defender['abilities'];
dfMods.add(5324);
}
}

if ((defender.containsKey('item') &&
defender['item'] == 'Eviolite' &&
(defender.containsKey('name') && (defender['name'] == 'Dipplin' || (gen.containsKey('species') && gen['species'].containsKey(toID(defender['name'])) && gen['species'][toID(defender['name'])]['nfe']))) ||
(!hitsPhysical && defender.containsKey('item') && defender['item'] == 'Assault Vest')) {
dfMods.add(6144);
desc['defenderItem'] = defender['item'];
} else if ((defender.containsKey('item') &&
defender['item'] == 'Metal Powder' &&
defender.containsKey('name') && defender['name'] == 'Ditto' &&
hitsPhysical) ||
(defender.containsKey('item') &&
defender['item'] == 'Deep Sea Scale' &&
defender.containsKey('name') && defender['name'] == 'Clamperl' &&
!hitsPhysical)) {
dfMods.add(8192);
desc['defenderItem'] = defender['item'];
}

return dfMods;
}
int calculateBaseDamageSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
int basePower,
int attack,
int defense,
Move move,
Field field,
RawDesc desc,
{bool isCritical = false}
) {
int baseDamage = getBaseDamage(attacker.level, basePower, attack, defense);
bool isSpread = field.gameType != 'Singles' &&
['allAdjacent', 'allAdjacentFoes'].contains(move.target);
if (isSpread) {
baseDamage = pokeRound(OF32(baseDamage * 3072) ~/ 4096);
}

if (attacker.hasAbility('Parental Bond (Child)')) {
baseDamage = pokeRound(OF32(baseDamage * 1024) ~/ 4096);
}

if (field.hasWeather('Sun') && move.named('Hydro Steam') && !attacker.hasItem('Utility Umbrella')) {
baseDamage = pokeRound(OF32(baseDamage * 6144) ~/ 4096);
desc.weather = field.weather;
} else if (!defender.hasItem('Utility Umbrella')) {
if ((field.hasWeather('Sun', 'Harsh Sunshine') && move.hasType('Fire')) ||
(field.hasWeather('Rain', 'Heavy Rain') && move.hasType('Water'))) {
baseDamage = pokeRound(OF32(baseDamage * 6144) ~/ 4096);
desc.weather = field.weather;
} else if ((field.hasWeather('Sun') && move.hasType('Water')) ||
(field.hasWeather('Rain') && move.hasType('Fire'))) {
baseDamage = pokeRound(OF32(baseDamage * 2048) ~/ 4096);
desc.weather = field.weather;
}
}

if (isCritical) {
baseDamage = (OF32(baseDamage * 1.5)).floor();
desc.isCritical = isCritical;
}

return baseDamage;
}

List<int> calculateFinalModsSMSSSV(
Generation gen,
Pokemon attacker,
Pokemon defender,
Move move,
Field field,
RawDesc desc,
{bool isCritical = false, int typeEffectiveness = 1, int hitCount = 0}
) {
List<int> finalMods = [];

if (field.defenderSide.isReflect && move.category == 'Physical' &&
!isCritical && !field.defenderSide.isAuroraVeil) {
finalMods.add(field.gameType != 'Singles' ? 2732 : 2048);
desc.isReflect = true;
} else if (field.defenderSide.isLightScreen && move.category == 'Special' &&
!isCritical && !field.defenderSide.isAuroraVeil) {
finalMods.add(field.gameType != 'Singles' ? 2732 : 2048);
desc.isLightScreen = true;
}
if (field.defenderSide.isAuroraVeil && !isCritical) {
finalMods.add(field.gameType != 'Singles' ? 2732 : 2048);
desc.isAuroraVeil = true;
}

if (attacker.hasAbility('Neuroforce') && typeEffectiveness > 1) {
finalMods.add(5120);
desc.attackerAbility = attacker.ability;
} else if (attacker.hasAbility('Sniper') && isCritical) {
finalMods.add(6144);
desc.attackerAbility = attacker.ability;
} else if (attacker.hasAbility('Tinted Lens') && typeEffectiveness < 1) {
finalMods.add(8192);
desc.attackerAbility = attacker.ability;
}

if (defender.isDynamaxed && move.named('Dynamax Cannon', 'Behemoth Blade', 'Behemoth Bash')) {
finalMods.add(8192);
}

if (defender.hasAbility('Multiscale', 'Shadow Shield') &&
defender.curHP() == defender.maxHP() &&
hitCount == 0 &&
(!field.defenderSide.isSR && (!field.defenderSide.spikes || defender.hasType('Flying')) ||
defender.hasItem('Heavy-Duty Boots')) &&
!attacker.hasAbility('Parental Bond (Child)')) {
finalMods.add(2048);
desc.defenderAbility = defender.ability;
}

if (defender.hasAbility('Fluffy') && move.flags.contact && !attacker.hasAbility('Long Reach')) {
finalMods.add(2048);
desc.defenderAbility = defender.ability;
} else if ((defender.hasAbility('Punk Rock') && move.flags.sound) ||
(defender.hasAbility('Ice Scales') && move.category == 'Special')) {
finalMods.add(2048);
desc.defenderAbility = defender.ability;
}

if (defender.hasAbility('Solid Rock', 'Filter', 'Prism Armor') && typeEffectiveness > 1) {
finalMods.add(3072);
desc.defenderAbility = defender.ability;
}

if (field.defenderSide.isFriendGuard) {
finalMods.add(3072);
desc.isFriendGuard = true;
}

if (defender.hasAbility('Fluffy') && move.hasType('Fire')) {
finalMods.add(8192);
desc.defenderAbility = defender.ability;
}

if (attacker.hasItem('Expert Belt') && typeEffectiveness > 1 && !move.isZ) {
finalMods.add(4915);
desc.attackerItem = attacker.item;
} else if (attacker.hasItem('Life Orb')) {
finalMods.add(5324);
desc.attackerItem = attacker.item;
} else if (attacker.hasItem('Metronome') && move.timesUsedWithMetronome! >= 1) {
int timesUsedWithMetronome = move.timesUsedWithMetronome!.floor();
finalMods.add(timesUsedWithMetronome <= 4 ? 4096 + timesUsedWithMetronome * 819 : 8192);
desc.attackerItem = attacker.item;
}

return finalMods;
}

bool hasTerrainSeed(Pokemon pokemon) {
return pokemon.hasItem('Electric Seed', 'Misty Seed', 'Grassy Seed', 'Psychic Seed');
}
