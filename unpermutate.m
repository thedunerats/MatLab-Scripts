function [OrigString] = unpermutate(MirrorMat,Key)
%unpermutate: undoes the permutate
%flips the mirrored matrix back to its form, untransposes
%and gives back original string
if rem(Key,2) == 0 %even key
    MirrorMat = flipud(MirrorMat); %vertical mirror flip
else
    MirrorMat = fliplr(MirrorMat); %horizontal mirror flip
end
OrigString = bin2dec(MirrorMat);
OrigString = OrigString';
OrigString = char(OrigString);
end