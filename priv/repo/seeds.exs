# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nest.Repo.insert!(%Nest.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


cabins = [
  %{
    name: "Le Sanctuaire de la Nature",
    description: "Évadez-vous de la ville et découvrez la tranquillité de la nature en séjournant dans notre cabane perchée dans les arbres. Vous pourrez profiter d'une vue imprenable sur la canopée et écouter les bruits de la forêt la nuit. Cette expérience unique en son genre vous offrira un séjour inoubliable.",
    max_guests: 4,
    area: "Région de Bruxelles-Capitale",
    price: 80,
    city: "Bruxelles"
  },
  %{
    name: "La Cabane de la Sérénité",
    description: "Imaginez-vous surplombant la canopée des arbres depuis votre propre cabane perchée dans les hauteurs. Notre cabane offre une expérience de vie en harmonie avec la nature, avec le confort moderne pour que vous puissiez profiter de la vue imprenable tout en ayant toutes les commodités nécessaires pour passer un séjour agréable.",
    max_guests: 6,
    area: "Région wallonne",
    price: 45,
    city: "Liège"
  },
  %{
    name: "L'Oasis des Arbres",
    description: "Nous vous invitons à venir séjourner dans notre cabane perchée dans les arbres, une expérience unique et inoubliable. Vous serez entouré d'une nature luxuriante, avec une vue imprenable sur la forêt environnante. Vous pourrez observer les animaux sauvages depuis votre terrasse privée, pour un moment de calme et de détente.",
    max_guests: 4,
    area: "Région wallonne",
    price: 90
  },
  %{
    name: "La Cabane de la Canopée",
    description: "Pour une expérience de vie en pleine nature, rien ne vaut une cabane perchée dans les arbres. Notre cabane est conçue pour vous offrir une vue imprenable sur la canopée, ainsi que tout le confort moderne dont vous avez besoin pour un séjour agréable. Profitez de la sérénité de la forêt et détendez-vous dans ce havre de paix.",
    max_guests: 8,
    area: "Région wallonne",
    price: 60,
    city: "Namur"
  },
  %{
    name: "L'Évasion des Cimes",
    description: "Offrez-vous une expérience unique en passant la nuit dans notre cabane perchée dans les arbres. Vous pourrez admirer la vue imprenable sur la canopée depuis votre terrasse privée, et vous serez bercé par les sons de la nature toute la nuit. Cette expérience unique vous offrira une immersion totale dans la nature, pour un séjour inoubliable.",
    max_guests: 4,
    area: "Région wallonne",
    price: 110,
    city: "Charleroi"
  },
  %{
    name: "La Maison dans les Arbres",
    description: "Envie d'une expérience unique et hors du commun ? Optez pour notre cabane perchée dans les arbres, qui vous offrira une vue spectaculaire sur la nature environnante. Vous pourrez observer les oiseaux et autres animaux sauvages depuis votre terrasse privée, pour une expérience en harmonie avec la nature.",
    max_guests: 6,
    area: "Région wallonne",
    price: 75,
    city: "Tournai"
  },
  %{
    name: "La Cabane du Pic Vert",
    description: "Nichée dans les arbres, notre cabane offre une expérience immersive dans la nature, avec tout le confort moderne que vous pourriez souhaiter. Profitez de la vue imprenable sur les arbres, écoutez les bruits de la nature et relaxez-vous dans ce havre de paix, loin de l'agitation de la ville.",
    max_guests: 4,
    area: "Région flamande",
    price: 49,
    city: "Gand"
  },
  %{
    name: "Le Refuge de la Forêt",
    description: "Venez découvrir la magie de notre cabane perchée dans les arbres, qui vous offrira une expérience unique de vie en pleine nature. Vous pourrez observer les étoiles depuis votre terrasse privée, et vous réveiller au son des oiseaux le matin. Une expérience immersive et relaxante à ne pas manquer.",
    max_guests: 3,
    area: "Région flamande",
    price: 69,
    city: "Anvers"
  },
  %{
    name: "La Tanière des Ours",
    description: "Pour une expérience de vie en harmonie avec la nature, notre cabane perchée dans les arbres est l'endroit idéal. Vous pourrez profiter d'une vue imprenable sur les arbres et la forêt environnante, tout en étant confortablement installé dans votre cabane. Une expérience unique et inoubliable vous attend.",
    max_guests: 4,
    area: "Région flamande",
    price: 75,
    city: "Mechelen"

  },
  %{
    name: "La Cabane du Loup",
    description: "Notre cabane perchée dans les arbres offre une expérience unique de vie en pleine nature. Située en hauteur, vous aurez une vue imprenable sur les arbres et la forêt environnante. Profitez de la tranquillité de la nature tout en étant confortablement installé dans votre cabane.",
    max_guests: 5,
    area: "Région flamande",
    price: 60,
    city: "Leuven"
  },
  %{
    name: "Le Nid d'Aigle",
    description: "Nichée au sommet des arbres, notre cabane vous offre une vue imprenable sur la nature environnante. Vous pourrez observer les étoiles la nuit depuis votre terrasse privée, et vous réveiller au son des oiseaux le matin. Une expérience unique de vie en pleine nature vous attend.",
    max_guests: 2,
    area: "Région flamande",
    price: 45,
    city: "Leuven"
  },
  %{
    name: "L'Arbre Magique",
    description: "Vivez une expérience immersive dans la nature en séjournant dans notre cabane perchée dans les arbres. Vous pourrez observer les animaux sauvages et les oiseaux depuis votre terrasse privée, tout en étant confortablement installé dans votre cabane. Un séjour relaxant et inoubliable en perspective.",
    max_guests: 4,
    area: "Région flamande",
    price: 120,
    city: "Hasselt"
  },
  %{
    name: "La Cabane du Colibri",
    description: "Éloignez-vous de la ville et découvrez la sérénité de la nature en séjournant dans notre cabane perchée dans les arbres. Vous pourrez profiter d'une vue imprenable sur la forêt environnante, tout en étant confortablement installé dans votre cabane. Une expérience unique et paisible vous attend.",
    max_guests: 2,
    area: "Région flamande",
    price: 80,
    city: "Mechelen"
  },
  %{
    name: "La Cime Perchée",
    description: "Notre cabane perchée dans les arbres vous offre une expérience immersive dans la nature, avec tout le confort moderne que vous pourriez souhaiter. Profitez de la vue imprenable sur la canopée, écoutez les bruits de la forêt et détendez-vous dans ce havre de paix, loin du stress de la vie quotidienne.",
    max_guests: 3,
    area: "Région flamande",
    price: 55,
    city: "Genk"
  },
  %{
    name: "La Cabane Enchantée",
    description: "Pour une expérience unique de vie en pleine nature, optez pour notre cabane perchée dans les arbres. Vous pourrez admirer la beauté de la nature environnante depuis votre terrasse privée, et vous détendre dans votre cabane confortablement équipée. Un séjour en immersion totale dans la nature, pour une expérience inoubliable.",
    max_guests: 5,
    area: "Région flamande",
    price: 99,
    city: "Courtrai"
  },
  %{
    name: "L'Arbre à Rêves",
    description: "Cette cabane perchée est située en bordure d'une clairière, accessible par une échelle en bois. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes fenêtres offrent une vue panoramique sur la forêt environnante, créant une sensation d'immersion totale dans la nature. La terrasse privée est équipée de chaises longues pour se détendre et profiter de la vue.",
    max_guests: 4,
    area: "Région flamande",
    price: 200,
    city: "Bruges"
  },
  %{
    name: "La Maison des Oiseaux",
    description: "Cette cabane perchée est construite sur plusieurs niveaux, accessible par un escalier en colimaçon. La cabane est équipée de deux chambres, l'une avec un grand lit double et l'autre avec des lits jumeaux, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes baies vitrées offrent une vue panoramique sur la forêt environnante, créant une sensation de plénitude. La terrasse privée est équipée de chaises longues pour se détendre et admirer la vue. Cette cabane perchée est parfaite pour les familles ou les groupes d'amis qui cherchent à se ressourcer en pleine nature.",
    max_guests: 1,
    area: "Région de Bruxelles-Capitale",
    price: 50,
    city: "Schaerbeek"
  },
  %{
    name: "Les Hauteurs Magiques",
    description: "Cette cabane perchée est située dans un arbre isolé, accessible par une échelle en bois et un système de levage. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes fenêtres offrent une vue panoramique sur les vallées environnantes, créant une sensation de plénitude. La terrasse privée est équipée de chaises longues pour se détendre et profiter de la vue spectaculaire.",
    max_guests: 1,
    area: "Région de Bruxelles-Capitale",
    price: 120,
    city: "Ixelles"
  },
  %{
    name: "Le Perchoir Secret",
    description: "Cette cabane perchée est nichée dans la canopée, accessible par une échelle en bois. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes baies vitrées offrent une vue panoramique sur la forêt environnante, créant une sensation de plongée au cœur de la nature. La terrasse privée est équipée de chaises longues pour se détendre et admirer la vue.",
    max_guests: 4,
    area: "Région wallonne",
    price: 230,
    city: "Charleroi"
  },
  %{
    name: "L'Arbre aux Mille Feuilles",
    description: "Cette cabane perchée est située au-dessus d'une rivière cristalline, accessible par un pont suspendu. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes baies vitrées offrent une vue imprenable sur la rivière et les montagnes environnantes, créant une sensation d'immersion totale dans la nature. La terrasse privée est équipée de chaises longues pour se détendre et profiter du paysage.",
    max_guests: 4,
    area: "Région flamande",
    price: 100,
    city: "Ostende"
  },
  %{
    name: "Le Chalet des Aigles",
    description: "Cette cabane perchée est construite au sommet d'un grand arbre, accessible par une échelle en bois. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes fenêtres offrent une vue panoramique sur la forêt environnante et vous permettent de vous sentir en harmonie avec la nature. La terrasse privée est équipée de chaises longues pour se détendre et observer les oiseaux qui viennent parfois se poser sur les branches à proximité.",
    max_guests: 3,
    area: "Région flamande",
    price: 40,
    city: "Leuven"
  },
  %{
    name: "La Cabane Étoilée",
    description: "Cette cabane perchée est située sur une île flottante, entourée d'arbres majestueux et accessible par un petit ponton. La cabane est équipée d'un grand lit double, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes baies vitrées offrent une vue à 360 degrés sur le lac et les montagnes environnantes, créant une sensation d'immersion totale dans la nature. La terrasse privée est équipée de chaises longues pour se détendre et admirer le paysage. Pour les soirées fraîches, vous pouvez allumer le poêle à bois pour une ambiance chaleureuse et romantique.",
    max_guests: 6,
    area: "Région wallonne",
    price: 85,
    city: "La Louvière"
  },
  %{
    name: "La Cabane boisée",
    description: "Ces cabanes perchées sont situées dans une clairière de la forêt, reliées entre elles par des ponts suspendus. Chaque cabane a une ambiance unique et offre un refuge confortable pour les amoureux de la nature. Les cabanes sont équipées d'un lit double ou de lits jumeaux, d'une salle de bains avec douche et de toilettes, d'une kitchenette avec des ustensiles de cuisine de base et d'un petit coin salon. Les grandes fenêtres offrent une vue panoramique sur la forêt environnante et vous permettent de vous sentir en harmonie avec la nature. Sur la terrasse privée, vous pourrez vous détendre dans les chaises longues tout en écoutant le chant des oiseaux et le bruissement des feuilles dans le vent.",
    max_guests: 3,
    area: "Région wallonne",
    price: 140,
    city: "Nivelles"

  },
  %{
    name: "Le Cocon Vertigo",
    description: "Cette cabane perchée est nichée au sommet d'un arbre majestueux, accessible par une échelle en bois. Une fois à l'intérieur, vous serez transporté dans un monde de nature et de tranquillité. La cabane est équipée d'un lit double confortable, d'une petite kitchenette avec des ustensiles de cuisine de base, d'une salle de bains avec douche et de toilettes. Les grandes fenêtres offrent une vue panoramique sur la forêt environnante et vous permettent de vous sentir complètement immergé dans la nature. Pour les soirées fraîches, vous pouvez allumer le poêle à bois pour une ambiance chaleureuse et confortable. Une terrasse privée est également à votre disposition pour profiter de la vue tout en vous relaxant dans les chaises longues.",
    max_guests: 8,
    area: "Région wallonne",
    price: 160,
    city: "Verviers"
  }
]

Nest.Repo.insert_all(Nest.Cabin, cabins)
