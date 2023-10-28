import pandas as pd
import os

df = pd.read_excel('BlockedSites.xlsx')

username = os.getlogin()

cols = df.columns

blocked_websites = df[[username]].copy()
blocked_websites.dropna(inplace=True)

blocked_websites_str = ""

for website in blocked_websites[username]:
    blocked_websites_str = blocked_websites_str + "\n" + f"127.0.0.1 {website}"

blocked_websites_str=blocked_websites_str.strip()

blocked_websites_str = ""

with open("etc/hosts","w") as file:
    file.write(blocked_websites_str)