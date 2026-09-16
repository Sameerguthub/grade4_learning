import 'package:flutter/material.dart';
import 'wild_animals.dart';
import 'general_data.dart';
import 'general_category.dart';
import 'pet_animals.dart';
import 'birds.dart';
import 'things_home.dart';
import 'fruits.dart';
import 'professions.dart';
import 'vehicles.dart';
import 'vegetables.dart';
import 'flowers.dart';
import 'musical_instruments.dart';
import 'plants_trees.dart';
import 'insects.dart';
import 'places.dart';
import 'electricity_gadgets.dart';
import 'human_body.dart';
import 'food_drinks.dart';
import 'materials_around_us.dart';
import 'sports_games.dart';

final List<GeneralCategory> generalCategories = [
  GeneralCategory(
    name: 'Wild Animals',
    subtitle: 'Animals of the wild',
    image: 'assets/general/wild_animals/lion.png',
    items: wildAnimals,
  ),
  GeneralCategory(
  name: 'Sports & Games',
  subtitle: 'Play, learn and stay active',
  image: 'assets/general/sports_games/cricket.png',
  items: sportsAndGames,
),
  GeneralCategory(
  name: 'Materials Around Us',
  subtitle: 'Things are made from materials',
  image: 'assets/general/materials_around_us/wood.png',
  items: materialsAroundUs,
  ),
  GeneralCategory(
  name: 'Electricity & Gadgets',
  subtitle: 'Technology around us',
  image: 'assets/general/electricity_gadgets/bulb.png',
  items: electricityAndGadgets,
  ),
  GeneralCategory(
  name: 'Food & Drinks',
  subtitle: 'Food we eat and drinks we enjoy',
  image: 'assets/general/food_drinks/rice.png',
  items: foodAndDrinks,
  ),
  GeneralCategory(
  name: 'Musical Instruments',
  subtitle: 'Instruments that make music',
  image: 'assets/general/musical_instruments/piano.png',
  items: musicalInstruments,
  ),
  GeneralCategory(
  name: 'Human Body',
  subtitle: 'Parts and their functions',
  image: 'assets/general/human_body/brain.png',
  items: humanBody,
  ),
  GeneralCategory(
  name: 'Places',
  subtitle: 'Places around us',
  image: 'assets/general/places/school.png',
  items: places,
  ),
  GeneralCategory(
  name: 'Plants & Trees',
  subtitle: 'Green plants around us',
  image: 'assets/general/plants_trees/mango_tree.png',
  items: plantsAndTrees,
  ),
    GeneralCategory(
    name: 'Pet & Farm Animals',
    subtitle: 'Animals around us',
    image: 'assets/general/pet_animals/dog.png',
    items: petAnimals,
  ),
  GeneralCategory(
  name: 'Birds',
  subtitle: 'Beautiful birds',
  image: 'assets/general/birds/parrot.png',
  items: birds,
  ),
  GeneralCategory(
  name: 'Things at Home',
  subtitle: 'Things we use every day',
  image: 'assets/general/home/things_home.png',
  items: homeThings,
  ),
  GeneralCategory(
  name: 'Vehicles',
  subtitle: 'Ways we travel',
  image: 'assets/general/vehicles/car.png',
  items: vehicles,
  ),
  GeneralCategory(
  name: 'Fruits',
  subtitle: 'Sweet and healthy fruits',
  image: 'assets/general/fruits/apple.png',
  items: fruits,
  ),
  GeneralCategory(
  name: 'Professions',
  subtitle: 'People and their jobs',
  image: 'assets/general/professions/doctor.png',
  items: professions,
  ),
  GeneralCategory(
  name: 'Insects',
  subtitle: 'Tiny creatures',
  image: 'assets/general/insects/butterfly.png',
  items: insects,
  ),
  GeneralCategory(
  name: 'Vegetables',
  subtitle: 'Healthy vegetables',
  image: 'assets/general/vegetables/tomato.png',
  items: vegetables,
  ),
  GeneralCategory(
  name: 'Flowers',
  subtitle: 'Beautiful flowers',
  image: 'assets/general/flowers/rose.png',
  items: flowers,
  ),
];

class GeneralHomePage extends StatelessWidget {
  const GeneralHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'Know the World',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.82,
        ),

        itemCount: generalCategories.length,

        itemBuilder: (context, index) {
          final category = generalCategories[index];

          return _CategoryCard(
            category: category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GeneralCategoryPage(
                    category: category,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class _CategoryCard extends StatelessWidget {
  final GeneralCategory category;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(21),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(21),

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Column(
            children: [

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: Image.asset(
                    category.image,
                    width: double.infinity,
                    fit: BoxFit.cover,

                    errorBuilder: (_, __, ___) {
                      return const Center(
                        child: Icon(
                          Icons.image_rounded,
                          size: 55,
                          color: Color(0xFFB8BDCC),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 9),

              Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF20243A),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                category.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF74788D),
                ),
              ),

              const SizedBox(height: 4),

              const Icon(
                Icons.arrow_forward_rounded,
                size: 19,
                color: Color(0xFF5B5FEF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}