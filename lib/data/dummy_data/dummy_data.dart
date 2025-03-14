// import 'package:pickafrika/features/shop/models/category_model.dart';
// import 'package:pickafrika/utils/constants/image_strings.dart';

// import '../../features/shop/models/banner_model.dart';
// import '../../routes/routes.dart';

// class DummyData {
//   // BANNERS
//   static final List<BannerModel> banners = [
//     BannerModel(
//         imageUrl: PImages.promoBanner2,
//         targetScreen: KRoutes.order,
//         active: false),
//     BannerModel(
//         imageUrl: PImages.promoBanner3,
//         targetScreen: KRoutes.cart,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.promoBanner4,
//         targetScreen: KRoutes.favourites,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.promoBanner5,
//         targetScreen: KRoutes.search,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.promoBanner6,
//         targetScreen: KRoutes.settings,
//         active: true),
//   ];

//   // static final UserModel user = UserModel(
//   //     firstName: 'Innocent',
//   //     lastName: 'Diwe',
//   //     username: '@Somtech',
//   //     email: 'diweesomchi@gmail.com',
//   //     phoneNumber: '07068884102',
//   //     profilePicture: PImages.appLogo,
//   //     addresses: [
//   //       AddressModel(
//   //           id: '1',
//   //           name: 'Diwe Innocent',
//   //           phoneNumber: '07068884102',
//   //           street: 'Emmanuel College Layout',
//   //           city: 'Owerri',
//   //           state: 'Imo State',
//   //           postalCode: '460',
//   //           country: 'Nigeria'),
//   //       AddressModel(
//   //           id: '2',
//   //           name: 'John Innocent',
//   //           phoneNumber: '09154450512',
//   //           street: 'Santiego de cuba',
//   //           city: 'Ekoromi',
//   //           state: 'Edo State',
//   //           postalCode: '480',
//   //           country: 'Nigeria'),
//   //     ]);

//   // static final CartModel cart = CartModel(cartId: '1', items: [
//   //   CartModelItem(
//   //       productId: productId,
//   //       variationId: variationId,
//   //       quantity: quantity,
//   //       title: title,
//   //       image: image,
//   //       brandName: brandName,
//   //       price: price,
//   //       selectedVariation: selectedVariation)
//   // ]);

//   static final List<CategoryModel> categories = [
//     // CategoryModel(
//     //     id: '1', name: 'Sports', image: PImages.sportIcon, isFeatured: true),
//     // CategoryModel(
//     //     id: '5',
//     //     name: 'Furniture',
//     //     image: PImages.furntureIcon,
//     //     isFeatured: true),
//     // CategoryModel(
//     //     id: '2',
//     //     name: 'Electronics',
//     //     image: PImages.electroniIcon,
//     //     isFeatured: true),
//     // CategoryModel(
//     //     id: '3', name: 'Clothes', image: PImages.clothIcon, isFeatured: true),
//     CategoryModel(
//         id: '4', name: 'Animals', image: PImages.animalIcon, isFeatured: true),
//     CategoryModel(
//         id: '6', name: 'Shoes', image: PImages.shoeIcon, isFeatured: true),
//     CategoryModel(
//         id: '7',
//         name: 'Cosmetics',
//         image: PImages.cosmeticIcon,
//         isFeatured: true),

//     // SUBCATEGORIES
//     CategoryModel(
//         id: '8',
//         name: 'Sport Shoes',
//         image: PImages.sportIcon,
//         isFeatured: false,
//         parentId: '1'),
//     CategoryModel(
//         id: '9',
//         name: 'Track Suites',
//         image: PImages.sportIcon,
//         isFeatured: false,
//         parentId: '1'),
//     CategoryModel(
//         id: '10',
//         name: 'Sports Equipments',
//         image: PImages.sportIcon,
//         isFeatured: false,
//         parentId: '1'),
//     // FURNITURE
//     CategoryModel(
//         id: '11',
//         name: 'Bedroom furniture',
//         image: PImages.furntureIcon,
//         isFeatured: false,
//         parentId: '5'),
//     CategoryModel(
//         id: '12',
//         name: 'Kitchen furniture',
//         image: PImages.furntureIcon,
//         isFeatured: false,
//         parentId: '1'),
//     CategoryModel(
//         id: '13',
//         name: 'Office furniture',
//         image: PImages.furntureIcon,
//         isFeatured: false,
//         parentId: '5'),
//     CategoryModel(
//         id: '14',
//         name: 'Jewelry',
//         image: PImages.jeweleryIcon,
//         isFeatured: true),
//     // ELECTRONICS

//     CategoryModel(
//         id: '15',
//         name: 'Office Electronics',
//         image: PImages.electroniIcon,
//         isFeatured: false,
//         parentId: '2'),

//     CategoryModel(
//         id: '16',
//         name: 'Shirts',
//         image: PImages.clothIcon,
//         isFeatured: false,
//         parentId: '3'),
//     // ELECTRONICS
//     CategoryModel(
//         id: '17',
//         name: 'Laptops',
//         image: PImages.electroniIcon,
//         isFeatured: false,
//         parentId: '2'),
//     CategoryModel(
//         id: '18',
//         name: 'Phones',
//         image: PImages.electroniIcon,
//         isFeatured: false,
//         parentId: '2'),
//   ];
// }

// // class BannerModel {
// //   BannerModel(
// //     this.targetScreen,
// //     this.active, {
// //     required this.imageUrl,
// //   });
// //   final String imageUrl;

// //   final String targetScreen;
// //   final bool active;
// // }

// class CartModel {
//   String cartId;
//   List<CartModelItem> items;
//   CartModel({
//     required this.cartId,
//     required this.items,
//   });
// }

// class CartModelItem {
//   final String productId;
//   final String variationId;
//   final int quantity;
//   final String title;
//   final String image;
//   final String brandName;
//   final double price;
//   final String selectedVariation;
//   CartModelItem({
//     required this.productId,
//     required this.variationId,
//     required this.quantity,
//     required this.title,
//     required this.image,
//     required this.brandName,
//     required this.price,
//     required this.selectedVariation,
//   });
// }
