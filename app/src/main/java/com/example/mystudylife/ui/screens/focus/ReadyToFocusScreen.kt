package com.example.mystudylife.ui.screens.focus

import androidx.compose.foundation.background
import androidx.compose.foundation.border
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
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.components.PersonaCard
import com.example.mystudylife.ui.components.StudyLifeButton
import com.example.mystudylife.ui.theme.*

@Composable
fun ReadyToFocusScreen(
    onContinueClick: () -> Unit
) {
    var selectedPersona by remember { mutableStateOf("High School") }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(BackgroundDark)
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Main Card
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
                    .premiumCardShadow()
                    .background(Color.White)
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(24.dp)
                ) {
                    // Top Illustration Section
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(140.dp)
                            .clip(RoundedCornerShape(12.dp))
                            .background(Color(0xFFF8FAFC)),
                        contentAlignment = Alignment.Center
                    ) {
                        Text(text = "💡📋✨", fontSize = 48.sp)
                    }

                    Spacer(modifier = Modifier.height(24.dp))

                    Text(
                        text = "What kind of student are you?",
                        style = MaterialTheme.typography.headlineMedium,
                        color = TextHeadingDark,
                        lineHeight = 32.sp
                    )
                    
                    Text(
                        text = "So we can build your planner around the way you learn.",
                        color = FigmaGray600,
                        fontSize = 14.sp,
                        modifier = Modifier.padding(top = 12.dp, bottom = 24.dp)
                    )

                    Column(
                        verticalArrangement = Arrangement.spacedBy(12.dp),
                        modifier = Modifier.weight(1f)
                    ) {
                        PersonaCard(
                            title = "Middle School",
                            isSelected = selectedPersona == "Middle School",
                            onSelect = { selectedPersona = "Middle School" },
                            isLightMode = true
                        )
                        PersonaCard(
                            title = "High School",
                            isSelected = selectedPersona == "High School",
                            onSelect = { selectedPersona = "High School" },
                            isLightMode = true
                        )
                        PersonaCard(
                            title = "University",
                            isSelected = selectedPersona == "University",
                            onSelect = { selectedPersona = "University" },
                            isLightMode = true
                        )
                        PersonaCard(
                            title = "Other",
                            isSelected = selectedPersona == "Other",
                            onSelect = { selectedPersona = "Other" },
                            isLightMode = true
                        )
                    }

                    Spacer(modifier = Modifier.height(24.dp))

                    StudyLifeButton(
                        text = "Continue",
                        onClick = onContinueClick
                    )
                }
            }
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
