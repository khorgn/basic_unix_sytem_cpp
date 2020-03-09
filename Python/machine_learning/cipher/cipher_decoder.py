from cipher_utils import *
import string
import random
# from urllib.request import urlopen

dataset_url = 'https://lazyprogrammer.me/course_files/moby_dick.txt'

original_message = '''I then lounged down the street and found,
as I expected, that there was a mews in a lane which runs down
by one wall of the garden. I lent the ostlers a hand in rubbing
down their horses, and received in exchange twopence, a glass of
half-and-half, two fills of shag tobacco, and as much information
as I could desire about Miss Adler, to say nothing of half a dozen
other people in the neighbourhood in whom I was not in the least
interested, but whose biographies I was compelled to listen to.
'''

list_ascii = list(string.ascii_uppercase)
random.shuffle(list_ascii)
real_dna_string_2 = ''.join(list_ascii)

real_dna_string = "FDSQZERAWCXVHIBGYTNJUKLOPM"
cipher = convert_dna_string_to_map(real_dna_string)
encripted_message = encode_message(cipher, original_message)

# f = urlopen (dataset_url)
# myfile = f.read()

with open('moby_dick.txt') as f:
    content = f.read()

model = generate_language_model(content)


