OpenBadges::Badge.delete_all
OpenBadges::Tag.delete_all
OpenBadges::BadgeTag.delete_all
OpenBadges::Alignment.delete_all
OpenBadges::BadgeAlignment.delete_all

OpenBadges::Badge.create(
  id: 1,
  name: 'Teleport',
  image: 'teleport.png')
OpenBadges::Badge.create(
  id: 2,
  name: 'Ice Wall',
  image: 'ice_wall.jpg')
OpenBadges::Badge.create(
  id: 3,
  name: 'Fireball',
  image: 'fireball.jpeg')

OpenBadges::Tag.create(
  id: 1,
  name: 'Magic')
OpenBadges::Tag.create(
  id: 2,
  name: 'Elemental')

OpenBadges::BadgeTag.create(
  badge_id: 1,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 2,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 3,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 2,
  tag_id: 2)
OpenBadges::BadgeTag.create(
  badge_id: 3,
  tag_id: 2)

OpenBadges::Alignment.create(
  id: 1,
  name: 'Manipulated space time without time dilation',
  url: 'www.hogwarts.edu/time_dilation')
OpenBadges::Alignment.create(
  id: 2,
  name: 'Apply elemental knowledge to cast spells that are more useful',
  url: 'www.hogwarts.edu/elemental_theory')

OpenBadges::BadgeAlignment.create(
  badge_id: 1,
  alignment_id: 1)
OpenBadges::BadgeAlignment.create(
  badge_id: 2,
  alignment_id: 2)
OpenBadges::BadgeAlignment.create(
  badge_id: 3,
  alignment_id: 3)

