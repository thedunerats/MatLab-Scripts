%take input from user
plaintext = input('please enter a message for encryption: ', 's');

%remove spaces
[textA, spaceindex] = blankout(plaintext);

%convert string to lowercase
[textB, capsindex] = lowercase(textA);

%combine string with indexes
textC = assemble( textB, spaceindex, capsindex );

%encrypt the assembled string
[textD, encryptionkey] = encrypt(textC);

%convert to binary matrix
ciphertext = permutate (textD, encryptionkey);

%save matrix to file
save('cipher.txt','ciphertext', '-ascii');

fprintf('Encryption key is %d \n', encryptionkey)