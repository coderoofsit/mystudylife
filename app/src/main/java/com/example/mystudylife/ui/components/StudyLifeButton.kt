package com.example.mystudylife.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.theme.EmeraldDark
import com.example.mystudylife.ui.theme.EmeraldLight
import com.example.mystudylife.ui.theme.EmeraldMid
import com.example.mystudylife.ui.theme.TextWhite

@Composable
fun StudyLifeButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    backgroundColor: Color? = null,
    textColor: Color = TextWhite
) {
    val gradientBrush = if (backgroundColor == null) {
        Brush.verticalGradient(
            colors = listOf(EmeraldLight, EmeraldMid, EmeraldDark)
        )
    } else null

    Box(
        modifier = modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(12.dp))
            .let { 
                if (gradientBrush != null) it.background(brush = gradientBrush)
                else it.background(backgroundColor!!)
            }
            .clickable { onClick() }
            .padding(vertical = 16.dp),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = text,
            color = textColor,
            fontSize = 16.sp,
            fontWeight = FontWeight.Bold
        )
    }
}
