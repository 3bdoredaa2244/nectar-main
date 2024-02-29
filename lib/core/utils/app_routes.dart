import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/core/models/product_item_model.dart';
import 'package:nectar/features/checkout/data/repos/checkout_repo_imp.dart';
import 'package:nectar/features/checkout/presentation/manager/get%20customer%20id%20cubit/get_customer_id_cubit.dart';
import 'package:nectar/features/checkout/presentation/manager/payment%20cubit/payment_cubit.dart';
import 'package:nectar/features/home/data/repos/shop_repo_imp.dart';
import 'package:nectar/features/home/presentation/views/screens/product_details_view.dart';
import 'package:nectar/features/profile/presentation/views/edit_account_view.dart';
import 'package:nectar/features/profile/presentation/views/otp_view.dart';
import '../../features/authentication/data/models/check_email_model.dart';
import '../../features/authentication/presentation/manager/login cubit/login_cubit.dart';
import '../../features/authentication/presentation/manager/login google cubit/login_google_cubit.dart';
import '../../features/authentication/presentation/manager/register cubit/register_cubit.dart';
import '../../features/authentication/presentation/manager/reset password cubit/reset_password_cubit.dart';
import '../../features/authentication/presentation/manager/validate login/validate_login_cubit.dart';
import '../../features/authentication/presentation/views/screens/login_view.dart';
import '../../features/authentication/presentation/views/screens/register_view.dart';
import '../../features/check email/presentation/widgets/check_email_view.dart';
import '../../features/checkout/data/repos/cart repo/cart_repo_imp.dart';
import '../../features/checkout/presentation/manager/delete cart cubit/delete_cart_cubit.dart';
import '../../features/checkout/presentation/manager/edit cart cubit/edit_cart_cubit.dart';
import '../../features/checkout/presentation/manager/get carts cubit/get_carts_cubit.dart';
import '../../features/home/presentation/manager/add cart cubit/add_cart_cubit.dart';
import '../../features/home/presentation/manager/control count cubit/control_count_cubit.dart';
import '../../features/home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../features/home/presentation/manager/delete favourite cubit/delete_favourite_cubit.dart';
import '../../features/home/presentation/manager/get favorites cubit/get_favorites_cubit.dart';
import '../../features/home/presentation/manager/get favourite products/get_favourite_products_cubit.dart';
import '../../features/home/presentation/manager/get groceries/get_groceries_cubit.dart';
import '../../features/home/presentation/views/screens/explore_products_view.dart';
import '../../features/home/presentation/views/screens/home_view.dart';
import '../../features/onBoarding/presentation/view/screens/onboarding_view.dart';
import '../../features/product category/data/repos/product_category_repo_imp.dart';
import '../../features/product category/presentation/manager/get product category cubit/get_product_category_cubit.dart';
import '../../features/product category/presentation/views/product_category_view.dart';
import '../../features/profile/data/repos/account repo/account_repo_imp.dart';
import '../../features/profile/presentation/manager/add user details/add_user_details_cubit.dart';
import '../../features/show products/presentation/views/show_products_view.dart';
import '../../features/splash/presentation/views/screens/splash_view.dart';

abstract class AppRoutes {
  static const String homeView = '/homeView';
  static const String productDetailsView = '/ProductDetailsView';
  static const String searchView = '/SearchView';
  static const String cartView = '/CartView';
  static const String exploreProductsView = '/ExploreProductsView';
  static const String showProductsView = '/ShowProductsView';
  static const String onboardingView = '/OnboardingView';
  static const String loginView = '/LoginView';
  static const String registerView = '/RegisterView';
  static const String checkEmail = '/checkEmail';
  static const String editAccountView = '/EditAccountView';
  static const String test = '/test';
  static const String otp = '/otpView';
  static const String productCategory = '/productCategory';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: productDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          num count = 0;
          num total = 0;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ControlCountCubit(count, total),
              ),
              BlocProvider(
                create: (context) => AddCartCubit(CartRepoImp()),
              ),
            ],
            child: ProductDetailsView(
              product: state.extra as ProductItemModel,
            ),
          );
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => CountTotalOrderCubit()),
              BlocProvider(create: (context) => EditCartCubit(CartRepoImp())),
              BlocProvider(
                  create: (context) => GetGroceriesCubit(ShopRepoImp())),
              BlocProvider(create: (context) => DeleteCartCubit(CartRepoImp())),
              BlocProvider(create: (context) => ControlCountCubit(0, 0)),
              BlocProvider(create: (context) => GetFavoritesCubit()),
              BlocProvider(create: (context) => DeleteFavouriteCubit()),
              BlocProvider(create: (context) => GetCartsCubit(CartRepoImp())),
              BlocProvider(
                  create: (context) => PaymentCubit(CheckoutRepoImp())),
              BlocProvider(
                  create: (context) =>
                      GetFavouriteProductsCubit(ShopRepoImp())),
            ],
            child: const HomeView(),
          );
        },
      ),
      /*GoRoute(
        path: cartView,
        builder: (BuildContext context, GoRouterState state) {
          return const CartView(
            cartItems: [],
          );
        },
      ),*/
      GoRoute(
        path: exploreProductsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ExploreProductsView();
        },
      ),
      GoRoute(
        path: showProductsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ShowProductsView(
            cartItems: [], /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/
          );
        },
      ),
      GoRoute(
        path: onboardingView,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView(
              /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/);
        },
      ),
      GoRoute(
        path: loginView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => GetCustomerIdCubit(CheckoutRepoImp())),
              BlocProvider(
                create: (context) => LoginGoogleCubit(),
              ),
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(
                create: (context) => ResetPasswordCubit(),
              ),
              BlocProvider(
                create: (context) => ValidateLoginCubit(),
              ),
              BlocProvider(
                create: (context) => AddUserDetailsCubit(AccountRepoImp()),
              ),
            ],
            child: const LoginView(
                /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/),
          );
        },
      ),
      GoRoute(
          path: registerView,
          builder: (BuildContext context, GoRouterState state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => GetCustomerIdCubit(CheckoutRepoImp())),
                BlocProvider(
                  create: (context) => RegisterCubit(),
                ),
                BlocProvider(
                  create: (context) => AddUserDetailsCubit(AccountRepoImp()),
                ),
              ],
              child: const RegisterView(
                  /*productsItems: state.extra as List<CartItemModel>, categoryName: state.extra as String ,*/),
            );
          }),
      GoRoute(
        path: checkEmail,
        builder: (BuildContext context, GoRouterState state) {
          return CheckEmail(
            checkEmailModel: state.extra as CheckEmailModel,
          );
        },
      ),
      GoRoute(
        path: editAccountView,
        builder: (BuildContext context, GoRouterState state) {
          return const EditAccountView();
        },
      ),
      GoRoute(
        path: otp,
        builder: (BuildContext context, GoRouterState state) {
          return const OtpView();
        },
      ),
      GoRoute(
        path: productCategory,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                GetProductCategoryCubit(ProductCategoryRepoImp()),
            child: ProductCategoryView(categoryName: state.extra as String),
          );
        },
      ),
    ],
  );
}
