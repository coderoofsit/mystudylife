package com.example.mystudylife.ui.screens.focus

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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.components.PersonaCard
import com.example.mystudylife.ui.components.StudyLifeButton
import com.example.mystudylife.ui.theme.*

@Composable
fun ReadyToFocusScreen(
    onContinueClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.White)
    ) {
        // Top Section: Green Gradient with Floating Card
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .weight(0.4f)
                .background(
                    brush = Brush.verticalGradient(
                        colors = listOf(EmeraldLight, EmeraldMid)
                    )
                ),
            contentAlignment = Alignment.Center
        ) {
            // Floating Clipboard Card
            Box(
                modifier = Modifier
                    .size(width = 240.dp, height = 180.dp)
                    .clip(RoundedCornerShape(24.dp))
                    .border(3.dp, Color.White.copy(alpha = 0.6f), RoundedCornerShape(24.dp))
                    .background(Color.White.copy(alpha = 0.1f)),
                contentAlignment = Alignment.Center
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(text = "📋", fontSize = 64.sp)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(text = "✨", fontSize = 48.sp)
                }
            }
            
            // Decorative Icons (Lightbulb and Chat)
            Text(
                text = "💡", 
                fontSize = 24.sp, 
                modifier = Modifier.align(Alignment.CenterStart).padding(start = 40.dp, bottom = 80.dp)
            )
            Text(
                text = "💬", 
                fontSize = 24.sp, 
                modifier = Modifier.align(Alignment.CenterEnd).padding(end = 40.dp, bottom = 80.dp)
            )
        }

        // Bottom Section: White area with Content
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .weight(0.6f)
                .padding(24.dp)
        ) {
            // Logo + Name
            Row(verticalAlignment = Alignment.CenterVertically) {
                Box(
                    modifier = Modifier
                        .size(32.dp)
                        .clip(RoundedCornerShape(8.dp))
                        .background(EmeraldMid),
                    contentAlignment = Alignment.Center
                ) {
                    Text(text = "🎓", fontSize = 18.sp)
                }
                Spacer(modifier = Modifier.width(12.dp))
                Text(
                    text = "My Study Life",
                    color = Color.Black,
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold
                )
            }

            Spacer(modifier = Modifier.height(24.dp))

            Text(
                text = "Ready to stay focused, get organized, and achieve more?",
                color = Color.Black,
                fontSize = 28.sp,
                fontWeight = FontWeight.Black,
                lineHeight = 36.sp
            )

            Spacer(modifier = Modifier.height(16.dp))

            Text(
                text = "Beat procrastination, stay on track, and study smarter - with the productivity tool trusted by over 24 million students worldwide.",
                color = Color.Gray,
                fontSize = 15.sp,
                lineHeight = 22.sp
            )

            Spacer(modifier = Modifier.weight(1f))

            // Buttons
            StudyLifeButton(
                text = "I'm a student",
                onClick = onContinueClick,
                backgroundColor = EmeraldMid,
                textColor = Color.White
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Outlined Button for Parent/Guardian
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(12.dp))
                    .border(2.dp, EmeraldMid, RoundedCornerShape(12.dp))
                    .clickable { onContinueClick() }
                    .padding(vertical = 16.dp),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = "I'm a parent/guardian",
                    color = EmeraldMid,
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold
                )
            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@androidx.compose.ui.tooling.preview.Preview(showBackground = true)
@Composable
fun ReadyToFocusScreenPreview() {
    MyStudyLifeTheme {
        ReadyToFocusScreen(onContinueClick = {})
    }
}
