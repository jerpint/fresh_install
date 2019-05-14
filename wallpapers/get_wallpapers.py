from bs4 import BeautifulSoup
from urllib.request import urlopen, urlretrieve
import re
import random

base_url = "https://unsplash.com"

### Coming soon
#  categories = ['nature/', 'textures-patterns/', 'wallpapers/', 'architecture/']
#  category = categories[random.randint(len(categories))]

html_page = urlopen(base_url)
soup = BeautifulSoup(html_page, features="html5lib")
links = []
for link in soup.findAll('a', attrs={'href':
                                     re.compile("^/photos")}):
    links.append(link.get('href'))

idx = random.randint(0, len(links)-1)

download_link = base_url + links[idx] + '/download?force=true'
print("Link for download: ", download_link)

urlretrieve(download_link, "temp_background.jpg")

print("Background downloaded")

# Set this once in terminal for gnome
# gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/wallpapers/temp_background.jpg
