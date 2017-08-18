
var tmp_alpha;
tmp_alpha = min(v_formAlpha, v_formExtAlpha);

alg("center")
fnt(fntPixelBig);
clr(-1, tmp_alpha);
draw_text(v_formBaseMaxX + (v_slotOffsetX * v_slotsPerRow) / 2 + (v_slotSize * 4.5) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 16, __("Crafting"));
fnt();
alg();

// Draw selection menu
for (var i = 0; i < array_height_2d(v_craftingForms); i++)
{
	for (var j = 0; j < 6; j++)
	{
		var tmp_textureX, tmp_textureY;
			
		if (v_craftingForms[i, 4])
		{
			tmp_textureX = 633;
			tmp_textureY = 24;
				
			if (j == 0) {tmp_textureX = 633;}
			else if (j == 5) {tmp_textureX = 716;}
			else {tmp_textureX = 675;}
		}
		else
		{
			tmp_textureY = 426;
			tmp_textureX = 550;
				
			if (j == 0) {tmp_textureX = 550;}
			else if (j == 5) {tmp_textureX = 633;}
			else {tmp_textureX = 592;}
		}
			
		if (tmp_alpha > 0.02) {draw_sprite_part_ext(v_inventorySprite, 0, tmp_textureX, tmp_textureY, 40, 28, v_formBaseMaxX + v_slotSize + (j * 40) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 48 + (30 * i) - v_craftingForms[i, 3], 1, 1, c_white, min(tmp_alpha, v_craftingForms[i, 2]));}
	}
		
	var tmp_fadeAlpha;
	tmp_fadeAlpha = 1;
		
	if (!v_craftingForms[i, 4]) 
	{
		tmp_fadeAlpha = 0.3;
		draw_sprite_part_ext(v_inventorySprite, 0, 552, 457, 13, 17, v_formBaseMaxX + v_slotSize + (3 * 40) + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 52 + (30 * i) - v_craftingForms[i, 3], 1, 1, c_white, min(tmp_alpha, v_craftingForms[i, 2]));		
	}
		
	alg("center");
	clr(-1, min(tmp_alpha, v_craftingForms[i, 2], tmp_fadeAlpha));
	if (tmp_alpha > 0.02) {draw_text(v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2) + 40 * 3 + v_craftingForms[i, 1], v_drawStartY + 60 + (30 * i) - v_craftingForms[i, 3], v_craftingForms[i, 0]);}
	clr();
	alg();
		
	if (point_in_rectangle(mouse_x, mouse_y, v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2), v_drawStartY + 48 + (30 * i) - v_craftingForms[i, 3], v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2) + 6 * 40, v_drawStartY + 48 + (30 * i) + 24 - v_craftingForms[i, 3]) && v_craftingForms[i, 4])
	{
		if (v_selectedForm != i && v_craftingForms[i, 2] >= 0.98) {v_craftingForms[i, 1] = min(lerp(v_craftingForms[i, 1], 18, 0.1), 16);} 
		else {v_craftingForms[i, 1] = max(lerp(v_craftingForms[i, 1], -2, 0.1), 0);}
			
		if (mouse_check_button_pressed(mb_left))
		{
			if (v_selectedForm == -1) {v_selectedForm = i;}
			else {if (i == v_selectedForm) {v_selectedForm = -1;}}
		}
	}
	else {v_craftingForms[i, 1] = max(lerp(v_craftingForms[i, 1], -2, 0.1), 0);}
		
	if (v_selectedForm != -1)
	{
		if (v_selectedForm != i)
		{
			v_craftingForms[i, 2] = max(lerp(v_craftingForms[i, 2], -0.2, 0.1), 0);
			v_craftingForms[i, 3] = lerp(v_craftingForms[i, 3], 0, 0.1);
		}
		else
		{
			v_craftingForms[i, 3] = min(lerp(v_craftingForms[i, 3], 30 * (i + 0.5) + 2, 0.1), 30 * (i + 0.5));
		}
	}
	else
	{
		v_craftingForms[i, 3] = lerp(v_craftingForms[i, 3], 0, 0.1);
		if (v_craftingForms[i, 3] < 1) {v_craftingForms[i, 2] = min(lerp(v_craftingForms[i, 2], 1.2, 0.1), 1);}
	}
}

// Draw selected subform

// Item crafting
if (v_selectedForm == 0)
{
	var tmp_drawX, tmp_drawY, tmp_sx, tmp_sy, tmp_slotsRenderedNow, tmp_currentRow, tmp_offsetHelp;
	tmp_drawX = v_formBaseMaxX + v_slotSize + v_formExtAlpha * (v_slotSize / 2);
	tmp_drawY = v_drawStartY + 96;
	tmp_sx = tmp_drawX;
	tmp_sy = tmp_drawY;
	tmp_slotsRenderedNow = 0;
	tmp_currentRow = 0;
	tmp_offsetHelp = oHUD.v_hudSlotX;
	
	for (var i = 0; i < 30; i++)
	{
		if (tmp_currentRow == 0)
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 5 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		else if (tmp_currentRow == (v_slotRows - v_expandSlotsY - 1))
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 6 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 76, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		else
		{
			if (tmp_slotsRenderedNow == 0)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
			}
			else if (tmp_slotsRenderedNow == 6 - 1)
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 76, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);		
			}
			else
			{
				draw_sprite_part(v_inventorySprite, 0, tmp_offsetHelp + 38, oHUD.v_hudSlotY + 38, 38, 38, tmp_drawX, tmp_drawY);
			}
		}
		
		tmp_slotsRenderedNow++;
		if (tmp_slotsRenderedNow >= 6)
		{		
			tmp_drawX = tmp_sx;
			tmp_drawY += (v_slotSize + 6);
			tmp_slotsRenderedNow = 0;
			tmp_currentRow++;
		}
		else
		{
			tmp_drawX += (v_slotSize + 6);
		}
	}
}
