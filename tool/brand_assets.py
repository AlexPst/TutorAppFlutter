"""Generates launcher icon, splash and store graphics for TutorApp.

Usage: python3 tool/brand_assets.py .  (requires Pillow)
Then: dart run flutter_launcher_icons && dart run flutter_native_splash:create
"""
import os
import sys

from PIL import Image, ImageDraw, ImageFont

ROOT = sys.argv[1]
INDIGO = (0x3F, 0x51, 0xB5, 255)
WHITE = (255, 255, 255, 255)
SS = 4  # supersampling factor


def glyph_mask(size, half_width):
    """Mortarboard (graduation cap) mask, centered, `half_width` px wide/2."""
    big = size * SS
    s = half_width * SS / 320.0  # glyph is designed with half width 320
    cx = cy = big / 2

    def p(x, y):  # design coords are centered on (0, 0)
        return (cx + x * s, cy + y * s)

    m = Image.new("L", (big, big), 0)
    d = ImageDraw.Draw(m)
    board = [p(-320, -82), p(0, -222), p(320, -82), p(0, 58)]
    # Cap body: rectangle + rounded bottom.
    d.rectangle([p(-172, -40), p(172, 118)], fill=255)
    d.ellipse([p(-172, 60), p(172, 178)], fill=255)
    # Gap between board and body.
    gap = 26 * s
    d.polygon(board, fill=0)
    d.line(board + [board[0]], fill=0, width=int(gap * 2), joint="curve")
    d.polygon(board, fill=255)
    # Tassel hanging from the right side of the board.
    d.line([p(262, -56), p(262, 92)], fill=255, width=int(20 * s))
    d.rounded_rectangle([p(240, 80), p(284, 168)], radius=14 * s, fill=255)
    return m.resize((size, size), Image.LANCZOS)


def glyph_image(size, half_width, color=WHITE, background=None):
    img = Image.new("RGBA", (size, size), background or (0, 0, 0, 0))
    img.paste(Image.new("RGBA", (size, size), color), (0, 0),
              glyph_mask(size, half_width))
    return img


def rounded_square(size, radius_ratio, color):
    big = size * SS
    m = Image.new("L", (big, big), 0)
    ImageDraw.Draw(m).rounded_rectangle(
        [0, 0, big - 1, big - 1], radius=int(big * radius_ratio), fill=255)
    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    img.paste(Image.new("RGBA", (size, size), color), (0, 0),
              m.resize((size, size), Image.LANCZOS))
    return img


def circle(size, color):
    big = size * SS
    m = Image.new("L", (big, big), 0)
    ImageDraw.Draw(m).ellipse([0, 0, big - 1, big - 1], fill=255)
    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    img.paste(Image.new("RGBA", (size, size), color), (0, 0),
              m.resize((size, size), Image.LANCZOS))
    return img


def save(img, *parts):
    path = os.path.join(ROOT, *parts)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    img.save(path, optimize=True)
    print("wrote", os.path.relpath(path, ROOT), img.size)


# Launcher: legacy icon (Android 7) — rounded square.
legacy = rounded_square(1024, 0.22, INDIGO)
legacy.alpha_composite(glyph_image(1024, 300))
save(legacy, "assets", "icon", "icon.png")

# Adaptive icon layers (Android 8+). Safe zone is a circle of 66/108 of the
# canvas, so the glyph must stay within ~0.3 of the size from the center.
save(glyph_image(1024, 230), "assets", "icon", "foreground.png")
save(glyph_image(1024, 230), "assets", "icon", "monochrome.png")

# Splash, Android 12+: icon inside a 640px circle of a 960px canvas.
save(glyph_image(960, 200), "assets", "splash", "splash_android12.png")
# Splash, Android 7–11: round badge, shown at 128dp (xxxhdpi = 512px).
badge = circle(512, INDIGO)
badge.alpha_composite(glyph_image(512, 150))
save(badge, "assets", "splash", "splash.png")

# Store: 512×512 square icon (the store applies its own mask).
store = Image.new("RGBA", (512, 512), INDIGO)
store.alpha_composite(glyph_image(512, 150))
save(store, "docs", "store", "icon-512.png")

# Store: Google Play feature graphic 1024×500.
fg = Image.new("RGBA", (1024, 500), INDIGO)
g = glyph_image(500, 130)
fg.alpha_composite(g, (10, 0))
font_paths = [
    "/usr/share/fonts/ttf/dejavu/DejaVuSans-Bold.ttf",
    "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
]
font_path = next((f for f in font_paths if os.path.exists(f)), None)
if font_path is None:
    sys.exit("DejaVuSans-Bold.ttf not found")
d = ImageDraw.Draw(fg)
d.text((430, 205), "Репетитор", font=ImageFont.truetype(font_path, 80),
       fill=WHITE, anchor="lm")
d.text((434, 290), "ученики · расписание · оплаты",
       font=ImageFont.truetype(font_path.replace("-Bold", ""), 30),
       fill=(255, 255, 255, 220), anchor="lm")
save(fg.convert("RGB"), "docs", "store", "feature-graphic.png")
