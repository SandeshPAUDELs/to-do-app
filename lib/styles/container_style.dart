import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const DefaultListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          Text(subtitle,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ContainerStyle {
//   static Card todosContainer(BuildContext context, String titleText, String descriptionText, IconData icon, VoidCallback?  onTap) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   titleText,
//                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onSurface,
//                   ),
//                 ),
//                 Text(
//                   descriptionText,
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                     color: Theme.of(context).colorScheme.onSurface,
//                   ),
//                 ),
//               ],
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {

//               },
//             ),

//           ],
//         ),
//       ),
      
//     );

//   }
// }