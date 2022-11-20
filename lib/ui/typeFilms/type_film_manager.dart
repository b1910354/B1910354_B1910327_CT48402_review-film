import 'package:ct48402/models/type_film.dart';
import 'package:flutter/material.dart';

import '../../models/film.dart';

class TypeFilmManager with ChangeNotifier {
  final List<TypeFilm> _types = [
    TypeFilm(
      id: '1',
      name: 'Anime',
      films: [
        Film(
          id: '1',
          name: 'One Piece Chapter 1065',
          title:
              'One Piece Chap 1065 tiết lộ danh tính thật sự của Dr. Vegapunk',
          writer: 'KEYONE',
          pubDate: '2022-11-14',
          lastDate: '2022-11-14',
          description:
              'Chương 1065 của One Piece cuối cùng đã tiết lộ danh tính của Tiến sĩ Vegapunk đồng thời cũng sẽ gây sốc cho người xem.',
          content:
              'Chương 1064 của One Piece mang đến cho người xem nhiều thông tin khá quan trọng trong chuyến hành trình mới của mình. Trang sức Bonney cuối cùng đã thú nhận danh tính thực sự của mình và mối quan hệ với Bartholomew Kuma cho Luffy và băng đảng. Trong khi đó, Franky và các thành viên băng Mũ Rơm khác đang nhận chuyến du lịch từ không ai khác ngoài Lilith The Evil. Vệ tinh Vegapunk đang cung cấp cho họ lời giải thích sâu sắc về các cơ sở và vị trí của hòn đảo. Nơi trên những đám mây, trông giống như một hòn đảo trên bầu trời, được gọi là Labophase. Đó là nơi tất cả các nghiên cứu xảy ra, trong khi khu vực mà Luffy và Bonney đang tàn phá được gọi là Fabriophase. Là nơi tập trung các khu nhà ở, nhà máy của công nhân. Trong khi Lilith đưa băng Mũ Rơm đi tham quan, Shaka nhận được một cuộc gọi từ Dragon. Anh ta tiết lộ với người đứng đầu Quân đội Cách mạng về khả năng cái chết của anh ta sắp xảy ra.',
          // isFavorite: true,
          imageUrl: "https://truyenvua.com/128/fix-1065/1.jpg",
          type: "Anime",
        ),
        Film(
          id: '1',
          name: 'One Piece Chapter 1065',
          title:
              'One Piece Chap 1065 tiết lộ danh tính thật sự của Dr. Vegapunk',
          writer: 'KEYONE',
          pubDate: '2022-11-14',
          lastDate: '2022-11-14',
          description:
              'Chương 1065 của One Piece cuối cùng đã tiết lộ danh tính của Tiến sĩ Vegapunk đồng thời cũng sẽ gây sốc cho người xem.',
          content:
              'Chương 1064 của One Piece mang đến cho người xem nhiều thông tin khá quan trọng trong chuyến hành trình mới của mình. Trang sức Bonney cuối cùng đã thú nhận danh tính thực sự của mình và mối quan hệ với Bartholomew Kuma cho Luffy và băng đảng. Trong khi đó, Franky và các thành viên băng Mũ Rơm khác đang nhận chuyến du lịch từ không ai khác ngoài Lilith The Evil. Vệ tinh Vegapunk đang cung cấp cho họ lời giải thích sâu sắc về các cơ sở và vị trí của hòn đảo. Nơi trên những đám mây, trông giống như một hòn đảo trên bầu trời, được gọi là Labophase. Đó là nơi tất cả các nghiên cứu xảy ra, trong khi khu vực mà Luffy và Bonney đang tàn phá được gọi là Fabriophase. Là nơi tập trung các khu nhà ở, nhà máy của công nhân. Trong khi Lilith đưa băng Mũ Rơm đi tham quan, Shaka nhận được một cuộc gọi từ Dragon. Anh ta tiết lộ với người đứng đầu Quân đội Cách mạng về khả năng cái chết của anh ta sắp xảy ra.',
          // isFavorite: true,
          imageUrl: "https://truyenvua.com/128/fix-1065/1.jpg",
          type: "Anime",
        ),
        Film(
          id: '1',
          name: 'One Piece Chapter 1065',
          title:
              'One Piece Chap 1065 tiết lộ danh tính thật sự của Dr. Vegapunk',
          writer: 'KEYONE',
          pubDate: '2022-11-14',
          lastDate: '2022-11-14',
          description:
              'Chương 1065 của One Piece cuối cùng đã tiết lộ danh tính của Tiến sĩ Vegapunk đồng thời cũng sẽ gây sốc cho người xem.',
          content:
              'Chương 1064 của One Piece mang đến cho người xem nhiều thông tin khá quan trọng trong chuyến hành trình mới của mình. Trang sức Bonney cuối cùng đã thú nhận danh tính thực sự của mình và mối quan hệ với Bartholomew Kuma cho Luffy và băng đảng. Trong khi đó, Franky và các thành viên băng Mũ Rơm khác đang nhận chuyến du lịch từ không ai khác ngoài Lilith The Evil. Vệ tinh Vegapunk đang cung cấp cho họ lời giải thích sâu sắc về các cơ sở và vị trí của hòn đảo. Nơi trên những đám mây, trông giống như một hòn đảo trên bầu trời, được gọi là Labophase. Đó là nơi tất cả các nghiên cứu xảy ra, trong khi khu vực mà Luffy và Bonney đang tàn phá được gọi là Fabriophase. Là nơi tập trung các khu nhà ở, nhà máy của công nhân. Trong khi Lilith đưa băng Mũ Rơm đi tham quan, Shaka nhận được một cuộc gọi từ Dragon. Anh ta tiết lộ với người đứng đầu Quân đội Cách mạng về khả năng cái chết của anh ta sắp xảy ra.',
          // isFavorite: true,
          imageUrl: "https://truyenvua.com/128/fix-1065/1.jpg",
          type: "Anime",
        ),
      ],
    ),
    TypeFilm(
      id: '1',
      name: 'Anime',
      films: [
        Film(
          id: '1',
          name: 'One Piece Chapter 1065',
          title:
              'One Piece Chap 1065 tiết lộ danh tính thật sự của Dr. Vegapunk',
          writer: 'KEYONE',
          pubDate: '2022-11-14',
          lastDate: '2022-11-14',
          description:
              'Chương 1065 của One Piece cuối cùng đã tiết lộ danh tính của Tiến sĩ Vegapunk đồng thời cũng sẽ gây sốc cho người xem.',
          content:
              'Chương 1064 của One Piece mang đến cho người xem nhiều thông tin khá quan trọng trong chuyến hành trình mới của mình. Trang sức Bonney cuối cùng đã thú nhận danh tính thực sự của mình và mối quan hệ với Bartholomew Kuma cho Luffy và băng đảng. Trong khi đó, Franky và các thành viên băng Mũ Rơm khác đang nhận chuyến du lịch từ không ai khác ngoài Lilith The Evil. Vệ tinh Vegapunk đang cung cấp cho họ lời giải thích sâu sắc về các cơ sở và vị trí của hòn đảo. Nơi trên những đám mây, trông giống như một hòn đảo trên bầu trời, được gọi là Labophase. Đó là nơi tất cả các nghiên cứu xảy ra, trong khi khu vực mà Luffy và Bonney đang tàn phá được gọi là Fabriophase. Là nơi tập trung các khu nhà ở, nhà máy của công nhân. Trong khi Lilith đưa băng Mũ Rơm đi tham quan, Shaka nhận được một cuộc gọi từ Dragon. Anh ta tiết lộ với người đứng đầu Quân đội Cách mạng về khả năng cái chết của anh ta sắp xảy ra.',
          // isFavorite: true,
          imageUrl: "https://truyenvua.com/128/fix-1065/1.jpg",
          type: "Anime",
        ),
      ],
    ),
  ];

  int get typeFilmCount {
    return _types.length;
  }

  List<TypeFilm> get typeFilms {
    return [..._types];
  }
}
