package com.example.mystudylife.ui.components

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mystudylife.ui.theme.BorderGray
import com.example.mystudylife.ui.theme.EmeraldMid
import com.example.mystudylife.ui.theme.TextWhite

@Composable
fun PersonaCard(
    emoji: String,
    title: String,
    isSelected: Boolean,
    onSelect: () -> Unit,
    modifier: Modifier = Modifier
) {
    val borderColor = if (isSelected) EmeraldMid else Color.LightGray.copy(alpha = 0.3f)
    val backgroundColor = if (isSelected) EmeraldMid.copy(alpha = 0.1f) else Color.White

    Column(
        modifier = modifier
            .clip(RoundedCornerShape(14.dp))
            .background(backgroundColor)
            .border(2.dp, borderColor, RoundedCornerShape(14.dp))
            .clickable { onSelect() }
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Box(
            modifier = Modifier
                .size(56.dp)
                .clip(RoundedCornerShape(12.dp))
                .background(if (isSelected) EmeraldMid.copy(alpha = 0.2f) else Color(0xFFF8FAFC)),
            contentAlignment = Alignment.Center
        ) {
            Text(text = emoji, fontSize = 28.sp)
        }
        
        Spacer(modifier = Modifier.height(12.dp))
        
        Text(
            text = title,
            color = if (isSelected) EmeraldMid else Color(0xFF1E293B),
            fontSize = 14.sp,
            fontWeight = FontWeight.Bold
        )
    }
}
