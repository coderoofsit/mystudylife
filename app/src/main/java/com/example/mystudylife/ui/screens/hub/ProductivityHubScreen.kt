package com.example.mystudylife.ui.screens.hub

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.components.FeatureCard
import com.example.mystudylife.ui.components.StudyLifeButton
import com.example.mystudylife.ui.theme.*

data class Feature(val icon: String, val title: String, val color: Color)

@Composable
fun ProductivityHubScreen(
    onContinueClick: () -> Unit
) {
    val features = listOf(
        Feature("📚", "Class", Color(0xFF60A5FA)),
        Feature("📝", "Notes", Color(0xFFF87171)),
        Feature("📋", "Task", Color(0xFFFACC15)),
        Feature("📖", "Exam", Color(0xFFFB923C)),
        Feature("📅", "Plan", Color(0xFF2DD4BF)),
        Feature("🏝", "Holiday", Color(0xFF4ADE80)),
        Feature("📋", "Misc", Color(0xFFA855F7)),
        Feature("⚡", "Xtra", Color(0xFF6366F1)),
        Feature("⏳", "Pomo", Color(0xFFEC4899))
    )

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(BackgroundDark)
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Main Card
            val cardGradient = Brush.verticalGradient(
                colors = listOf(EmeraldLight, EmeraldMid, EmeraldDark)
            )
            
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
                    .premiumCardShadow()
                    .background(brush = cardGradient)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(24.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    LazyVerticalGrid(
                        columns = GridCells.Fixed(3),
                        contentPadding = PaddingValues(0.dp),
                        horizontalArrangement = Arrangement.spacedBy(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp),
                        modifier = Modifier.weight(1f)
                    ) {
                        items(features) { feature ->
                            FeatureCard(
                                icon = feature.icon,
                                title = feature.title,
                                iconBackgroundColor = feature.color
                            )
                        }
                    }

                    Spacer(modifier = Modifier.height(32.dp))

                    Text(
                        text = "The Ultimate Student\nProductivity Hub",
                        color = TextWhite,
                        fontSize = 28.sp,
                        fontWeight = FontWeight.Black,
                        textAlign = TextAlign.Center,
                        lineHeight = 36.sp
                    )
                    
                    Text(
                        text = "Join millions of students around the world who plan smarter, stay focused.",
                        color = TextWhite.copy(alpha = 0.8f),
                        fontSize = 14.sp,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(top = 16.dp, bottom = 40.dp)
                    )

                    StudyLifeButton(
                        text = "Get Started",
                        onClick = onContinueClick,
                        backgroundColor = Color.White,
                        textColor = EmeraldMid
                    )
                }
            }
        }
    }
}

@androidx.compose.ui.tooling.preview.Preview(showBackground = true)
@Composable
fun ProductivityHubScreenPreview() {
    MyStudyLifeTheme {
        ProductivityHubScreen(onContinueClick = {})
    }
}
