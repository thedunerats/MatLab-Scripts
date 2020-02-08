function GeneMaker
%GeneMaker:generates a random line of sample codons (random DNA sample)
%the length of the DNA strand is determined by a user
%persists until the uder enters a multiple of 3 
StrandLength = input('Please enter a multiple of 3: '); 
while rem(StrandLength,3) ~= 0 %if not a multiple of 3
    disp('That is not a valid input!') %get a new value
    StrandLength = input('Please enter a multiple of 3: '); 
end %end mpersistent loop

%now set the possible codons for the gene pool
Codons = 'ACGT';
RandCode = randi([1,4],1,3); %index values
NewCode = Codons(RandCode);
%initialize a DNA strand
DNAStrand = NewCode;

%now concatenate it all together using the length specified
if StrandLength ~= 3 %will not enter if 3 is entered
    for k = 1:(StrandLength/3) - 1 %n/3 iterations
        RandCode = randi([1,4],1,3); % get new index values
        LoopNewCode = Codons(RandCode);
        %initialize a DNA strand
        DNAStrand = [DNAStrand LoopNewCode]; %keep concatenating the string until
        %finished
    end %end for loop
end %end if
fprintf('Your gene sequence is: %s \n',DNAStrand) %display generated strand
%find how many A's are in it
Position = DNAStrand == 'A'; %will give 1 wherever an A is present
ATot = sum(Position,2); %get numbers of As
fprintf('The gene contains %d As.\n',ATot) %display generated strand
end %end function