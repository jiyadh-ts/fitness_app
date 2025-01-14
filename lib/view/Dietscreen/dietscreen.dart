// lib/screens/dietscreen.dart
import 'package:fitness_app/view/Dietscreen/dietboxscreen/dietboxscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fitness_app/model/dietmodel.dart';
// import 'package:fitness_app/screens/dietboxscreen.dart';

class Dietscreen extends StatefulWidget {
  const Dietscreen({super.key});

  @override
  State<Dietscreen> createState() => _DietscreenState();
}

class _DietscreenState extends State<Dietscreen> {
  // Dummy diet database
  final List<Map<String, dynamic>> diets = [
    {
      "id": 1,
      "type": "Weight Gain",
      "breakfast": {
        "meal": "Oatmeal with banana and peanut butter",
        "calories": 350
      },
      "lunch": {
        "meal": "Grilled chicken sandwich with avocado",
        "calories": 600
      },
      "dinner": {"meal": "Salmon with quinoa and vegetables", "calories": 700},
    },
    {
      "id": 2,
      "type": "Extreme Weight Gain",
      "breakfast": {
        "meal": "Pancakes with maple syrup and scrambled eggs",
        "calories": 700
      },
      "lunch": {
        "meal": "Double cheeseburger with sweet potato fries",
        "calories": 1200
      },
      "dinner": {
        "meal": "Steak with mashed potatoes and buttered broccoli",
        "calories": 1000
      },
    },
    {
      "id": 3,
      "type": "Weight Loss",
      "breakfast": {
        "meal": "Greek yogurt with berries and almonds",
        "calories": 250
      },
      "lunch": {
        "meal": "Grilled chicken salad with olive oil dressing",
        "calories": 400
      },
      "dinner": {"meal": "Baked cod with steamed veggies", "calories": 500},
    },
    {
      "id": 4,
      "type": "Extreme Weight Loss",
      "breakfast": {
        "meal": "Smoothie with spinach, apple, and protein powder",
        "calories": 180
      },
      "lunch": {
        "meal": "Grilled turkey wrap with lettuce and tomato",
        "calories": 300
      },
      "dinner": {
        "meal": "Grilled tofu with cauliflower rice and green beans",
        "calories": 350
      },
    },
    {
      "id": 5,
      "type": "Maintaining Weight",
      "breakfast": {
        "meal": "Whole grain toast with avocado and poached egg",
        "calories": 300
      },
      "lunch": {
        "meal": "Chicken wrap with mixed greens and hummus",
        "calories": 500
      },
      "dinner": {
        "meal": "Grilled salmon with brown rice and vegetables",
        "calories": 600
      },
    },
    {
      "id": 6,
      "type": "Balanced Diet",
      "breakfast": {
        "meal": "Fruit smoothie with oats and almond milk",
        "calories": 250
      },
      "lunch": {
        "meal": "Quinoa bowl with chickpeas and avocado",
        "calories": 450
      },
      "dinner": {
        "meal": "Stir-fried chicken with mixed vegetables and rice",
        "calories": 550
      },
    },
  ];

  String selectedGoal = '';
  Map<String, dynamic> selectedDiet = {};
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  // Add controllers for new fields if needed
  late Box<Dietmodel> dietBox;

  @override
  void initState() {
    super.initState();
    dietBox = Hive.box<Dietmodel>('dietBox');
  }

  @override
  void dispose() {
    _weightController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _getDiet() {
    // You can utilize age and height here if needed
    // For now, it selects diet based on the selected goal
    final diet = diets.firstWhere(
      (diet) => diet['type'] == selectedGoal,
      orElse: () => {},
    );

    if (diet.isNotEmpty) {
      setState(() {
        selectedDiet = diet;
      });
    } else {
      setState(() {
        selectedDiet = {};
      });
      // Optionally, show a snackbar or message if no diet is found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No suitable diet found for the selected goal.')),
      );
    }
  }

  void addSelectedDietToBox() {
    if (selectedDiet.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No diet selected to add.')),
      );
      return;
    }

    // Check if the diet is already in the box
    final existingDiet = dietBox.values.firstWhere(
      (item) => item.id == selectedDiet['id'],
      orElse: () => Dietmodel(),
    );

    if (existingDiet.id != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '${selectedDiet['type']} is already added to your diet plan.')),
      );
    } else {
      // Add new diet
      dietBox.add(Dietmodel(
        id: selectedDiet['id'],
        type: selectedDiet['type'],
        breakfastMeal: selectedDiet['breakfast']['meal'],
        breakfastCalories: selectedDiet['breakfast']['calories'],
        lunchMeal: selectedDiet['lunch']['meal'],
        lunchCalories: selectedDiet['lunch']['calories'],
        dinnerMeal: selectedDiet['dinner']['meal'],
        dinnerCalories: selectedDiet['dinner']['calories'],
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('${selectedDiet['type']} added to your diet plan.')),
      );
    }
  }

  Widget _buildDietDetails() {
    // Calculate total calories
    int totalCalories = (selectedDiet['breakfast']['calories'] ?? 0) +
        (selectedDiet['lunch']['calories'] ?? 0) +
        (selectedDiet['dinner']['calories'] ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Diet Type
        Text(
          'Diet Type: ${selectedDiet['type']}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // List of Meals
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Breakfast
            const ListTile(
              title: Text(
                'Breakfast',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.breakfast_dining),
            ),
            ListTile(
              title: Text(selectedDiet['breakfast']['meal']),
              subtitle:
                  Text('${selectedDiet['breakfast']['calories']} calories'),
              leading: const Icon(Icons.fastfood),
            ),
            const Divider(),

            // Lunch
            const ListTile(
              title: Text(
                'Lunch',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.lunch_dining),
            ),
            ListTile(
              title: Text(selectedDiet['lunch']['meal']),
              subtitle: Text('${selectedDiet['lunch']['calories']} calories'),
              leading: const Icon(Icons.fastfood),
            ),
            const Divider(),

            // Dinner
            const ListTile(
              title: Text(
                'Dinner',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.dinner_dining),
            ),
            ListTile(
              title: Text(selectedDiet['dinner']['meal']),
              subtitle: Text('${selectedDiet['dinner']['calories']} calories'),
              leading: const Icon(Icons.fastfood),
            ),
            const Divider(),
          ],
        ),
        const SizedBox(height: 10),
        // Total Calories
        Text(
          'Total Calories: $totalCalories',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Water Intake Reminder
        const Text(
          '💧 Remember to drink at least 3 liters of water daily!',
          style: TextStyle(fontSize: 16, color: Colors.blueAccent),
        ),
        const SizedBox(height: 20),
        // Add to Diet Plan Button
        Center(
          child: ElevatedButton.icon(
            onPressed: addSelectedDietToBox,
            icon: const Icon(Icons.add),
            label: const Text('Add to Diet Plan'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
            ),
          ),
        ),
        SizedBox(height:20),
      ],
    );
  }

  void _showDietForm() {
    // Additional controllers
    final TextEditingController _ageController = TextEditingController();
    final TextEditingController _heightController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Get Your Diet Plan'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey, // To validate the form
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Weight Input
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter your weight (kg)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Age Input
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter your age',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Height Input
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter your height (cm)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Goal Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedGoal.isNotEmpty ? selectedGoal : null,
                    hint: const Text('Select your goal'),
                    items: [
                      'Weight Gain',
                      'Extreme Weight Gain',
                      'Weight Loss',
                      'Extreme Weight Loss',
                      'Maintaining Weight',
                      'Balanced Diet'
                    ]
                        .map((goal) => DropdownMenuItem(
                              value: goal,
                              child: Text(goal),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGoal = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a goal';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Clear all fields if needed
                _weightController.clear();
                _ageController.clear();
                _heightController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate inputs
                if (_formKey.currentState!.validate()) {
                  // You can add further validation if needed
                  _getDiet();
                  Navigator.of(context).pop();
                } else {
                  // Show error message or highlight fields
                }
              },
              child: const Text('Get Diet'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Planner'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: 'View Diet Plan',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DietBoxScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Introductory Texts and Elements
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome to Your Personalized Diet Planner!',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Achieve your health and fitness goals with our tailored diet plans. Whether you aim to gain weight, lose weight, or maintain your current physique, we have the perfect plan for you.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                Align(
                  alignment:Alignment.center,
                    child: Icon(
                      Icons.restaurant_menu,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              // Get Diet Button
              ElevatedButton(
                onPressed: _showDietForm,
                child: const Text('Get Diet'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Display Diet Details if selected
              if (selectedDiet.isNotEmpty) _buildDietDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
