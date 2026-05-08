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
    title: String,
    isSelected: Boolean,
    onSelect: () -> Unit,
    modifier: Modifier = Modifier,
    isLightMode: Boolean = false
) {
    val textColor = if (isLightMode) Color.Black else TextWhite
    val borderColor = if (isSelected) EmeraldMid else if (isLightMode) Color.LightGray.copy(alpha = 0.5f) else BorderGray

    Row(
        modifier = modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(10.dp))
            .background(if (isSelected) EmeraldMid.copy(alpha = 0.2f) else Color.Transparent)
            .border(
                1.dp,
                borderColor,
                RoundedCornerShape(10.dp)
            )
            .clickable { onSelect() }
            .padding(16.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = title,
            color = textColor,
            fontSize = 16.sp,
            fontWeight = FontWeight.Medium
        )
        
        // Radio button like indicator
        Box(
            modifier = Modifier
                .size(20.dp)
                .clip(RoundedCornerShape(4.dp))
                .background(if (isSelected) EmeraldMid else Color.Transparent)
                .border(1.dp, if (isSelected) EmeraldMid else BorderGray, RoundedCornerShape(4.dp)),
            contentAlignment = Alignment.Center
        ) {
            if (isSelected) {
                Text(text = "✓", color = TextWhite, fontSize = 12.sp)
            }
        }
    }
}
