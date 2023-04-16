abstract class AuthStates{}
class AuthInitialState extends AuthStates{}

class LoginLoadingState extends AuthStates{}
class LoginLoadedState extends AuthStates{}
class LoginFailedState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}
class RegisterLoadedState extends AuthStates{}
class RegisterFailedState extends AuthStates{}