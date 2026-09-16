import os
import re
import io
import requests
from PIL import Image


# ============================================================
# CHANGE ONLY THIS
# ============================================================

CATEGORY = "places"


# ============================================================
# PEXELS API KEY
# ============================================================

PEXELS_API_KEY = "Q6t2ll2daOQzU1QMcfMG1CSNlC1bURGFrez0OeQ5r4efDdXAdCP1gEOg"


# ============================================================
# PROJECT PATH
# ============================================================

PROJECT_FOLDER = os.path.dirname(
    os.path.abspath(__file__)
)

DART_FILE = os.path.join(
    PROJECT_FOLDER,
    "lib",
    "general",
    f"{CATEGORY}.dart"
)


# ============================================================
# READ DART FILE
# ============================================================

def read_items_from_dart():

    if not os.path.exists(DART_FILE):

        print()
        print("ERROR: Dart file not found:")
        print(DART_FILE)
        print()

        return []

    with open(
        DART_FILE,
        "r",
        encoding="utf-8"
    ) as file:

        content = file.read()

    # Find name + image from each GeneralItem
    pattern = re.compile(
        r"name:\s*['\"]([^'\"]+)['\"].*?"
        r"image:\s*['\"]([^'\"]+)['\"]",
        re.DOTALL
    )

    matches = pattern.findall(content)

    items = []

    for name, image_path in matches:

        # Get exact filename from asset path
        filename = os.path.basename(image_path)

        # Get exact folder from asset path
        folder = os.path.dirname(
            image_path
        )

        items.append({
            "name": name,
            "image_path": image_path,
            "filename": filename,
            "folder": folder,
        })

    return items


# ============================================================
# SEARCH PEXELS
# ============================================================

def search_pexels(query):

    url = "https://api.pexels.com/v1/search"

    headers = {
        "Authorization": PEXELS_API_KEY
    }

    params = {
        "query": query,
        "per_page": 15,
        "orientation": "landscape",
        "size": "medium",
    }

    try:

        response = requests.get(
            url,
            headers=headers,
            params=params,
            timeout=20
        )

        response.raise_for_status()

        data = response.json()

        return data.get("photos", [])

    except Exception as error:

        print(f"    Search error: {error}")

        return []


# ============================================================
# DOWNLOAD IMAGE
# ============================================================

def download_image(
    image_url,
    save_path
):

    try:

        response = requests.get(
            image_url,
            timeout=30,
            headers={
                "User-Agent":
                "Grade4Learning Image Downloader"
            }
        )

        response.raise_for_status()

        image = Image.open(
            io.BytesIO(response.content)
        )

        # Convert to RGB/RGBA
        if image.mode not in (
            "RGB",
            "RGBA"
        ):

            image = image.convert("RGB")

        # Save as real PNG
        image.save(
            save_path,
            "PNG",
            optimize=True
        )

        return True

    except Exception as error:

        print(
            f"    Download error: {error}"
        )

        if os.path.exists(save_path):

            os.remove(save_path)

        return False


# ============================================================
# DOWNLOAD ONE IMAGE
# ============================================================

def download_item(
    item,
    number,
    total
):

    name = item["name"]
    filename = item["filename"]
    asset_folder = item["folder"]

    # Convert asset path to real computer path
    save_folder = os.path.join(
        PROJECT_FOLDER,
        asset_folder
    )

    os.makedirs(
        save_folder,
        exist_ok=True
    )

    save_path = os.path.join(
        save_folder,
        filename
    )

    print()
    print(
        f"[{number}/{total}] {name}"
    )

    print(
        f"    File: {filename}"
    )

    print(
        f"    Folder: {asset_folder}"
    )

    # Skip existing
    if os.path.exists(save_path):

        print(
            "    Already exists - skipped"
        )

        return True

    # Search
    results = search_pexels(
        name
    )

    if not results:

        print(
            "    No image results"
        )

        return False

    # Try multiple results
    for result in results:

        src = result.get(
            "src",
            {}
        )

        image_url = (
            src.get("large")
            or src.get("medium")
            or src.get("original")
        )

        if not image_url:

            continue

        print(
            "    Downloading..."
        )

        if download_image(
            image_url,
            save_path
        ):

            print(
                f"    ✓ Saved: {save_path}"
            )

            return True

    print(
        "    ✗ Could not download"
    )

    return False


# ============================================================
# MAIN
# ============================================================

def main():

    print()
    print("=" * 65)
    print("        GRADE 4 LEARNING IMAGE DOWNLOADER")
    print("=" * 65)

    print()

    print(
        f"Category: {CATEGORY}"
    )

    print(
        f"Dart file: {DART_FILE}"
    )

    # Check API key
    if (
        PEXELS_API_KEY
        == "PASTE_YOUR_PEXELS_API_KEY_HERE"
    ):

        print()
        print(
            "ERROR: Add your Pexels API key."
        )

        return

    # Read Dart file
    items = read_items_from_dart()

    if not items:

        print()
        print(
            "No GeneralItem entries found."
        )

        return

    print()
    print(
        f"Found {len(items)} images in Dart file."
    )

    print()

    for item in items:

        print(
            f"  {item['name']} → "
            f"{item['image_path']}"
        )

    print()

    input(
        "Press ENTER to start downloading..."
    )

    successful = 0
    failed = []

    total = len(items)

    for number, item in enumerate(
        items,
        start=1
    ):

        success = download_item(
            item,
            number,
            total
        )

        if success:

            successful += 1

        else:

            failed.append(
                item["name"]
            )

    # ========================================================
    # SUMMARY
    # ========================================================

    print()
    print("=" * 65)
    print("                 COMPLETE")
    print("=" * 65)

    print()

    print(
        f"Successful : {successful}/{total}"
    )

    print(
        f"Failed     : {len(failed)}"
    )

    if failed:

        print()
        print("Failed:")

        for name in failed:

            print(
                f"  - {name}"
            )

    print()
    print(
        "All images are saved according "
        "to the paths in your Dart file."
    )

    print()


# ============================================================
# START
# ============================================================

if __name__ == "__main__":

    main()