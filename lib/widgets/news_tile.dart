import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articlesModel});

  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),

            child: Image.network(
              articlesModel.image ?? "",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/placeholder.png');
              },
            ),
            // child:articlesModel.image != null ?
            // Image.network(
            //   articlesModel.image!,
            //   height: 200,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            // ):Image.network(
            //   'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            //   height: 200,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            // ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articlesModel.title ?? 'No Title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articlesModel.subTitle ?? 'No SubTitle',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
