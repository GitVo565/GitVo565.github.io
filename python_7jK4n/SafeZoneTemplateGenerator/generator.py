"""
SafeZoneTemplateGenerator — generates transparent PNG overlays that mark
UI avoidance zones for vertical (9:16) video platforms.

Supported platforms: Instagram Reels, TikTok, YouTube Shorts.
"""

from PIL import Image, ImageDraw, ImageFont

WIDTH = 1080
HEIGHT = 1920

PLATFORMS = {
    "instagram": {
        "label": "Instagram Reels",
        "filename": "ig_safe_zone_overlay.png",
        "top": 210,
        "bottom": 400,
        "right": 100,
        "left": 0,
    },
    "tiktok": {
        "label": "TikTok",
        "filename": "tiktok_safe_zone_overlay.png",
        "top": 130,
        "bottom": 350,
        "right": 120,
        "left": 60,
    },
    "youtube": {
        "label": "YouTube Shorts",
        "filename": "yt_shorts_safe_zone_overlay.png",
        "top": 150,
        "bottom": 400,
        "right": 150,
        "left": 0,
    },
}

AVOID_COLOR = (255, 0, 0, 80)
SAFE_OUTLINE_COLOR = (0, 255, 0, 255)
SAFE_OUTLINE_WIDTH = 5
LABEL_COLOR = (255, 255, 255, 200)


def _center_text(draw, text, bbox, font):
    """Return (x, y) to center *text* inside the rectangle *bbox*."""
    x1, y1, x2, y2 = bbox
    tw = draw.textlength(text, font=font)
    tx = x1 + (x2 - x1 - tw) / 2
    ty = y1 + (y2 - y1 - font.size) / 2
    return int(tx), int(ty)


def generate_safe_zone_template(platform: str, output_path: str | None = None) -> str:
    """Generate a safe-zone overlay PNG for *platform* and return the output path."""
    preset = PLATFORMS[platform]
    if output_path is None:
        output_path = preset["filename"]

    top = preset["top"]
    bot = preset["bottom"]
    right = preset["right"]
    left = preset["left"]

    img = Image.new("RGBA", (WIDTH, HEIGHT), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)

    try:
        font = ImageFont.truetype("arial.ttf", 36)
    except OSError:
        font = ImageFont.load_default(size=36)

    # --- Avoidance zones (semi-transparent red) ---

    # Top zone
    if top > 0:
        draw.rectangle([0, 0, WIDTH, top], fill=AVOID_COLOR)
        pos = _center_text(draw, "TOP UI — AVOID", (0, 0, WIDTH, top), font)
        draw.text(pos, "TOP UI — AVOID", fill=LABEL_COLOR, font=font)

    # Bottom zone
    if bot > 0:
        draw.rectangle([0, HEIGHT - bot, WIDTH, HEIGHT], fill=AVOID_COLOR)
        pos = _center_text(
            draw, "BOTTOM UI — AVOID", (0, HEIGHT - bot, WIDTH, HEIGHT), font
        )
        draw.text(pos, "BOTTOM UI — AVOID", fill=LABEL_COLOR, font=font)

    # Right zone (between top and bottom zones)
    if right > 0:
        draw.rectangle([WIDTH - right, top, WIDTH, HEIGHT - bot], fill=AVOID_COLOR)
        label = "RIGHT UI — AVOID"
        rx1, ry1, rx2, ry2 = WIDTH - right, top, WIDTH, HEIGHT - bot
        zone_h = ry2 - ry1
        txt_img = Image.new("RGBA", (int(zone_h), right), (0, 0, 0, 0))
        txt_draw = ImageDraw.Draw(txt_img)
        tw = txt_draw.textlength(label, font=font)
        tx = (zone_h - tw) / 2
        ty = (right - font.size) / 2
        txt_draw.text((int(tx), int(ty)), label, fill=LABEL_COLOR, font=font)
        txt_img = txt_img.rotate(90, expand=True)
        img.paste(txt_img, (rx1, ry1), txt_img)

    # Left zone (TikTok has one)
    if left > 0:
        draw.rectangle([0, top, left, HEIGHT - bot], fill=AVOID_COLOR)
        label = "LEFT UI — AVOID"
        lx1, ly1, lx2, ly2 = 0, top, left, HEIGHT - bot
        zone_h = ly2 - ly1
        txt_img = Image.new("RGBA", (int(zone_h), left), (0, 0, 0, 0))
        txt_draw = ImageDraw.Draw(txt_img)
        tw = txt_draw.textlength(label, font=font)
        tx = (zone_h - tw) / 2
        ty = (left - font.size) / 2
        txt_draw.text((int(tx), int(ty)), label, fill=LABEL_COLOR, font=font)
        txt_img = txt_img.rotate(-90, expand=True)
        img.paste(txt_img, (lx1, ly1), txt_img)

    # --- Safe zone outline (green) ---
    draw.rectangle(
        [left, top, WIDTH - right, HEIGHT - bot],
        outline=SAFE_OUTLINE_COLOR,
        width=SAFE_OUTLINE_WIDTH,
    )

    # Platform + safe-zone dimensions label centered in safe area
    safe_w = WIDTH - left - right
    safe_h = HEIGHT - top - bot
    info = f"{preset['label']}  •  Safe Zone {safe_w}×{safe_h}px"
    pos = _center_text(draw, info, (left, top, WIDTH - right, HEIGHT - bot), font)
    draw.text(pos, info, fill=(0, 255, 0, 180), font=font)

    img.save(output_path, "PNG")
    print(f"[{preset['label']}] Generated: {output_path}")
    return output_path


if __name__ == "__main__":
    for platform_key in PLATFORMS:
        generate_safe_zone_template(platform_key)
