import 'dart:io';

import 'package:f35/features/detail/helpers/ad_helper.dart';
import 'package:f35/features/detail/screens/widgets/detailScreenAppBar.dart';
import 'package:f35/features/payment/screens/addNewCardScreen.dart';
import 'package:f35/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/percent_indicator.dart';

final List<String> imgList = [
  'https://plus.unsplash.com/premium_photo-1677165327781-1c0b7c458821?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  'https://media.istockphoto.com/id/1356845507/tr/foto%C4%9Fraf/veterinary-clinic.jpg?s=1024x1024&w=is&k=20&c=tMpZfw-wiEPcLT8keb3oOmoHAsdYLNjA3aBrELHUJjE=',
  'https://plus.unsplash.com/premium_photo-1677165324281-3497b194c168?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  'https://plus.unsplash.com/premium_photo-1677165325500-039bb3e02aec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
];

class DetailScreen extends StatefulWidget {
  final String _animal;

  DetailScreen({required String animal}) : _animal = animal;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  RewardedAd? rewardedAd;
  final String rewardedAdUnitId = "ca-app-pub-3940256099942544/5224354917";
  bool isAdWatched = false;

  //load ad
  @override
  void initState() {
    super.initState();

    _loadRewardedAd();
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {},
        onAdLoaded: (RewardedAd ad) {
          rewardedAd = ad;

          _setFullScreenContentCallback();
        },
      ),
    );
  }

  void _setFullScreenContentCallback() {
    if (rewardedAd == null) return;
    rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print("$ad onAdShowedFullScreenContent"),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print("$ad onAdDismissedFullScreenContent");

        //dispose the dismissed ad
        ad.dispose();
      },
      //when ad fails to show
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print("$ad  onAdFailedToShowFullScreenContent: $error ");
        //dispose the failed ad
        ad.dispose();
      },

      //when impression is detected
      onAdImpression: (RewardedAd ad) => print("$ad Impression occured"),
    );
  }

  void _showRewardedAd() {
    rewardedAd?.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      num amount = rewardItem.amount;
      Navigator.pop(context, 'OK');
      isAdWatched = true;
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Yardımınız için teşekkürler!',
              textAlign: TextAlign.center),
          content: const Text(
            'Bu reklamı izleyerek kampanyaya katkıda bulundunuz.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          ),
          actions: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      style: ElevatedButton.styleFrom(
                        primary: Pallete.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Tamam'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(animal: widget._animal),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bacağı Kırık ${widget._animal}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Pallete.primaryColor),
                    child: Row(
                      children: [
                        Text(widget._animal),
                        const SizedBox(width: 8.0),
                        Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: const BoxDecoration(
                            color: Pallete.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text('Acil!'),
                        const SizedBox(width: 8.0),
                        Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: const BoxDecoration(
                            color: Pallete.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text('Kırık'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 42.0,
                            width: 42.0,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kadıköy Veteriner',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '10 Haz 2023',
                                style: TextStyle(
                                    fontWeight: FontWeight.w100, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 35.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Pallete.secondaryColor,
                            ),
                            child: const Icon(
                              Icons.message,
                              size: 20,
                              color: Pallete.whiteColor,
                            ),
                          ),
                          Container(
                            height: 35.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Pallete.secondaryColor,
                            ),
                            child: const Icon(
                              Icons.favorite,
                              size: 20,
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: Pallete.helperColor1, height: 2.0),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 8.0),
                  ExpandableText(
                      "Ben veteriner Dr. Ahmet. Bugün size yardım talep eden bir ${widget._animal} hikayesini anlatmak istiyorum. Bugün sokaklarda bulduğumuz bu sevimli ${widget._animal}  maalesef bir kaza sonucu bir arabanın altında ezilerek sol arka bacağını kırmış durumda. Durumu oldukça acil ve tedaviye ihtiyacı var.${widget._animal} oldukça korkmuş durumda. Kırık bacağından dolayı acı çekiyor ve hareket edemiyor. Kırık yerinde şişlik ve morarma var. İlk müdahaleyi gerçekleştirdik ve ağrıyı hafifletmek için analjezik bir ilaç verdik. Ancak, uzman bir veteriner tarafından yapılacak bir muayene ve tedavi gerekmektedir.Minnoş'un bacağını daha ayrıntılı bir şekilde incelemek ve doğru bir tanı koymak için röntgen çektirmemiz gerekiyor. Kırığın doğası ve karmaşıklığına bağlı olarak, bacağın immobilizasyonu veya cerrahi bir müdahale gerekebilir. Ayrıca, enfeksiyon riskini azaltmak için antibiyotik tedavisi de düşünülmelidir.Ancak, tedavi maliyetlerinin Minnoş'un sahibi tarafından karşılanması gerekiyor. Maalesef sokak hayvanı olduğu için sahibi olmadığı için tedavi ve bakım masrafları için yardım talep ediyoruz. Bu durumda, Minnoş'un hayatını kurtarmak ve ona acil yardım sağlamak için sizin yardımınıza ihtiyacımız var.Minnoş, sevecen bir ${widget._animal} ve şu anda acı çekiyor. Onun iyileşmesine ve tekrar sağlıklı bir şekilde hareket etmesine yardımcı olmak için bağışlarınızı bekliyoruz. Tedavi, röntgen, ilaçlar ve gereken diğer tıbbi masraflar için herhangi bir miktarda bağış yapabilirsiniz.Minnoş ve ben, desteğinizi bekliyoruz. Eğer yardım etmek isterseniz, lütfen bana geri dönün veya aşağıdaki bağış hesabına katkıda bulunun.",
                      style: TextStyle(fontWeight: FontWeight.w300),
                      expandText: "Daha Fazla",
                      collapseText: "Daha Az",
                      maxLines: 5,
                      linkColor: Pallete.secondaryColor,
                      linkStyle: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 16.0),
                  const Divider(color: Pallete.helperColor1, height: 2.0),
                  const SizedBox(height: 26.0),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Gereken Yardım",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Pallete.greyColor),
                        ),
                        Text(
                          "7000₺",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Pallete.primaryColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: new CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 10.0,
                        percent: 0.8,
                        header: new Text("Toplanan",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Pallete.greyColor)),
                        center: new Icon(
                          Icons.pets,
                          size: 50.0,
                          color: Pallete.secondaryColor,
                        ),
                        backgroundColor: Pallete.helperColor2,
                        progressColor: Pallete.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Center(
                  //   child: CarouselSlider.builder(
                  //       itemCount: imgList.length,
                  //       itemBuilder: (context, index, realIndex) {
                  //         final urlImage = imgList[index];

                  //         return buildImage(urlImage, index);
                  //       },
                  //       options: CarouselOptions(height: 400)),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Yardım Türünü Seç', textAlign: TextAlign.center),
            content: const Text(
              'Reklam izleyerek veya para bağışlayarak yardım edebilirsiniz.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            actions: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isAdWatched
                          ? Text("Reklam İzlendi")
                          : ElevatedButton(
                              onPressed: () => _showRewardedAd(),
                              style: ElevatedButton.styleFrom(
                                primary: Pallete.secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Reklam İzle'),
                            ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewCardScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Pallete.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Para Bağışla'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        label: const Text(
          'Yardım Et!',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        icon: const Icon(Icons.pets),
        backgroundColor: Pallete.primaryColor,
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Pallete.greyColor,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
