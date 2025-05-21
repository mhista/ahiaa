import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/auth/data/models/user_model.dart';
import 'package:ahiaa/utils/exceptions/subabase/server_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentSession;
  // Signup with email and password
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  });

  // Login with email and password
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  // get the current user
  Future<UserModel?> getCurrentUserData();

  // google signin
  Future<UserModel?> signInWithGoogle();

  // create new profiile
  Future<UserModel?> createNewProfile(UserModel userModel);
}

// SUPABASE IMPLEMENTATION
class AuthRemoteDataSourceSupabaseImp implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceSupabaseImp({required this.supabaseClient});

  @override
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // debugPrint(response.user!.toJson().toString());
      return UserModel.fromMap(response.user!.toJson());
    } on AuthException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      debugPrint(email + password + firstName + lastName + phoneNumber);

      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        // phone: phoneNumber,
        data: <String, dynamic>{
          'firstname': firstName,
          'lastname': lastName,
          'phone': phoneNumber,
        },
      );
      if (response.user == null) {
        throw ServerException('Unable to login, Try again later');
      }
      return UserModel.fromMap(response.user!.toJson());
    } on AuthException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentSession != null) {
        final userData = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentSession!.user.id);
        debugPrint(userData.first.toString());
        return UserModel.fromMap(userData.first);
      } else {
        return null;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      const webClientId =
          '954656963708-qfiu95sufs3i98n7r6vijnlvrhctsdjq.apps.googleusercontent.com';
      const iosClientId =
          '954656963708-ev08hpe56h065sfnh1p1c1q2ont0gkl0.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      if (response.user == null) {
        throw ServerException('Unable to login, Try again later');
      }
      final user = UserModel.fromMap(response.user!.toJson());
      UserModel? userModel = UserModel.empty();
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', user.id);

      if (userData.isEmpty) {
        userModel = await createNewProfile(user);
      }
      userModel = UserModel.fromMap(userData.first);

      return userModel;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> createNewProfile(UserModel userModel) async {
    try {
      final newUserData =
          await supabaseClient
              .from('profiles')
              .update(userModel.toMap())
              .eq('id', userModel.id)
              .select();
      return UserModel.fromMap(newUserData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
// -- Create a table for public profiles
// create table profiles (
//   id uuid references auth.users not null primary key,
//   updatedAt timestamp with time zone,

// );
// -- Set up Row Level Security (RLS)
// -- See https://supabase.com/docs/guides/database/postgres/row-level-security for more details.
// alter table profiles
//   enable row level security;

// create policy "Public profiles are viewable by everyone." on profiles
//   for select using (true);

// create policy "Users can insert their own profile." on profiles
//   for insert with check ((select auth.uid()) = id);

// create policy "Users can update own profile." on profiles
//   for update using ((select auth.uid()) = id);

// -- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
// -- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
// create function public.handle_user_when_created()
// returns trigger
// set search_path = ''
// as $$
// begin
//   insert into public.profiles (id, firstname, lastname)
//   values (new.id, new.raw_user_meta_data->>'firstname', new.raw_user_meta_data->>'lastname');
//   return new;
// end;
// $$ language plpgsql security definer;
// create trigger on_auth_user_when_created
//   after insert on auth.users
//   for each row execute procedure public.handle_user_when_created();

// -- Set up Storage!
// insert into storage.buckets (id, name)
//   values ('avatars', 'avatars');

// -- Set up access controls for storage.
// -- See https://supabase.com/docs/guides/storage/security/access-control#policy-examples for more details.
// create policy "Avatar images are publicly accessible." on storage.objects
//   for select using (bucket_id = 'avatars');

// create policy "Anyone can upload an avatar." on storage.objects
//   for insert with check (bucket_id = 'avatars');

// create policy "Anyone can update their own avatar." on storage.objects
//   for update using ((select auth.uid()) = owner) with check (bucket_id = 'avatars');
