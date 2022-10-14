# frozen_string_literal: false

def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65]
  end
  plaintext_chars.join
end

p encode('theswiftfoxjumpedoverthelazydog', 'secretkey')
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
p decode('EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL', 'secretkey')
# => "theswiftfoxjumpedoverthelazydog"
# rstuv
