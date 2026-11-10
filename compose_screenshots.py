import os
from PIL import Image, ImageDraw, ImageFont

docs_dir = r'd:\Praktikun Flutter\docs'

def add_corners(im, rad):
    circle = Image.new('L', (rad * 2, rad * 2), 0)
    draw = ImageDraw.Draw(circle)
    draw.ellipse((0, 0, rad * 2 - 1, rad * 2 - 1), fill=255)
    alpha = Image.new('L', im.size, 255)
    w, h = im.size
    alpha.paste(circle.crop((0, 0, rad, rad)), (0, 0))
    alpha.paste(circle.crop((rad, 0, rad * 2, rad)), (w - rad, 0))
    alpha.paste(circle.crop((0, rad, rad, rad * 2)), (0, h - rad))
    alpha.paste(circle.crop((rad, rad, rad * 2, rad * 2)), (w - rad, h - rad))
    im.putalpha(alpha)
    return im

def style_screen(im_path, target_w=380, target_h=780):
    raw = Image.open(im_path).convert('RGBA')
    resized = raw.resize((target_w, target_h), Image.Resampling.LANCZOS)
    styled = add_corners(resized, 14)
    
    card = Image.new('RGBA', (target_w + 4, target_h + 4), (0, 0, 0, 0))
    draw = ImageDraw.Draw(card)
    # Subtle border
    draw.rounded_rectangle([0, 0, target_w + 3, target_h + 3], radius=16, outline=(203, 213, 225, 255), width=2)
    card.paste(styled, (2, 2), styled)
    return card

# 1. Compose Tugas 1 (Hello World)
card1 = style_screen(os.path.join(docs_dir, 'raw_hello.png'), 400, 820)
bg1 = Image.new('RGB', (card1.width + 40, card1.height + 40), (248, 250, 252))
bg1.paste(card1, (20, 20), card1)
bg1.save(os.path.join(docs_dir, 'tugas-1.png'))
print('tugas-1.png generated:', bg1.size)

# 2. Compose Tugas 2 (Column & Row)
card2_1 = style_screen(os.path.join(docs_dir, 'raw_column.png'), 380, 780)
card2_2 = style_screen(os.path.join(docs_dir, 'raw_row.png'), 380, 780)
bg2_w = 24 + card2_1.width + 24 + card2_2.width + 24
bg2_h = card2_1.height + 48
bg2 = Image.new('RGB', (bg2_w, bg2_h), (248, 250, 252))
bg2.paste(card2_1, (24, 24), card2_1)
bg2.paste(card2_2, (24 + card2_1.width + 24, 24), card2_2)
bg2.save(os.path.join(docs_dir, 'tugas-2.png'))
print('tugas-2.png generated:', bg2.size)

# 3. Compose Tugas 3 (Login & Home)
login_src = 'test_typed.png' if os.path.exists(os.path.join(docs_dir, 'test_typed.png')) else 'raw_login_modul3.png'
card3_1 = style_screen(os.path.join(docs_dir, login_src), 380, 780)
card3_2 = style_screen(os.path.join(docs_dir, 'home_after_login.png'), 380, 780)
bg3_w = 24 + card3_1.width + 24 + card3_2.width + 24
bg3_h = card3_1.height + 48
bg3 = Image.new('RGB', (bg3_w, bg3_h), (248, 250, 252))
bg3.paste(card3_1, (24, 24), card3_1)
bg3.paste(card3_2, (24 + card3_1.width + 24, 24), card3_2)
bg3.save(os.path.join(docs_dir, 'tugas-3.png'))
print('tugas-3.png generated:', bg3.size)

# 4. Compose Tugas 4 (CRUD Toko Kita: List Produk, Detail Produk, Form Tambah Produk, Registrasi)
card4_1 = style_screen(os.path.join(docs_dir, 'm4_produk_list.png'), 350, 720)
card4_2 = style_screen(os.path.join(docs_dir, 'm4_produk_detail.png'), 350, 720)
card4_3 = style_screen(os.path.join(docs_dir, 'm4_produk_form.png'), 350, 720)
card4_4 = style_screen(os.path.join(docs_dir, 'm4_registrasi.png'), 350, 720)

gap = 20
bg4_w = gap + (card4_1.width + gap) * 4
bg4_h = card4_1.height + gap * 2
bg4 = Image.new('RGB', (bg4_w, bg4_h), (248, 250, 252))
bg4.paste(card4_1, (gap, gap), card4_1)
bg4.paste(card4_2, (gap + (card4_1.width + gap), gap), card4_2)
bg4.paste(card4_3, (gap + (card4_1.width + gap) * 2, gap), card4_3)
bg4.paste(card4_4, (gap + (card4_1.width + gap) * 3, gap), card4_4)
bg4.save(os.path.join(docs_dir, 'tugas-4.png'))
print('tugas-4.png generated:', bg4.size)
