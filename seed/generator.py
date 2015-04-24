import os, random, string

charset = string.ascii_letters + string.digits
random.seed = (os.urandom(1024))

def generate(length = 8):
    return ''.join(random.choice(charset) for i in range(length))

with open("upacm_members.csv", "r") as file:
    entries = file.read().split("\r")

for i in xrange(len(entries)):
    entries[i] = entries[i] + ',' + generate(15) + random.choice('!@#$%^&*()')

with open("generated.csv", "w") as file:
    file.write("\n".join(entries))
