import 'package:flutter/material.dart';

class Dummydb {
  static List<Map<String, dynamic>> fitnessProducts = [
    {
      'id': 1,
      'title': 'Creatine Monohydrate',
      'price': 999,
      'image':
          'https://th.bing.com/th/id/OIP.fTrItb0iqUrVKmjXGN-7nQHaHa?w=201&h=201&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Creatine Monohydrate is designed to help increase muscle mass, improve strength, and enhance performance.',
      'rating': 4.5,
      'category': 'Supplements',
    },
    {
      'id': 2,
      'title': 'Whey Protein Powder',
      'price': 4000,
      'image': 'https://m.media-amazon.com/images/I/81dRcLo4MwL._SL1500_.jpg',
      'description':
          'A premium whey protein powder for muscle recovery and growth, packed with essential amino acids.',
      'rating': 4.8,
      'category': 'Supplements',
    },
    {
      'id': 3,
      'title': 'BCAA Powder',
      'price': 1299,
      'image':
          'https://th.bing.com/th/id/R.6683a531f07c490949b3076fa8c7f245?rik=D4KIopyFuggtbQ&riu=http%3a%2f%2fecx.images-amazon.com%2fimages%2fI%2f51nfIk5GvJL.jpg&ehk=Sf6XwtQO%2fOUtF3ubxU84owzvcbQk1IBWJGxoGCNHv88%3d&risl=&pid=ImgRaw&r=0',
      'description':
          'BCAA powder helps reduce muscle soreness, improves recovery time, and boosts endurance during workouts.',
      'rating': 4.3,
      'category': 'Supplements',
    },
    {
      'id': 4,
      'title': 'Pre-Workout Booster',
      'price': 499,
      'image':
          'http://ts3.mm.bing.net/th?id=OIP.YVE7uleIXKsNCQ-6RoxR0QAAAA&pid=15.1',
      'description':
          'Pre-workout supplement designed to improve focus, increase energy levels, and enhance workout performance.',
      'rating': 4.6,
      'category': 'Energy Boosters',
    },
    {
      'id': 5,
      'title': 'Fish Oil Capsules',
      'price': 299,
      'image':
          'http://ts2.mm.bing.net/th?id=OIP.oPDvkrN1fCiKBb9BiqIRfwHaHa&pid=15.1',
      'description':
          'Rich in Omega-3 fatty acids, these capsules promote heart health, improve joint flexibility, and reduce inflammation.',
      'rating': 4.7,
      'category': 'Health Supplements',
    },
    {
      'id': 6,
      'title': 'Glutamine Powder',
      'price': 399,
      'image':
          'http://ts3.mm.bing.net/th?id=OIP.ANB0OSg4C7zDoJJLTYXM9QHaHa&pid=15.1',
      'description':
          'Glutamine helps in muscle recovery, reduces fatigue, and supports immune system function after intense workouts.',
      'rating': 4.2,
      'category': 'Supplements',
    },
    {
      'id': 7,
      'title': 'Casein Protein',
      'price': 2600,
      'image':
          'https://th.bing.com/th/id/OIP.uCJD_D7nDiJhPtZ3DfeSdwHaIG?w=182&h=201&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Casein protein provides slow-digesting protein that helps with overnight muscle recovery and growth.',
      'rating': 4.4,
      'category': 'Supplements',
    },
    {
      'id': 8,
      'title': 'Multivitamin Tablets',
      'price': 149,
      'image':
          'http://ts1.mm.bing.net/th?id=OIP.9vg0mirkvKKXu5RRGKjO3gHaOk&pid=15.1',
      'description':
          'Daily multivitamin tablets to support overall health, energy levels, and immune function.',
      'rating': 3.6,
      'category': 'Health Supplements',
    },
    // Additional 10 Fitness Products
    {
      'id': 9,
      'title': 'Beta-Alanine Powder',
      'price': 875,
      'image':
          'http://ts1.mm.bing.net/th?id=OIP.dtOJ-josX3nR5xWZlk1FoAHaHa&pid=15.1',
      'description':
          'Enhance your endurance and reduce muscle fatigue with our high-quality Beta-Alanine powder.',
      'rating': 3.5,
      'category': 'Supplements',
    },
    {
      'id': 10,
      'title': 'Mass Gainer',
      'price': 1299,
      'image':
          'https://th.bing.com/th/id/OIP.VH7Dcz2sUqHdIZZHn6z3cwHaIq?w=182&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Increase your calorie intake and support muscle growth with our premium Mass Gainer formula.',
      'rating': 3.7,
      'category': 'Supplements',
    },
    {
      'id': 11,
      'title': 'L-Arginine Capsules',
      'price': 1625,
      'image':
          'https://th.bing.com/th/id/OIP.O9cflRGs2HcMaUz1yGeAUAHaLS?w=115&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Promote better blood flow and enhance workout performance with our L-Arginine capsules.',
      'rating': 4.3,
      'category': 'Supplements',
    },
    {
      'id': 12,
      'title': 'Electrolyte Powder',
      'price': 399,
      'image':
          'http://ts4.mm.bing.net/th?id=OIP.A34LPmm6GXc5IZ7pO8JztgHaHa&pid=15.1',
      'description':
          'Stay hydrated and replenish essential electrolytes lost during intense exercise with our electrolyte powder.',
      'rating': 4.4,
      'category': 'Hydration',
    },
    {
      'id': 13,
      'title': 'Vitamin D3 Supplements',
      'price': 399,
      'image':
          'https://th.bing.com/th/id/OIP.zhM4QLY-oI6M2FJBLawFBQHaHa?w=210&h=210&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Support bone health and immune function with our high-potency Vitamin D3 supplements.',
      'rating': 4.6,
      'category': 'Health Supplements',
    },
    {
      'id': 14,
      'title': 'Green Tea Extract',
      'price': 499,
      'image':
          'https://th.bing.com/th/id/OIP.0tTTPjcl8fAfk6UWhdh0wAHaQb?w=115&h=211&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Boost your metabolism and support fat loss with our concentrated Green Tea Extract.',
      'rating': 4.5,
      'category': 'Fat Burners',
    },
    {
      'id': 15,
      'title': 'ZMA Capsules',
      'price': 899,
      'image':
          'https://th.bing.com/th/id/OIP.lkG09mwaAEXjyBKno5gJgQHaHa?w=178&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Enhance muscle recovery and improve sleep quality with our ZMA supplement capsules.',
      'rating': 4.2,
      'category': 'Supplements',
    },
    {
      'id': 16,
      'title': 'Ashwagandha Powder',
      'price': 499,
      'image':
          'https://th.bing.com/th/id/OIP.sYMPw6UR7N4HSBYndlB9MQHaHa?w=215&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Reduce stress and improve overall well-being with our pure Ashwagandha powder.',
      'rating': 4.4,
      'category': 'Herbal Supplements',
    },
    {
      'id': 17,
      'title': 'CLA Softgels',
      'price': 499,
      'image':
          'https://th.bing.com/th/id/OIP.uimQwWNCZ0ghdJUG7dW8yAHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Support fat metabolism and muscle retention with our Conjugated Linoleic Acid (CLA) softgels.',
      'rating': 4.3,
      'category': 'Fat Burners',
    },
    {
      'id': 18,
      'title': 'Turmeric Curcumin',
      'price': 399,
      'image':
          'https://th.bing.com/th/id/OIP.cTRfaGzRACZpUimPwWBynQHaHa?w=194&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'description':
          'Combat inflammation and support joint health with our high-absorption Turmeric Curcumin capsules.',
      'rating': 4.5,
      'category': 'Health Supplements',
    }
  ];
  static Widget buildStarRating(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Colors.amber,
        size: 16,
      ));
    }

    // Add half star if needed
    if (hasHalfStar) {
      stars.add(const Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 16,
      ));
    }

    // Add empty stars to make up to 5 stars
    while (stars.length < 5) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 16,
      ));
    }

    return Row(
      children: stars,
      mainAxisSize: MainAxisSize.min,
    );
  }

  static List<Map<String, dynamic>> cardioWorkouts = [
    {
      'workoutName': 'Jumping Jacks',
      'reps': 'x30',
      'time': '45s',
      'image':
          'https://4.bp.blogspot.com/-jWrahmsX1qo/VpsHYmGsjRI/AAAAAAAAAlA/N8b0MlYvN2s/s400/jumping-jacks-exercise-illustration.jpg',
      'video': 'https://youtu.be/yDSMdd8hiFg?si=hZ_1gDMDbmaY9bsY',
    },
    {
      'workoutName': 'High Knees',
      'reps': 'x30',
      'time': '60s',
      'image':
          'https://th.bing.com/th/id/OIP.t3itanAra5lasrSSr9aCDgHaE8?w=256&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/DfjpR6dzLVg?si=1ivByAj3H6EIPtxU',
    },
    {
      'workoutName': 'Mountain Climbers',
      'reps': 'x20',
      'time': '60s',
      'image':
          'https://th.bing.com/th/id/OIP.bKACI08iUIz6p_cmjTsLdwHaE8?w=269&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/kLh-uczlPLg?si=GTKJOcw1uzs4kO_q',
    },
    {
      'workoutName': 'Burpees',
      'reps': 'x15',
      'time': '120s',
      'image':
          'https://th.bing.com/th/id/OIP.LtZhcMbkjo8CL6C4AM-EkgHaE8?w=262&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/xQdyIrSSFnE?si=8WEcuJxYn686fNS_',
    },
    {
      'workoutName': 'Rest',
      'time': '1 min',
      'image':
          'https://c8.alamy.com/comp/2B20TFE/woman-resting-after-fitness-workout-with-towel-arounfd-her-neck-isolated-over-white-2B20TFE.jpg',
      'video': 'https://youtu.be/PUJpU6Ti5jU?si=Vdf8PE2mYkyhfWh8',
    },
    {
      'workoutName': 'Squat Jumps',
      'reps': 'x20',
      'time': '120s',
      'image':
          'https://i.pinimg.com/originals/78/18/fb/7818fb12ebca780b1c68af585587e5af.png',
      'video': 'https://youtu.be/BRfxI2Es2lE?si=pn0_xXW3Ee8xmLTa',
    },
    {
      'workoutName': 'Butt Kicks',
      'reps': 'x30',
      'time': '180s',
      'image':
          'https://th.bing.com/th/id/OIP.Ld0GEof5RkMwis8GTcQn1QHaE8?w=266&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/lVZi-AwxLPo?si=LZnWHy2aKuBOQCOR',
    },
    {
      'workoutName': 'Skater Jumps',
      'reps': 'x20',
      'time': '180s',
      'image':
          'https://th.bing.com/th/id/OIP.FcDV1HdOxewLEEVrjQyFGQHaE8?rs=1&pid=ImgDetMain',
      'video': 'https://youtu.be/Xz27DudBfSs?si=L3Xd-zYf4K9ZfSi9',
    },
    {
      'workoutName': 'Plank Jacks',
      'reps': 'x20',
      'time': '120s',
      'image':
          'https://th.bing.com/th/id/OIP.kEMNSOf3e15S89e16CPDjgAAAA?w=286&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/8Do3ssZ23Mc?si=MbqLvn0bZrW_Laxq',
    },
    {
      'workoutName': 'Rest',
      'time': '1 min',
      'image':
          'https://c8.alamy.com/comp/2B20TFE/woman-resting-after-fitness-workout-with-towel-arounfd-her-neck-isolated-over-white-2B20TFE.jpg',
      'video': 'https://youtu.be/PUJpU6Ti5jU?si=Vdf8PE2mYkyhfWh8',
    },
    {
      'workoutName': 'Lunges',
      'reps': 'x20',
      'time': '120s',
      'image':
          'https://th.bing.com/th/id/OIP.A4MCcCIlnZW7kYIZXU50tQAAAA?rs=1&pid=ImgDetMain',
      'video': 'https://youtu.be/tTej-ax9XiA?si=EpjhBYSoxHxWbeUN',
    },
    {
      'workoutName': 'Tuck Jumps',
      'reps': 'x15',
      'time': '60s',
      'image':
          'https://thumbs.dreamstime.com/z/man-doing-knee-tuck-jumps-exercise-flat-vector-man-doing-knee-tuck-jumps-exercise-flat-vector-illustration-isolated-white-249927458.jpg',
      'video': 'https://youtu.be/mgBCOVR1hqw?si=ZPuRNDj3CQuhRsk_',
    },
    {
      'workoutName': 'Push-Up Jacks',
      'reps': 'x15',
      'time': '60s',
      'image':
          'https://4.bp.blogspot.com/-jWrahmsX1qo/VpsHYmGsjRI/AAAAAAAAAlA/N8b0MlYvN2s/s400/jumping-jacks-exercise-illustration.jpg',
      'video': 'https://youtu.be/8uqIred6RkQ?si=NY8RqhDL93LMzrD4',
    },
    {
      'workoutName': 'Jump Rope',
      'reps': 'x50',
      'time': '120s',
      'image':
          'https://th.bing.com/th/id/OIP.02cmyNgyTIavifnA0z5JuAHaE8?rs=1&pid=ImgDetMain',
      'video': 'https://youtu.be/wqN5bRkZPK0?si=Om62xdIG28kyJt43',
    },
  ];
  static List<Map<String, dynamic>> gymWorkouts = [
    {
      'workoutName': 'Bench Press',
      'reps': 'x10',
      'sets': 'x4',
      'image':
          'https://th.bing.com/th/id/OIP.sLxgIwv5eBD-KBnEDfwywwHaEK?w=300&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/ptpmRrzRtWQ?si=PNA9xF01Txh-qykw',
      'timePerSet': 60, // seconds
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Squat',
      'reps': 'x10',
      'sets': 'x4',
      'image':
          'https://th.bing.com/th/id/OIP.M_NwN_mksvQhPKYqHMKR0gHaH_?w=1000&h=1080&rs=1&pid=ImgDetMain',
      'video': 'https://youtu.be/YaXPRqUwItQ?si=qSElMy9PZiPG8d9Y',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Overhead Press',
      'reps': 'x8',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.uPsnx3EifISInJkv8nwLkwHaEo?w=298&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/QAQ64hK4Xxs?si=hUA9wpqbbe79iEST',
      'timePerSet': 45,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Barbell Row',
      'reps': 'x10',
      'sets': 'x4',
      'image':
          'https://static.vecteezy.com/system/resources/previews/023/166/864/original/man-doing-the-pendlay-barbell-row-bent-over-barbell-rows-from-floor-flat-vector.jpg',
      'video': 'https://youtu.be/FWJR5Ve8bnQ?si=5oHgb12Cse6VCMhp',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Dumbbell Lunges',
      'reps': 'x12',
      'sets': 'x3',
      'image':
          'https://thumbs.dreamstime.com/b/man-doing-dumbbell-lunges-vector-set-workout-icons-flat-style-isolated-white-background-man-doing-dumbbell-lunges-vector-198695566.jpg',
      'video': 'https://youtu.be/BvnVtpQkrHE?si=JP45LaFrKkznsYz8',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Pull-Ups',
      'reps': 'x8',
      'sets': 'x4',
      'image':
          'https://th.bing.com/th/id/OIP.RaspLunIOFMAw6IWvcbiaAHaE9?w=248&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/999m6iULT2g?si=pD5DpjblSB52v-Mx',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Leg Press',
      'reps': 'x12',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.xrqj8EgWRn2pQnexSxkv6AHaE8?w=240&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtube.com/shorts/wa9UCsNWVo0?si=-QWF0-_sUfZlHVfV',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Dumbbell Shoulder Press',
      'reps': 'x10',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.36qntTswUkXuDd-NSdSACAHaE8?w=274&h=183&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtube.com/shorts/4GkqruTC3F4?si=zGjtc3YM2LfRq4N1',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Lat Pulldown',
      'reps': 'x10',
      'sets': 'x4',
      'image':
          'https://th.bing.com/th/id/OIP.u1KOl33IRTM59BuvCNtGrAHaE8?w=272&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/SALxEARiMkw?si=sucndCMO8GsHu67F',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Chest Fly',
      'reps': 'x12',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.eqIezeEarnBAQ_0jhafacgHaEX?w=267&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtube.com/shorts/Jz7oEmzhnfE?si=_p7Rp_tdB3PSmh77',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Bicep Curl',
      'reps': 'x12',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.416EeRangvExSPqTB-EJvQHaE8?w=248&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'video': 'https://youtu.be/sYV-ki-1blM?si=HmlQyHcsx-XXJnNW',
      'timePerSet': 40,
      'caloriesPerMinute': 8.0,
    },
    {
      'workoutName': 'Tricep Dips',
      'reps': 'x12',
      'sets': 'x4',
      'image':
          'https://thumbs.dreamstime.com/z/man-doing-bench-triceps-dips-workout-exercise-guide-colorful-concept-guy-working-his-home-illustration-male-fitness-using-230814542.jpg',
      'video': 'https://youtu.be/6kALZikXxLc?si=XBtgWcIweNy7MyY4',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
    },
  ];
  static List<Map<String, dynamic>> strengthWorkouts = [
    {
      'workoutName': 'Deadlift',
      'reps': 'x5',
      'sets': 'x5',
      'image':
          'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1dRhdy.img',
      'timePerSet': 90,
      'caloriesPerMinute': 9.0,
      'video': 'https://youtu.be/XxWcirHIwVo?si=aKetFjHNW-Uvr0bq',
    },
    {
      'workoutName': 'Weighted Pull-Ups',
      'reps': 'x6',
      'sets': 'x4',
      'image':
          'data:image/jpeg;base64,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',
      'timePerSet': 60,
      'caloriesPerMinute': 8.5,
      'video': 'https://youtube.com/shorts/voVUE21ThBk?si=73JIz8LoNvxeRfLa',
    },
    {
      'workoutName': 'Barbell Squat',
      'reps': 'x5',
      'sets': 'x5',
      'image':
          'https://th.bing.com/th/id/OIP.SFRvRpCPAwOIEWhsAXZ_QgHaDw?w=340&h=177&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'timePerSet': 90,
      'caloriesPerMinute': 9.0,
      'video': 'https://youtu.be/gcNh17Ckjgg?si=6KSb6Sn0jDTZvM-c',
    },
    {
      'workoutName': 'Bench Press',
      'reps': 'x5',
      'sets': 'x5',
      'image':
          'https://th.bing.com/th/id/OIP.sLxgIwv5eBD-KBnEDfwywwHaEK?w=300&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
      'video': 'https://youtu.be/4Y2ZdHCOXok?si=Yokf3ue_S9sZGrgn',
    },
    {
      'workoutName': 'Incline Bench Press',
      'reps': 'x8',
      'sets': 'x4',
      'image':
          'https://static.vecteezy.com/system/resources/previews/008/424/328/original/bench-press-exercise-man-with-muscles-coach-in-the-gym-isolated-illustration-on-white-background-vector.jpg',
      'timePerSet': 60,
      'caloriesPerMinute': 8.0,
      'video': 'https://youtu.be/lJ2o89kcnxY?si=XxbhV58-hzuQNqMK',
    },
    {
      'workoutName': 'Bent-Over Row',
      'reps': 'x6',
      'sets': 'x4',
      'image':
          'https://static.vecteezy.com/system/resources/previews/015/708/460/non_2x/man-doing-dumbbell-bent-over-rows-exercise-flat-illustration-isolated-on-white-background-vector.jpg',
      'timePerSet': 60,
      'caloriesPerMinute': 8.5,
      'video': 'https://youtube.com/shorts/Nqh7q3zDCoQ?si=B0oksSAlSCi7b8kd',
    },
    {
      'workoutName': 'Standing Military Press',
      'reps': 'x5',
      'sets': 'x5',
      'image':
          'https://cdn.shopify.com/s/files/1/0269/5551/3900/files/Standing-Barbell-Shoulder-Press_600x600.png?v=1619977694',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
      'video': 'https://youtu.be/z7YJnyW_maY?si=OdtXci105TDmhd6K',
    },
    {
      'workoutName': 'Barbell Shrugs',
      'reps': 'x10',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.-9GRwMTEPfBBlCx1bT6amQHaE8?w=253&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'timePerSet': 45,
      'caloriesPerMinute': 8.0,
      'video': 'https://youtube.com/shorts/zdBh_Ul2psI?si=2A0qjjXarghYuJCW',
    },
    {
      'workoutName': 'Romanian Deadlift',
      'reps': 'x8',
      'sets': 'x4',
      'image':
          'https://cdn.squats.in/kc_articles/16571102077374a71d5ee0a3c6b03.png',
      'timePerSet': 60,
      'caloriesPerMinute': 8.5,
      'video': 'https://youtu.be/7j-2w4-P14I?si=wk-oA_96qMav4L2N',
    },
    {
      'workoutName': "Farmer's Walk",
      'reps': 'x40 meters',
      'sets': 'x3',
      'image':
          'https://th.bing.com/th/id/OIP.CG2U4S-DXNxMKrkHiJFnPAHaEt?w=259&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'timePerSet': 120,
      'caloriesPerMinute': 9.0,
      'video': 'https://youtu.be/8OtwXwrJizk?si=791of040A3z0Sh9_',
    },
    {
      'workoutName': 'Weighted Dips',
      'reps': 'x8',
      'sets': 'x4',
      'image':
          'https://th.bing.com/th/id/OIP.eFJkxRzcs6NkgngpQewGvgHaFb?w=205&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'timePerSet': 50,
      'caloriesPerMinute': 8.0,
      'video': 'https://youtu.be/4NkbSXfqMQk?si=-idNpYaMVZpiR25d',
    },
    {
      'workoutName': 'Overhead Squat',
      'reps': 'x6',
      'sets': 'x4',
      'image':
          'https://thumbs.dreamstime.com/b/man-doing-dumbbell-squat-thrusters-squat-to-overhead-press-exercise-flat-vector-man-doing-dumbbell-squat-thrusters-squat-to-273993889.jpg',
      'timePerSet': 60,
      'caloriesPerMinute': 8.5,
      'video': 'https://youtu.be/7dazkuWGOa8?si=i_YoKnuXXTmOYlZy',
    },
  ];
  static List<Map<String, dynamic>> diets = [
    // Weight Gain Diet
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
      "dinner": {"meal": "Salmon with quinoa and vegetables", "calories": 700}
    },

    // Extreme Weight Gain Diet
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
      }
    },

    // Weight Loss Diet
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
      "dinner": {"meal": "Baked cod with steamed veggies", "calories": 500}
    },

    // Extreme Weight Loss Diet
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
      }
    },

    // Maintaining Weight Diet
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
      }
    },

    // Balanced Diet
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
      }
    }
  ];
}
