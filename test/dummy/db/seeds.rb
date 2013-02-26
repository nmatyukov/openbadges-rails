OpenBadges::Badge.delete_all
OpenBadges::Tag.delete_all
OpenBadges::BadgeTag.delete_all

OpenBadges::Badge.create(
  name: 'Badge 1',
  image: 'badge1.png')
OpenBadges::Badge.create(
  name: 'Badge 2',
  image: 'badge2.jpg')
OpenBadges::Badge.create(
  name: 'Badge 3',
  image: 'badge3.jpeg')

OpenBadges::Tag.create(
  name: 'Tag 1')
OpenBadges::Tag.create(
  name: 'Tag 2')
OpenBadges::Tag.create(
  name: 'Tag 3')

OpenBadges::BadgeTag.create(
  badge_id: 1,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 2,
  tag_id: 2)
OpenBadges::BadgeTag.create(
  badge_id: 3,
  tag_id: 3)