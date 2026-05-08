package com.example.mystudylife.ui.screens.auth

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.components.StudyLifeButton
import com.example.mystudylife.ui.components.StudyLifeTextField
import com.example.mystudylife.ui.theme.*

@Composable
fun SignInScreen(
    onSignInClick: () -> Unit,
    onSignUpClick: () -> Unit
) {
    var email by remember { mutableStateOf("zainjameel710@gmail.com") }
    var password by remember { mutableStateOf("password") }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(BackgroundDark)
    ) {
        // Main Card with Premium Shadow
        Column(
            modifier = Modifier
                .fillMaxSize()
                .premiumCardShadow()
                .background(Color.White)
        ) {
            // Split Header Section (Emerald Green)
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(0.25f)
                    .background(EmeraldMid),
                contentAlignment = Alignment.Center
            ) {
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text(
                        text = "Sign in",
                        color = Color.White,
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Bold,
                        letterSpacing = 1.sp
                    )
                    Text(
                        text = "MyStudyLife",
                        color = Color.White,
                        fontSize = 28.sp,
                        fontWeight = FontWeight.Black,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
            }

            // Form Section (White)
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(0.75f)
                    .padding(24.dp)
            ) {
                Text(
                    text = "Welcome back!",
                    style = MaterialTheme.typography.headlineMedium,
                    color = TextHeadingDark
                )
                
                Text(
                    text = "Let's keep the momentum going.",
                    color = FigmaGray600,
                    fontSize = 14.sp,
                    modifier = Modifier.padding(top = 8.dp, bottom = 32.dp)
                )

                Text(
                    text = "Email",
                    color = TextHeadingDark,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                StudyLifeTextField(
                    value = email,
                    onValueChange = { email = it },
                    placeholder = "Email",
                    isLightMode = true
                )

                Spacer(modifier = Modifier.height(16.dp))

                Text(
                    text = "Password",
                    color = TextHeadingDark,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                StudyLifeTextField(
                    value = password,
                    onValueChange = { password = it },
                    placeholder = "Password",
                    isLightMode = true
                )

                Text(
                    text = "Forgot Password?",
                    color = EmeraldMid,
                    fontSize = 12.sp,
                    textAlign = TextAlign.End,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 8.dp)
                        .clickable { /* Handle forgot password */ }
                )

                Spacer(modifier = Modifier.height(32.dp))

                StudyLifeButton(
                    text = "Continue",
                    onClick = onSignInClick
                )

                Spacer(modifier = Modifier.height(24.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Box(modifier = Modifier.weight(1f).height(1.dp).background(BorderLight))
                    Text(
                        text = "or sign in with",
                        color = FigmaGray400,
                        fontSize = 12.sp,
                        modifier = Modifier.padding(horizontal = 16.dp)
                    )
                    Box(modifier = Modifier.weight(1f).height(1.dp).background(BorderLight))
                }

                Spacer(modifier = Modifier.height(24.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    SocialLoginButton(text = "🍎", modifier = Modifier.weight(1f), isLightMode = true)
                    SocialLoginButton(text = "G", modifier = Modifier.weight(1f), isLightMode = true)
                }

                Spacer(modifier = Modifier.weight(1f))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.Center
                ) {
                    Text(text = "Don't have an account? ", color = FigmaGray600, fontSize = 14.sp)
                    Text(
                        text = "Sign up",
                        color = EmeraldMid,
                        fontSize = 14.sp,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.clickable { onSignUpClick() }
                    )
                }
            }
        }
    }
}

@Composable
fun SocialLoginButton(text: String, modifier: Modifier = Modifier, isLightMode: Boolean = false) {
    val borderColor = if (isLightMode) BorderLight else BorderGray
    val textColor = if (isLightMode) TextHeadingDark else TextWhite

    Box(
        modifier = modifier
            .clip(RoundedCornerShape(8.dp))
            .border(1.dp, borderColor, RoundedCornerShape(8.dp))
            .padding(vertical = 12.dp),
        contentAlignment = Alignment.Center
    ) {
        Text(text = text, color = textColor, fontSize = 20.sp)
    }
}

@androidx.compose.ui.tooling.preview.Preview(showBackground = true)
@Composable
fun SignInScreenPreview() {
    com.example.mystudylife.ui.theme.MyStudyLifeTheme {
        SignInScreen(onSignInClick = {}, onSignUpClick = {})
    }
}
