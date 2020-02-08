%load matrix from file
load('cipher2.txt', '-ascii')

%take encryption key from user
key=input('Enter the value of the encryption key: ');
cipher2 = cipher2 - 48;
%convert the entire matrix into a binary string
cipher2 = num2str(cipher2);

%convert matrix to string
textD = unpermutate(cipher2,key);

%decrypt string
textC=decrypt(textD, key);

%disassemble string
[textB,spaceindex,capsindex]=disassemble(textC);

%re-add capital letters
textA = addcaps(textB, capsindex);

%re-add spaces
plaintext = addspaces(textA, spaceindex);

disp(plaintext)