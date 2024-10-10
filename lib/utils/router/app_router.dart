import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socshea/features/authentication/email_login/data/repositories/login_repo_impl.dart';
import 'package:socshea/features/authentication/email_login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:socshea/features/authentication/email_login/presentation/views/login_screen.dart';
import 'package:socshea/features/authentication/email_register/data/repositories/register_repo_impl.dart';
import 'package:socshea/features/authentication/email_register/presentation/manager/register_cubit/register_email_cubit.dart';
import 'package:socshea/features/authentication/email_register/presentation/views/register_screen.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo_impl.dart';
import 'package:socshea/features/authentication/google_auth/presentaion/manager/google_auth_cubit/google_auth_cubit.dart';
import 'package:socshea/utils/dependencies/service_locator.dart';

abstract class TAppRouter {
  static const kLoginScreen = "/";
  static const kRegisterScreen = '/register';
  static final router = GoRouter(
    routes: [
      //---Login
      GoRoute(
        path: kLoginScreen,
        builder: (context, state){
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginCubit(loginRepo: getIt.get<LoginRepoImpl>())),
              BlocProvider(create: (context) => GoogleAuthCubit(googleAuthRepo: getIt.get<GoogleAuthRepoImpl>())),
            ],
            child: const LoginScreen(),
          );
        }
      ),

      //---Register
      GoRoute(
          path: kRegisterScreen,
          // name: 'register',
          builder: (context, state){
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => RegisterEmailCubit(registerRepo: getIt.get<RegisterRepoImpl>())),
                BlocProvider(create: (context) => GoogleAuthCubit(googleAuthRepo: getIt.get<GoogleAuthRepoImpl>())),
              ],
              child: const RegisterScreen(),
            );
          }
        // builder: (context, state) => MultiBlocProvider(providers: [
        //   BlocProvider<PasswordVisibilityCubit>(
        //       create: (context) => PasswordVisibilityCubit()),
        //   BlocProvider(
        //     create: (context) =>
        //         LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()),
        //     child: LoginView(),
        //   )
        // ], child: LoginView()),
      ),
    ]
  );
}
//   static const kRegisterView = '/kRegisterView1';
//   static const kCompleteRegisterView = '/kRegisterView2';
//   static const kTechCategoryView = "/kTechCategoryView";
//   static const kTechnologyDetailsView = "/kTechnologyDetailsView";
//   static const kEmailVerificationView = "/kEmailVerificationView";
//   static const kForgetPasswordView = "/kForgetPasswordView";
//   static const kResetPasswordCodeView = "/kResetPasswordCodeView";
//   static const kResetPasswordView = "/kResetPasswordView";
//
//   static const kFrameWorkDetailsView = "/kFrameWorkDetailsView";
//   static const kRoadmapsView = "/kRoadmapsView";
//   static const kRoadMapsDetailsView = "/kRoadMapsDetailsView";
//   static const kCommunityChatView = "/kCommunityChatView";
//   static const kSkillTestView = "/kSkillTestView";
//   static const kRoadMapSkillVideosView = "/kRoadMapSkillVideosView";
//   static const kSkillView = "/SkillView";
//   static const kSkillVideoItem = "/SkillVideoItem";
//   static const kSkillArticeDetails = "/kSkillArticleDetails";
//   static const kRoadMapRanking = "/kRoadMapRanking";
//
//   static const kCompetitionsDetails = "/kCompetitionsDetails";
//   static const kCompanyProfile = "/kCompanyProfile";
//   static const kSearchResultView = "/kSearchResultView";
//   static const kExpertProfile = "/kExpertProfile";
//   static const kStudentProfile = "/kStudentProfile";
//     routes: [
//       //Home
//       GoRoute(
//         path: kHomeView,
//         builder: (context, state) => MultiBlocProvider(
//           providers: [
//             BlocProvider<BottomNavBarCubit>(
//               create: (context) => BottomNavBarCubit(),
//             ),
//             BlocProvider(
//               create: (context) => TechnologyCategoriesCubit(
//                   technologyCategoriesRepo: getIt.get<HomeRepoImpl>())
//                 ..fetchAllCategories(),
//             ),
//             BlocProvider(
//               create: (context) =>
//                   CompetitionsCubit(getIt.get<CompetitionRepoImpl>())
//                     ..fetchCompetitions("current"),
//             ),
//             BlocProvider(
//               create: (context) =>
//                   ProfileCubit(getIt.get<UserRepoImpl>())..fetchProfile(),
//             ),
//             BlocProvider(
//               create: (context) =>
//                   MyCompetitionsCubit(getIt.get<UserRepoImpl>())
//                     ..fetchMyCompetitions(),
//             ),
//             BlocProvider(
//               create: (context) => FollowedExpertsCubit(
//                   followedExpertsRepo: getIt.get<UserRepoImpl>())
//                 ..showFollowedExperts(
//                     id: CacheServices.getData(key: "user_id")),
//             ),
//             BlocProvider(
//               create: (context) => FollowedCompaniesCubit(
//                   followedCompaniesRepo: getIt.get<UserRepoImpl>())
//                 ..showFollowedCompanies(
//                     id: CacheServices.getData(key: "user_id")),
//             ),
//             BlocProvider(
//               create: (context) => FollowedTechnologiesCubit(
//                   followedTechnologiesRepo: getIt.get<UserRepoImpl>())
//                 ..showFollowedTechnologies(
//                     id: CacheServices.getData(key: "user_id")),
//             ),
//           ],
//           child: const HomeView(),
//         ),
//       ),
//       //Register1
//       GoRoute(
//         path: kRegisterView,
//         pageBuilder: (context, state) => CustomTransitionPage(
//             child: MultiBlocProvider(providers: [
//               BlocProvider<PasswordVisibilityCubit>(
//                   create: (context) => PasswordVisibilityCubit()),
//               BlocProvider(
//                 create: (context) =>
//                     RegisterCubit(registerRepo: getIt.get<RegisterRepoImpl>()),
//               ),
//             ], child: RegisterView()),
//             transitionsBuilder: HelperFunctions.slideFromRightTransition),
//       ),
//
//       GoRoute(
//           path: kEmailVerificationView,
//           pageBuilder: (context, state) {
//             return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => EmailVerificationCodeCubit(
//                       registerRepo: getIt.get<RegisterRepoImpl>()),
//                   child: const EmailVerificationView(),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//
//       //Register2
//       GoRoute(
//           path: kCompleteRegisterView,
//           pageBuilder: (context, state) => CustomTransitionPage(
//               child: MultiBlocProvider(
//                 providers: [
//                   BlocProvider<RadioCubit>(
//                     create: (context) => RadioCubit(),
//                   ),
//                   BlocProvider<MenuCubit>(
//                     create: (context) => MenuCubit(),
//                   ),
//                   BlocProvider<ImagePickerCubit>(
//                     create: (context) => ImagePickerCubit(),
//                   ),
//                   BlocProvider(
//                     create: (context) => CompleteRegisterCubit(
//                         registerRepo: getIt.get<RegisterRepoImpl>()),
//                   ),
//                 ],
//                 child: const CompleteRegisterView(),
//               ),
//               transitionsBuilder: HelperFunctions.slideFromRightTransition)),
//       //Login

//
//       GoRoute(
//           path: kForgetPasswordView,
//           pageBuilder: (context, state) {
//             return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => ForgetPasswordCubit(
//                       loginRepo: getIt.get<LoginRepoImpl>()),
//                   child: ForgetPasswordView(),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//       GoRoute(
//           path: kResetPasswordCodeView,
//           pageBuilder: (context, state) {
//             final String email = state.extra as String;
//             return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => ResetPasswordCodeCubit(
//                       loginRepo: getIt.get<LoginRepoImpl>()),
//                   child: ResetPasswordCodeView(email: email),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//
//       GoRoute(
//           path: kResetPasswordView,
//           pageBuilder: (context, state) {
//             final String email = state.extra as String;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) => ResetPasswordCubit(
//                           loginRepo: getIt.get<LoginRepoImpl>()),
//                     ),
//                     BlocProvider<PasswordVisibilityCubit>(
//                         create: (context) => PasswordVisibilityCubit()),
//                   ],
//                   child: ResetPasswordView(email: email),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//       GoRoute(
//           path: kTechCategoryView,
//           pageBuilder: (context, state) {
//             List<TechnologyCategoryModel> categoriesList =
//                 state.extra as List<TechnologyCategoryModel>;
//             return CustomTransitionPage(
//                 child: TechnologyCategoryView(
//                   categoriesList: categoriesList,
//                 ),
//                 transitionsBuilder: HelperFunctions.fadeTransition);
//           }),
//       GoRoute(
//           path: kTechnologyDetailsView,
//           pageBuilder: (context, state) {
//             TechnologyCategoryModel technologyCategoryModel =
//                 state.extra as TechnologyCategoryModel;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) => TechnologyCubit(
//                           homeRepo: getIt.get<HomeRepoImpl>())
//                         ..fetchAllTechologies(id: technologyCategoryModel.id!),
//                     ),
//                     BlocProvider(
//                       create: (context) => ToggleFollowTechnologyCubit(
//                           followTechnologyRepo: getIt.get<UserRepoImpl>()),
//                     ),
//                   ],
//                   child: TechnologyDetailsView(
//                     technologyCategoryModel: technologyCategoryModel,
//                   ),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//
//       GoRoute(
//           path: kFrameWorkDetailsView,
//           builder: (context, state) {
//             TechnologiesModel technologyModel =
//                 state.extra as TechnologiesModel;
//             return BlocProvider(
//                 create: (context) =>
//                     LevelCubit(homeRepo: getIt.get<HomeRepoImpl>())
//                       ..fetchLevels(id: technologyModel.id!),
//                 child: FrameWorkDetailsView(
//                   technologiesModel: technologyModel,
//                 ));
//           }),
//
//       GoRoute(
//           path: kRoadmapsView,
//           pageBuilder: (context, state) {
//             LevelModel levelModel = state.extra as LevelModel;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) => RoadMapsCubit(
//                           roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                         ..fetchRoadMaps(technologyLevelId: levelModel.id!),
//                     ),
//                     BlocProvider(
//                       create: (context) => RoadMapRankingCubitCubit(
//                           getIt.get<RoadMapRepoImpl>()),
//                     ),
//                   ],
//                   child: RoadMapsView(level: levelModel.level!),
//                 ),
//                 transitionsBuilder: HelperFunctions.fadeTransition);
//           }),
//       GoRoute(
//           path: kRoadMapRanking,
//           pageBuilder: (context, state) {
//             int roadMapId = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) =>
//                           RoadMapRankingCubitCubit(getIt.get<RoadMapRepoImpl>())
//                             ..roadMapRanking(roadMapId: roadMapId),
//                     ),
//                   ],
//                   child: RoadMapRankingView(
//                     roadMapId: roadMapId,
//                   ),
//                 ),
//                 transitionsBuilder: HelperFunctions.fadeTransition);
//           }),
//
//       GoRoute(
//           path: kRoadMapsDetailsView,
//           pageBuilder: (context, state) {
//             RoadMapModel roadMapModel = state.extra as RoadMapModel;
//
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) => RoadMapSkillsCubit(
//                           roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                         ..fetchRoadMapSkills(roadmapId: roadMapModel.id!),
//                     ),
//                     BlocProvider(
//                       create: (context) => PageIndexCubit(),
//                     ),
//                   ],
//                   child: RoadMapsDetailsView(
//                     roadMapModel: roadMapModel,
//                   ),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//
//       GoRoute(
//           path: kCommunityChatView,
//           pageBuilder: (context, state) {
//             return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => ChatCubit(),
//                   child: const CommunityChatView(),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideFromLeftTransition);
//           }),
//       GoRoute(
//           path: kSkillTestView,
//           pageBuilder: (context, state) {
//             int id = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                     create: (context) => SkillTestCubit(
//                         roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                       ..fetchSkillTest(testId: id),
//                   ),
//                 ], child: const SkillTestView()),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//
//       GoRoute(
//           path: kRoadMapSkillVideosView,
//           pageBuilder: (context, state) {
//             int roadMapSkillId = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                       create: (context) => SkillVideosCubit(
//                           roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                         ..fetchSkillVideos(roadMapSkillId: roadMapSkillId)),
//                 ], child: const SkillVideosView()),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//       GoRoute(
//           path: kSkillView,
//           pageBuilder: (context, state) {
//             RoadMapSkillsModel skill = state.extra as RoadMapSkillsModel;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                       create: (context) => SkillVideosCubit(
//                           roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                         ..fetchSkillVideos(roadMapSkillId: skill.id!)),
//                   BlocProvider(
//                     create: (context) => SkillArticlesCubit(
//                         roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                       ..fetchSkillArticles(skillId: skill.id!),
//                   ),
//                   BlocProvider(
//                     create: (context) => SkillNavBarCubit(),
//                   )
//                 ], child: SkillView(skillTitle: skill.title!)),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//       GoRoute(
//           path: kSkillVideoItem,
//           pageBuilder: (context, state) {
//             SkillsVideos video = state.extra as SkillsVideos;
//             return CustomTransitionPage(
//                 child: SkillVideoItem(
//                   videoUrl: video.video!,
//                   videoTitle: video.title!,
//                 ),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//
//       GoRoute(
//           path: kSkillArticeDetails,
//           pageBuilder: (context, state) {
//             SkillsArticles article = state.extra as SkillsArticles;
//             return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => ArticleSectionsCubit(
//                       roadMapRepo: getIt.get<RoadMapRepoImpl>())
//                     ..fetchArticleSections(articleId: article.id!),
//                   child: ArticleSectionsView(title: article.title!),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//
//       GoRoute(
//           path: kCompetitionsDetails,
//           pageBuilder: (context, state) {
//             final Competitions competitions = state.extra as Competitions;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) => CompetitorCubit(
//                           getIt.get<CompetitionRepoImpl>())
//                         ..fetchAllCompetitors(competionId: competitions.id!),
//                     ),
//                     BlocProvider(
//                         create: (context) => CompetitionRegisterCubit(
//                             getIt.get<CompetitionRepoImpl>())),
//                     BlocProvider(
//                       create: (context) =>
//                           AddProjectLinkCubit(getIt.get<CompetitionRepoImpl>()),
//                     ),
//                     BlocProvider(
//                       create: (context) =>
//                           WinnersCubit(getIt.get<CompetitionRepoImpl>())
//                             ..fetchAllWiners(competitionId: competitions.id!),
//                     )
//                   ],
//                   child: CompetitionDetails(competition: competitions),
//                 ),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//
//       GoRoute(
//           path: kCompanyProfile,
//           pageBuilder: (context, state) {
//             final int companyId = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                     create: (context) =>
//                         CompanyProfileCubit(getIt.get<CompanyRepoImpl>())
//                           ..fetchCompanyProfile(companyId: companyId),
//                   ),
//                 ], child: const CompanyProfile()),
//                 transitionsBuilder: HelperFunctions.slideFromRightTransition);
//           }),
//       GoRoute(
//           path: kSearchResultView,
//           pageBuilder: (context, state) {
//             final String name = state.extra as String;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                     create: (context) =>
//                         GeneralSearchCubit(getIt.get<SearchRepoImpl>())
//                           ..generalSearch(name: name),
//                   ),
//                   BlocProvider(
//                       create: (context) => ToggleFollowExpertCubit(
//                           followExpertRepo: getIt.get<UserRepoImpl>())),
//                   BlocProvider(
//                       create: (context) => ToggleFollowCompanyCubit(
//                           followCompanyRepo: getIt.get<UserRepoImpl>())),
//                 ], child: const SearchResultView()),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//
//       GoRoute(
//           path: kExpertProfile,
//           pageBuilder: (context, state) {
//             final int expertId = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                       create: (context) => ExpertProfileCubit(
//                           expertProfileRepo: getIt.get<ExpertProfileRepoImpl>())
//                         ..fetchExpertProfile(id: expertId)),
//                   BlocProvider(
//                     create: (context) => ToggleFollowExpertCubit(
//                         followExpertRepo: getIt.get<UserRepoImpl>()),
//                   )
//                 ], child: const ExpertProfileView()),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//
//       GoRoute(
//           path: kStudentProfile,
//           pageBuilder: (context, state) {
//             final int studentId = state.extra as int;
//             return CustomTransitionPage(
//                 child: MultiBlocProvider(providers: [
//                   BlocProvider(
//                       create: (context) => StudentProfileCubit(
//                           studentProfileRepo: getIt.get<UserRepoImpl>())
//                         ..fetchStudentProfile(id: studentId)),
//                   BlocProvider(
//                       create: (context) => FollowedExpertsCubit(
//                           followedExpertsRepo: getIt.get<UserRepoImpl>())
//                         ..showFollowedExperts(id: studentId)),
//                   BlocProvider(
//                       create: (context) => FollowedTechnologiesCubit(
//                           followedTechnologiesRepo: getIt.get<UserRepoImpl>())
//                         ..showFollowedTechnologies(id: studentId)),
//                 ], child: const StudentProfileView()),
//                 transitionsBuilder: HelperFunctions.slideTransition);
//           }),
//     ],
//   );
// }