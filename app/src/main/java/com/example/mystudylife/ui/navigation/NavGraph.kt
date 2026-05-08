package com.example.mystudylife.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.mystudylife.ui.screens.privacy.PrivacyScreen
import com.example.mystudylife.ui.screens.splash.TrustedScreen
import com.example.mystudylife.ui.screens.hub.ProductivityHubScreen
import com.example.mystudylife.ui.screens.focus.ReadyToFocusScreen
import com.example.mystudylife.ui.screens.auth.SignInScreen

sealed class Screen(val route: String) {
    object Privacy : Screen("privacy")
    object Trusted : Screen("trusted")
    object ProductivityHub : Screen("hub")
    object ReadyToFocus : Screen("focus")
    object SignIn : Screen("signin")
}

@Composable
fun StudyLifeNavGraph(
    navController: NavHostController = rememberNavController(),
    startDestination: String = Screen.Privacy.route
) {
    NavHost(
        navController = navController,
        startDestination = startDestination
    ) {
        composable(Screen.Privacy.route) {
            PrivacyScreen(
                onContinueClick = {
                    navController.navigate(Screen.Trusted.route)
                }
            )
        }
        composable(Screen.Trusted.route) {
            TrustedScreen(
                onContinueClick = {
                    navController.navigate(Screen.ProductivityHub.route)
                }
            )
        }
        composable(Screen.ProductivityHub.route) {
            ProductivityHubScreen(
                onContinueClick = {
                    navController.navigate(Screen.ReadyToFocus.route)
                }
            )
        }
        composable(Screen.ReadyToFocus.route) {
            ReadyToFocusScreen(
                onContinueClick = {
                    navController.navigate(Screen.SignIn.route)
                }
            )
        }
        composable(Screen.SignIn.route) {
            SignInScreen(
                onSignInClick = {
                    // Logic for sign in
                },
                onSignUpClick = {
                    // Logic for sign up
                }
            )
        }
    }
}
