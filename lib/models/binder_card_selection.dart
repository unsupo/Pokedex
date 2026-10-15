import 'package:isar_community/isar.dart';

part 'binder_card_selection.g.dart';

/// A profile's chosen display card for one Pokemon's card-binder pocket. See
/// the "Data model changes" section of docs/features/card-binder.md.
///
/// Same shape as [CaughtTcgCard] (lib/models/tcg_card.dart) on purpose: a
/// composite unique index with `replace: true` upserts by
/// (profileId, pokemonId), and [isarId] is non-final for the same reason
/// documented there - Isar must be able to assign the stored id back onto
/// this object when it reads a row, or a later put would insert a duplicate
/// instead of updating.
@collection
class BinderCardSelection {
  Id isarId = Isar.autoIncrement;

  @Index(
    composite: [CompositeIndex('pokemonId')],
    unique: true,
    replace: true,
  )
  late int profileId;

  late int pokemonId;

  late String selectedCardId;

  BinderCardSelection({
    required this.profileId,
    required this.pokemonId,
    required this.selectedCardId,
  });
}
