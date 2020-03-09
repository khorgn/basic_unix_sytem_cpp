from typing import Dict, Iterable, NewType, Tuple
from math import log
import string

def convert_dna_string_to_map(dna_string: str) -> Dict[str, str]:
    letters: Iterable[str] = (x for x in string.ascii_uppercase)
    coupled = zip(letters, dna_string.upper()) # list() to convert it to a list
    return dict(coupled)

def encode_message(cipher: Dict[str, str], message: str) -> str:
    letters: Iterable[str] = iter(message)
    encripted_message = ''.join(map(lambda l: cipher[l] if cipher.get(l) is not None else l, letters))
    return encripted_message

def decode_message(cipher: Dict[str, str], message: str) -> str:
    inverted_cipher = invert_cipher(cipher)
    decripted_message = encode_message(inverted_cipher, message)
    return decripted_message


def invert_cipher(cipher: Dict[str, str]) -> Dict[str, str]:
    return dict([(v, k) for (k, v) in cipher.items()])


UnigramKey = str
BigramKey = Tuple[str, str]

def generate_language_model(content: str) -> Tuple[Dict[UnigramKey, float], Dict[BigramKey, float]]:
    unigrams_count = dict( ((k, 0.0) for k in string.ascii_uppercase) )
    bigrams_count = dict( (((old, curr), 0.0) for old in string.ascii_uppercase for curr in string.ascii_uppercase) )
    
    spaced_content = ''.join(map(lambda x: x if x.isalpha() else ' ', list(content.upper())))
    words = spaced_content.split()
    
    for word in words:
        first_char = word[0]
        if unigrams_count.get(first_char) is None:
                print(first_char)
                print(word)
        unigrams_count[first_char] += 1
        previous_char = first_char
        for char in word[1:]:
            bigrams_count[(previous_char, char)] += 1
            previous_char = char
    
    words_total = len(words)
    unigrams_total = len(unigrams_count)
    unigrams = dict( map(lambda x: (x[0], (x[1]+1) / (words_total + unigrams_total)), unigrams_count.items()) )

    bigrams = dict()
    for (o, c) in bigrams_count:
        bigrams[(o, c)] = (bigrams_count[(o,c)] + 1) / (unigrams_count[o] + unigrams_total)

    return (unigrams, bigrams)

LanguageModel = Tuple[Dict[UnigramKey, float], Dict[BigramKey, float]]

def compute_log_likelihood(model: LanguageModel, message: str) -> float:
    spaced_message = ''.join(map(lambda x: x if x.isalpha() else ' ', list(message.upper())))
    words = spaced_message.split()

    unigrams = model[0]
    bigrams = model[1]
    
    log_likelihood = 0.0

    for word in words:
        first_char = word[0]
        log_likelihood += unigrams[first_char]
        previous_char = first_char
        for char in word[1:]:
            log_likelihood += bigrams[(previous_char, char)]
            previous_char = char

    return log_likelihood

