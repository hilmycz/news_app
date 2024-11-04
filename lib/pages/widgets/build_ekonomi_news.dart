import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cenw_app/constans/theme.dart';
import 'package:cenw_app/models/ekonomi_news_model.dart';
import 'package:cenw_app/pages/news_detail.dart';

class BuildEkonomiNews extends StatelessWidget {
  final EkonomiNewsModel news;
  const BuildEkonomiNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: (news.posts ?? []).map((ekonomi) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewDetailpage(link: ekonomi.link ?? ''),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(ekonomi.thumbnail ?? ''),
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ekonomi.title ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              (news.title?.split(" - ").last ?? ''),
                              style: lightGreyTextStyle.copyWith(
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: lightGreyColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              formatDate(ekonomi.pubDate.toString()),
                              style: lightGreyTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMMM, dd', 'id_ID').format(dateTime);
  }
}