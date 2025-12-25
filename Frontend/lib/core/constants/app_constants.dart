class AppConstants {
  static const String appName = "WorkHive";
  
  // API Endpoints (For when your NestJS backend is ready)
  static const String baseUrl = "http://localhost:3000/api"; 
  static const String authEndpoint = "$baseUrl/auth";
  static const String jobsEndpoint = "$baseUrl/jobs";

  // Asset Paths
  static const String logoPath = "assets/images/logo.png";
  static const String onboarding1 = "assets/images/onboard_1.png";
}