import 'package:calculator_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryGreen,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'MY RESULT',
                style: TextStyle(color: AppColors.primaryWhite),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('summary')),
            ],
          ),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            children: [
              const ResultDetails(
                title: 'Academic Level',
                result: '100 level',
              ),
              const ResultDetails(
                title: 'Academic Session',
                result: '72 x 18',
              ),
              const ResultDetails(
                title: 'Total number of courses',
                result: '7',
              ),
              const ResultDetails(
                title: 'Total Credit Unit',
                result: '21',
              ),
              const ResultDetails(
                title: 'Total Grade Point',
                result: '387',
              ),
              const SizedBox(height: 30),
              Container(
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(12)),
                child: const Column(
                  children: [
                    Text('Your GPA is'),
                    Divider(
                      color: Colors.grey,
                    ),
                    Text('4.73'),
                    Text('You are a first class champ 😃'),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ResultDetails extends StatelessWidget {
  const ResultDetails({
    super.key,
    required this.title,
    required this.result,
  });
  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(result,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
