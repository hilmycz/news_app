// build_national_news.dart

import 'package:cenw_app/constant/theme.dart';
import 'package:cenw_app/models/national_news_model.dart';
import 'package:cenw_app/pages/news_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildNationalNews extends StatelessWidget {
  final NationalNewsModel berita;
  const BuildNationalNews({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: (berita.posts ?? []).map((news) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(link: news.link ?? ''),
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
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(news.thumbnail ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          news.title ?? '',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              berita.title ?? '',
                              style: lightGreyTextStyle.copyWith(
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: lightGreyColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              formatDate(news.pubDate.toString()),
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
