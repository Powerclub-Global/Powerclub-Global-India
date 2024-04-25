import 'package:flutter/material.dart';
import 'package:pcg/widgets/blog_box.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Championing the Bold to Achieve the Extraordinary",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            "See how we have helped ambitious clients achieve extraordinary outcomes",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          isDesktop
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlogBox(
                        title: "Sample Title",
                        description:
                            "This is a brief description written longer to test how it acts if its long",
                        image: "assets/sample_image.jpeg",
                        tag: "Industry Tag",
                        content:
                            "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",
                      ), // Assuming BlogBox is a widget you've defined
                      SizedBox(width: 30),
                      BlogBox(
                        title: "Sample Title",
                        description:
                            "This is a brief description written longer to test how it acts if its long",
                        image: "assets/sample_image.jpeg",
                        tag: "Industry Tag",
                        content:
                            "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",
                      ),
                    ],
                  ),
                )
              : const Column(
                  children: [
                    BlogBox(
                      title: "Sample Title",
                      description:
                          "This is a brief description written longer to test how it acts if its long",
                      image: "assets/sample_image.jpeg",
                      tag: "Industry Tag",
                      content:
                          "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",
                    ),
                    SizedBox(height: 16),
                    BlogBox(
                      title: "Sample Title",
                      description:
                          "This is a brief description written longer to test how it acts if its long",
                      image: "assets/sample_image.jpeg",
                      tag: "Industry Tag",
                      content:
                          "This is Sample content its written in a way to test how this acts if the Text is Long and screen is short",
                    ),
                  ],
                ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Define what happens when the button is pressed
              // For example, navigate to a page showing client results
              Navigator.of(context)
                  .pushNamed('/clientsResults'); // Adjust the route as needed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFFB4914C), // Background color of the button
              foregroundColor: Colors.white, // Text color of the button
            ),
            child: const Text('See our Clients Results'),
          ),
        ],
      ),
    );
  }
}
