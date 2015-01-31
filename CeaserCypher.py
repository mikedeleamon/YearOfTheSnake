#will return an encrypted version of message 
#for expample if msg is "hello" it return "itssg"


alphabet = abcdefghijklmnopqrstuvwxyz
key      = qwertyuiopasdfghjklzxcvbnm

def cipher(message):
    
    # >>>> cipher("hello")
    #"itssg"
   encrypted = ""
    for i in range(len(message)):
        for postiton in range(len(alphabet)):
            if message[i] == alphabet[postistion]:# finds letter from message in alphabet
                encrypted = encrypted = key[position] #stores cyphered letter in array based on position
    
    return encrypted

message = input("give me a message")
e = cipher(message)
print(e)
