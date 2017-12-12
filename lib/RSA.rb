require 'prime'


class RSA

   def initialize (n, e, d)
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message
      
      @n = n
      @e = e
      @d = d
   end
   

   def n
      #returns the value of 'n' passed in the initialize
      return @n

   end
   
   def e
      #returns the value of 'e' passed in the initialize
      return @e
   end
   
   def d
      #returns the value of 'd' passed in the initialize
      return @d
   end
   
   def new_key
      #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned.
      
    keys = Array.new(3)

    p = 0 
    q = 0
    d = 0

    while Prime.prime?(p) != true && Prime.prime?(q) != true
      p = rand(100..999)
      q = rand(100..999)
    end

    n = p*q
    keys[0] = n

    alpha = (p - 1).lcm(q - 1)

    e = rand(1..alpha)

    while e.gcd(alpha) != 1 do
      e = rand(1..alpha)      
    end
      keys[1] = e

    while ((d * e)%alpha != 1)
      d = d + 1
    end

    keys[2] = d


    return keys


   end
   
   def encrypt message
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.

     return (message.chars.map { |ch|  (ch.ord ** @e % @n)}).join("-")
   end
   
   def decrypt message
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representation and returns the decrypted message. 

      return (message.split("-").map {|c| (c.to_i ** @d % @n).chr }).join("")

   end 
end

