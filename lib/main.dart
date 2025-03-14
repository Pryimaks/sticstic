import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticker Pack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: StickerPackScreen(),
    );
  }
}

class StickerPackScreen extends StatelessWidget {
  final List<String> stickers = const [
    'lib/assets/0kWWaoN-tYPuzceaJxmCrSfgXIkQY9JGLInFVepmNGk.png',
    'lib/assets/4mLBKuywWeAl-7lNGUm7g7fwcwyUNgfNVn0jS_hpK0g.png',
    'lib/assets/7lbsgFS82fQSOQ_uFCAmKa4neiJorUbtVXCV49FGNT8.png',
    'lib/assets/7ooZZ5SW8GHU5EXfJOj25jMy-bl1z1p161tDGGtyylM.png',
    'lib/assets/8kf2Ny9n8xVaUqkDYC8bxeW2fQv2jlG7mCBfPxsO3Pk.png',
    'lib/assets/8q-wZYYaZUnvwCJpk5QiK4eUuSSv0Hivyr1EKkqn47s.png',
    'lib/assets/9jf-x9neUd0ZW61cOU24AdJpDphoa34xXIlcr1UdlxQ.png',
    'lib/assets/15BaAqVtSB2YszdgOFHCdhItUc8pxwegtGdnVp5RR9A.png',
    'lib/assets/96dYNkxzbr3m_qcN9r2tJep53hZ4WXEyiap9Kr45fuA.png',
    'lib/assets/973NWy1LPx_WPthY7puJS_d3gBhgvA_DppB3gIhWrvQ.png',
    'lib/assets/ADNzSyvQTUYC3HwEDznG4-1L7HIL89vTjyRn2pp9DJk.png',
    'lib/assets/BvgKfHqIgU4ThU967qaVxTOLIKsPbTkaAJJeqa3Z4KA.png',
    'lib/assets/g8ai-IHefPO-t6fEOZB-sBy-GXNzLpWUoeZQ1hyBqXo.png',
    'lib/assets/gPJQKnjms2GESjIGaC6_PnALyFFAQpK5i_tLplEPF60.png',
    'lib/assets/j6ZnaKYruGgdV0rRWb_Qx8Qw-FmOO9wcxFDVekeSpCo.png',
    'lib/assets/NI4SK3fKuyhwAUYHtoQfaKyeoCmFMtkY62i4SBoakvI.png',
    'lib/assets/q99OKWkkDGjPAMVT1GF3zPaTH6qP9EyFrCh7N7F5KJo.png',
    'lib/assets/rhMk1tVF3re-JHera0jg5Wdkk7vSf0qaeR6UJsbfm9s.png',
    'lib/assets/s5zz-7teKvGh3Vlim6wyrH9Yuz3mYKNxWHK6sVkNm0U.png',
    'lib/assets/S7DqFNOWdHfgqq6mYRnlHefaZ4T_ByG8MZz1cq6DvM0.png',
    'lib/assets/sNTsJ684gMWwDR5Zv9kTFsN0rA_txCUf7oqPZdSUb6s.png',
    'lib/assets/UaF73v3WQyGvPDBnM1u0XvehWdJgqTBZnLw3hnBcnWk.png',
    'lib/assets/wOE_BjE_3ERc8An4jV8HurzufNb-SuRoDPamWNBp5oY.png',
    'lib/assets/ymBoc9IIggN-h813dLoz2PdWBN8Bhx1KGgW6jjPrb9A.png'
  ];

  StickerPackScreen({super.key});

  Future<void> _openUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не вдалося відкрити $url'))
      );
    }
  }

  void _showStickerDialog(BuildContext context, String stickerPath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(stickerPath, width: 120, height: 120),
                  const SizedBox(height: 10),
                  const Text(
                    'Цей стікер з пакунку: Хаку',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Ви можете завантажити цей стікер собі на ваш пристрій і використовувати в будь-яких цілях, але не забудьте вказати автора цього Стікерпака!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                    child: const Text('ЗАВАНТАЖИТИ', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 24, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                  Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'FREE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.purpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'lib/assets/0kWWaoN-tYPuzceaJxmCrSfgXIkQY9JGLInFVepmNGk.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.remove_red_eye, color: Colors.black, size: 20),
                                    SizedBox(width: 5),
                                    Text('148', style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.download, color: Colors.black, size: 20),
                                    SizedBox(width: 5),
                                    Text('149', style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Назва Стікерпака',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                        ),
                        const Text(
                          'Хаку',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const Text(
                          'Автор Стікерпака',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                        ),
                        Row(
                          children: List.generate(5, (_) => const Icon(Icons.star, color: Colors.yellow, size: 28)),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _openUrl('https://stickers.viber.com/pages/custom-sticker-packs/11ed8520beef975cb441434efe1d5d7ddbdfe61ff94790c7', context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Viber', style: TextStyle(color: Colors.purple, fontSize: 18)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _openUrl('https://t.me/addstickers/hakuvk', context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Telegram', style: TextStyle(color: Colors.white, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'За правилами Viber, стікерпак може містити до 24 стікерів, але Telegram дозволяє вміст до 48 стікерів!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: stickers.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showStickerDialog(context, stickers[index]),
                    child: Image.asset(stickers[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

