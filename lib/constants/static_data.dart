import 'package:portfolio/models/carousel_model.dart';

class StaticData {
  static List<BannerData> banneData = [
    BannerData(
      logo: 'assets/nurseloop_logo.png',
      title: 'Nurseloop',
      description: 'Nurseloop is a free-to-download app that lets nurses connect to healthcare facilities..',
      path: 'nurseloop',
    ),
    //BannerData(title: 'Education', description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium', path: 'education'),
    BannerData(
      logo: 'assets/raketship_logo.png',
      title: 'Raketship',
      description: 'Raketship is the newest, homegrown on-demand delivery service that utilizes the...',
      path: 'raketship',
    ),
    BannerData(
      logo: 'assets/dentpal_logo.png',
      title: 'Dentpal',
      description: 'The leading Online Shopping app in the Dental Industry in Southeast Asia...',
      path: 'dentpal',
    ),
  ];
  static List<String> experienceImage = [
    'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/eperience_background.jfif?alt=media&token=19ee7317-7114-4150-9e36-0226836f72c0',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/maxim.jpg?alt=media&token=10357ebe-13a3-4c73-bc03-6adbef5f3cde',
  ];
  static List<String> educationImages = [
    'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/460px-TUP_Cavite_Main_Gate.jpg?alt=media&token=d4a48a89-f822-4fe9-9f5c-aacf9525f31d',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/tup-c-325.jpg?alt=media&token=4aa706db-6f2d-47cf-8365-868ee9552b12',
    //'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/joshua_grad.jpg?alt=media&token=4bf43d21-640e-4cad-9315-af3129f62dfb',
  ];
  static String tupMap = 'https://firebasestorage.googleapis.com/v0/b/portfolio-93c51.appspot.com/o/map.PNG?alt=media&token=e2f0de1d-95e7-412e-8daa-73e8e93f4913';
  static String tupMapUrl = 'https://www.google.com/maps/place/Technological+University+of+the+Philippines+%E2%80%93+Cavite/@14.3450539,120.9639132,17z/data=!3m1!4b1!4m5!3m4!1s0x3397d43fdf3bf3d3:0x756d61b3739581bc!8m2!3d14.3450539!4d120.9661019';
}
